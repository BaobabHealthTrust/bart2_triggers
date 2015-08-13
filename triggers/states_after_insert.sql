DELIMITER $$
DROP TRIGGER IF EXISTS `states_after_insert`$$
CREATE TRIGGER `states_after_insert` AFTER INSERT 
ON `patient_state`
FOR EACH ROW
BEGIN

    SET @patient_id = (SELECT patient_id FROM patient_program 
                         LEFT OUTER JOIN patient_state ON patient_program.patient_program_id = patient_state.patient_program_id 
                       WHERE patient_program.patient_program_id = new.patient_program_id LIMIT 1);

    SET @state = (SELECT name FROM concept_name 
                    LEFT OUTER JOIN program_workflow_state ON program_workflow_state.concept_id = concept_name.concept_id
                    LEFT OUTER JOIN program_workflow ON program_workflow.program_workflow_id = program_workflow_state.program_workflow_id
                    LEFT OUTER JOIN patient_program ON patient_program.program_id = program_workflow.program_id
                   WHERE program_workflow_state.program_workflow_state_id = new.state 
                   AND patient_program.patient_program_id = new.patient_program_id
                   LIMIT 1);
        
    SET @current_state = (SELECT IFNULL(current_state_for_program(@patient_id,1,new.start_date), 'Unknown') AS state);

    IF @current_state = 'Unknown'  THEN
      SET @current_state_name = "Unknown";
   ELSE
     SET @patient_died_concept_id = (SELECT concept_id FROM concept_name WHERE name = 'Patient died' and voided = 0 LIMIT 1);

     SET @patient_died_states = (SELECT @current_state IN (SELECT program_workflow_state_id FROM program_workflow_state 
                                                           WHERE concept_id = @patient_died_concept_id AND retired = 0));

     IF @patient_died_states = 0 THEN
      SET @current_state_id = @current_state;
     ELSE
      SET @current_state_id = 3;
     END IF;

     SET @current_state_name = (SELECT name FROM concept_name 
              LEFT OUTER JOIN program_workflow_state ON program_workflow_state.concept_id = concept_name.concept_id
              LEFT OUTER JOIN program_workflow ON program_workflow.program_workflow_id = program_workflow_state.program_workflow_id
              LEFT OUTER JOIN patient_program ON patient_program.program_id = program_workflow.program_id
              WHERE program_workflow_state.program_workflow_state_id = @current_state_id
              AND patient_program.patient_program_id = new.patient_program_id LIMIT 1);
   END IF;

      
    SET @on_arv = (SELECT concept_name.concept_id FROM concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'On ARVs' AND voided = 0 AND retired = 0 LIMIT 1);

    
    SET @state_concept = (SELECT concept_id from program_workflow_state where program_workflow_state_id = new.state AND retired = 0 LIMIT 1);
    
    SET @visit = (SELECT COALESCE((SELECT id FROM flat_table2 WHERE patient_id = @patient_id AND DATE(visit_date) = DATE(new.start_date)), 0));
    
    IF @visit = 0 THEN
            
        INSERT INTO flat_table2 (patient_id, visit_date, current_hiv_program_state, 
            current_hiv_program_start_date, current_hiv_program_end_date) 
        VALUES (@patient_id, new.start_date, @current_state_name, new.start_date, new.end_date);
    
    ELSE 
    
        UPDATE flat_table2 SET current_hiv_program_state = @current_state_name, current_hiv_program_start_date = new.start_date,
            current_hiv_program_end_date = new.end_date
        WHERE flat_table2.id = @visit;

    END IF;

		IF @state_concept = @on_arv THEN
		
			SET @start_date = (SELECT earliest_start_date from flat_table1 where patient_id = @patient_id);
			SET @age_at_initiation = (SELECT age_at_initiation FROM earliest_start_date WHERE patient_id = @patient_id);
			SET @age_in_days = (SELECT age_in_days FROM earliest_start_date WHERE patient_id = @patient_id);

			IF @start_date IS NULL THEN

			  UPDATE flat_table1 SET earliest_start_date = new.start_date, age_at_initiation = @age_at_initiation, age_in_days = @age_in_days 
                          WHERE patient_id = @patient_id;
			
			ELSEIF DATE(@start_date) > DATE(new.start_date) THEN
			
			  UPDATE flat_table1 SET earliest_start_date = new.start_date, age_at_initiation = @age_at_initiation, age_in_days = @age_in_days 
                          WHERE patient_id = @patient_id;			
			END IF;
		END IF;

END$$

DELIMITER ;
