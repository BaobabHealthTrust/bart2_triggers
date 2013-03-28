DELIMITER $$

DROP PROCEDURE IF EXISTS `proc_insert_transfer_within_responsibility`$$

CREATE PROCEDURE `proc_insert_transfer_within_responsibility`(
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
            
                INSERT INTO flat_table2 (patient_id, visit_date, transfer_within_responsibility_yes) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET transfer_within_responsibility_yes = @value, transfer_within_responsibility_no = NULL WHERE flat_table2.id = in_visit_id;
                
            END IF;
        
        WHEN @no THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, transfer_within_responsibility_no) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET transfer_within_responsibility_no = @value, transfer_within_responsibility_yes = NULL WHERE flat_table2.id = in_visit_id;
                
            END IF;                   
    
    END CASE;
    
END$$

DELIMITER ;
