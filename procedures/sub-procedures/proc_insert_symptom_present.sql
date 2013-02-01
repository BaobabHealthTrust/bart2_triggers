DELIMITER $$

DROP PROCEDURE IF EXISTS `proc_insert_symptom_present`$$

CREATE PROCEDURE `proc_insert_symptom_present`(
    IN in_patient_id INT, 
    IN in_visit_date DATE, 
    IN in_field_concept INT, 
    IN in_field_value_coded INT,
    IN in_field_value_coded_name_id INT,
    IN in_field_other VARCHAR(25),
    IN in_visit_id INT
)
BEGIN

    SET @symptom_present_lipodystrophy = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Lipodystrophy" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @symptom_present_anemia = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Anemia" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @symptom_present_jaundice = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Jaundice" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @symptom_present_lactic_acidosis = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Lactic acidosis" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @symptom_present_fever = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Fever" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @symptom_present_skin_rash = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Skin rash" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @symptom_present_abdominal_pain = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Abdominal pain" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @symptom_present_anorexia = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Anorexia" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @symptom_present_cough = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Cough" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @symptom_present_diarrhea = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Diarrhea" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @symptom_present_hepatitis = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Hepatitis" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @symptom_present_leg_pain_numbness = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Leg pain / numbness" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @symptom_present_peripheral_neuropathy = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Peripheral neuropathy" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @symptom_present_vomiting = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Vomiting" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @symptom_present_other_symptom = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Other symptom" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    CASE in_field_value_coded
    
        WHEN @symptom_present_lipodystrophy THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, symptom_present_lipodystrophy) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET symptom_present_lipodystrophy = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @symptom_present_anemia THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, symptom_present_anemia) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET symptom_present_anemia = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @symptom_present_jaundice THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, symptom_present_jaundice) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET symptom_present_jaundice = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @symptom_present_lactic_acidosis THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, symptom_present_lactic_acidosis) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET symptom_present_lactic_acidosis = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @symptom_present_fever THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, symptom_present_fever) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET symptom_present_fever = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @symptom_present_skin_rash THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, symptom_present_skin_rash) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET symptom_present_skin_rash = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @symptom_present_abdominal_pain THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, symptom_present_abdominal_pain) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET symptom_present_abdominal_pain = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @symptom_present_anorexia THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, symptom_present_anorexia) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET symptom_present_anorexia = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @symptom_present_cough THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, symptom_present_cough) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET symptom_present_cough = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @symptom_present_diarrhea THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, symptom_present_diarrhea) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET symptom_present_diarrhea = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @symptom_present_hepatitis THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, symptom_present_hepatitis) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET symptom_present_hepatitis = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @symptom_present_leg_pain_numbness THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, symptom_present_leg_pain_numbness) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET symptom_present_leg_pain_numbness = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @symptom_present_peripheral_neuropathy THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, symptom_present_peripheral_neuropathy) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET symptom_present_peripheral_neuropathy = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @symptom_present_vomiting THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, symptom_present_vomiting) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET symptom_present_vomiting = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @symptom_present_other_symptom THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, symptom_present_other_symptom) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET symptom_present_other_symptom = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
            
    END CASE;
    
END$$

DELIMITER ;
