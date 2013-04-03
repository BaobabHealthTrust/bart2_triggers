DELIMITER $$

DROP PROCEDURE IF EXISTS `proc_insert_cpt_given`$$

CREATE PROCEDURE `proc_insert_cpt_given`(
    IN in_patient_id INT, 
    IN in_visit_date DATE, 
    IN in_field_concept INT, 
    IN in_field_value_coded INT,
    IN in_field_value_coded_name_id INT,
    IN in_field_other VARCHAR(25),
    IN in_visit_id INT,
    IN encounter_id INT
)
BEGIN

    SET @yes = (SELECT concept_name.concept_id FROM concept_name 
                LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE name = "Yes" AND voided = 0 AND retired = 0 LIMIT 1);
    SET @no = (SELECT concept_name.concept_id FROM concept_name 
                LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE name = "No" AND voided = 0 AND retired = 0 LIMIT 1);
    
    CASE in_field_value_coded
    
        WHEN @yes THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, cpt_given_yes, cpt_given_yes_enc_id) VALUES (in_patient_id, in_visit_date, @value, encounter_id);
            
            ELSE 
            
                UPDATE flat_table2 SET cpt_given_yes = @value, cpt_given_no = NULL, cpt_given_yes_enc_id = encounter_id, cpt_given_no_enc_id = NULL WHERE flat_table2.id = in_visit_id;
                
            END IF;
        
        WHEN @no THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, cpt_given_no, cpt_given_no_enc_id) VALUES (in_patient_id, in_visit_date, @value, encounter_id);
            
            ELSE 
            
                UPDATE flat_table2 SET cpt_given_no = @value, cpt_given_yes = NULL, cpt_given_no_enc_id = encounter_id, cpt_given_yes_enc_id = NULL WHERE flat_table2.id = in_visit_id;
                
            END IF;                   
    
        ELSE
        
            SET @enc_id = encounter_id;                  
    
    END CASE;
    
END$$

DELIMITER ;