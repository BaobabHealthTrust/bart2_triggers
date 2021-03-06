DELIMITER $$

DROP PROCEDURE IF EXISTS `proc_insert_patient_present`$$

CREATE PROCEDURE `proc_insert_patient_present`(
    IN in_patient_id INT, 
    IN in_visit_date DATE, 
    IN in_field_concept INT, 
    IN in_field_text VARCHAR(25),
    IN in_field_value_coded INT,
    IN in_field_value_coded_name_id INT,
    IN in_field_other VARCHAR(25),
    IN in_visit_id INT,
    IN in_field_voided INT,
    IN encounter_id INT
)
BEGIN

    SET @yes = (SELECT concept_name.concept_id FROM concept_name 
                LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE name = "Yes" AND voided = 0 AND retired = 0 LIMIT 1);
    SET @no = (SELECT concept_name.concept_id FROM concept_name 
                LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE name = "No" AND voided = 0 AND retired = 0 LIMIT 1);
    SET @unknown = (SELECT concept_name.concept_id FROM concept_name 
                LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE name = "Unknown" AND voided = 0 AND retired = 0 LIMIT 1);                
    
    CASE in_field_value_coded
    
        WHEN @yes THEN
        
            SET @value = COALESCE((SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id),0);
            
            IF (@value = 0) THEN
              IF (in_field_text = 'Yes') THEN
                SET @value = 'Yes';
              END IF;
            END IF;
            
            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, patient_present_yes, patient_present_yes_enc_id) VALUES (in_patient_id, in_visit_date, @value, encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET patient_present_yes = @value, patient_present_no = NULL, patient_present_yes_enc_id = encounter_id, patient_present_no_enc_id = NULL WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET patient_present_yes = NULL, patient_present_no = NULL, patient_present_yes_enc_id = NULL, patient_present_no_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;
        WHEN @no THEN
        
            SET @value = COALESCE((SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id),0);
            
            IF (@value = 0) THEN
              IF (in_field_text = 'No') THEN
                SET @value = 'No';
              END IF;
            END IF;
            
            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, patient_present_no, patient_present_no_enc_id) VALUES (in_patient_id, in_visit_date, @value, encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET patient_present_no = @value, patient_present_yes = NULL, patient_present_no_enc_id = encounter_id, patient_present_yes_enc_id = NULL WHERE flat_table2.id = in_visit_id;
                  
              END IF;                   
            ELSE
              UPDATE flat_table2 SET patient_present_no = NULL, patient_present_yes = NULL, patient_present_no_enc_id = NULL, patient_present_yes_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;

          WHEN @unknown THEN
        
            SET @value = COALESCE((SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id),0);

            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, patient_present_unknown, patient_present_unknown_enc_id) VALUES (in_patient_id, in_visit_date, @value, encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET patient_present_no = NULL, patient_present_yes = NULL, patient_present_no_enc_id = NULL, patient_present_yes_enc_id = NULL, patient_present_unknown = @value, patient_present_unknown_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;                   
            ELSE
              UPDATE flat_table2 SET patient_present_no = NULL, patient_present_yes = NULL, patient_present_no_enc_id = NULL, patient_present_yes_enc_id = NULL, patient_present_unknown = NULL, patient_present_unknown_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;            
        ELSE
        
            SET @enc_id = encounter_id;                  
    
    END CASE;

    IF (in_field_text = 'YES') THEN
      SET @patient_yes = 'Yes';
    ELSEIF (in_field_text = 'Yes') THEN
      SET @patient_yes = 'Yes';
    ELSEIF (in_field_text = 'NO') THEN
      SET @patient_no = 'No';
    ELSEIF (in_field_text = 'No') THEN
      SET @patient_yes = 'No';
    ELSEIF (in_field_text = 'Unknown') THEN
      SET @patient_unknown = 'Uknown';
    ELSEIF (in_field_text = 'UNKNOWN') THEN
      SET @patient_unknown = 'Uknown';       
    END IF;

    CASE in_field_text

      WHEN @patient_yes THEN

        IF in_field_voided = 0 THEN
          IF in_visit_id = 0 THEN
             INSERT INTO flat_table2 (patient_id, visit_date, patient_present_yes, patient_present_yes_enc_id) VALUES (in_patient_id, in_visit_date, @patient_yes, encounter_id);
           ELSE
             UPDATE flat_table2 SET patient_present_yes = @patient_yes, patient_present_no = NULL, patient_present_yes_enc_id = encounter_id, patient_present_no_enc_id = NULL, patient_present_unknown = NULL, patient_present_unknown_enc_id = NULL WHERE flat_table2.id = in_visit_id;
           END IF;
         ELSE
           UPDATE flat_table2 SET patient_present_yes = NULL, patient_present_no = NULL, patient_present_yes_enc_id = NULL, patient_present_no_enc_id = NULL, patient_present_unknown = NULL, patient_present_unknown_enc_id = NULL WHERE flat_table2.id = in_visit_id;
       END IF;

      WHEN @patient_no THEN

        IF in_field_voided = 0 THEN
          IF in_visit_id = 0 THEN
             INSERT INTO flat_table2 (patient_id, visit_date, patient_present_no, patient_present_no_enc_id) VALUES (in_patient_id, in_visit_date, @patient_no, encounter_id);
           ELSE
             UPDATE flat_table2 SET patient_present_no = @patient_no, patient_present_yes = NULL, patient_present_no_enc_id = encounter_id, patient_present_yes_enc_id = NULL, patient_present_unknown = NULL, patient_present_unknown_enc_id = NULL WHERE flat_table2.id = in_visit_id;    
           END IF;
         ELSE
           UPDATE flat_table2 SET patient_present_no = NULL, patient_present_yes = NULL, patient_present_no_enc_id = NULL, patient_present_yes_enc_id = NULL, patient_present_unknown = NULL, patient_present_unknown_enc_id = NULL WHERE flat_table2.id = in_visit_id;
       END IF;

      WHEN @patient_unknown THEN

        IF in_field_voided = 0 THEN
          IF in_visit_id = 0 THEN
             INSERT INTO flat_table2 (patient_id, visit_date, patient_present_unknown, patient_present_unknown_enc_id) VALUES (in_patient_id, in_visit_date, @patient_unknown, encounter_id);
           ELSE
             UPDATE flat_table2 SET patient_present_no = NULL, patient_present_yes = NULL, patient_present_no_enc_id = NULL, patient_present_yes_enc_id = NULL, patient_present_unknown = @patient_unknown, patient_present_unknown_enc_id = encounter_id WHERE flat_table2.id = in_visit_id; 
           END IF;
         ELSE
           UPDATE flat_table2 SET patient_present_no = NULL, patient_present_yes = NULL, patient_present_no_enc_id = NULL, patient_present_yes_enc_id = NULL, patient_present_unknown = NULL, patient_present_unknown_enc_id = NULL WHERE flat_table2.id = in_visit_id; 
       END IF;       
      ELSE
        SET @enc_id = encounter_id;
    END CASE;    
    
END$$

DELIMITER ;
