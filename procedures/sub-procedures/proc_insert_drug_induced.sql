DELIMITER $$

DROP PROCEDURE IF EXISTS `proc_insert_drug_induced`$$

CREATE PROCEDURE `proc_insert_drug_induced`(
    IN in_patient_id INT, 
    IN in_visit_date DATE, 
    IN in_field_concept INT, 
    IN in_field_value_coded INT,
    IN in_field_value_coded_name_id INT,
    IN in_field_other VARCHAR(25),
    IN in_visit_id INT
)
BEGIN

    SET @drug_induced_lipodystrophy = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Lipodystrophy" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @drug_induced_anemia = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Anemia" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @drug_induced_jaundice = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Jaundice" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @drug_induced_lactic_acidosis = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Lactic acidosis" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @drug_induced_fever = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Fever" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @drug_induced_skin_rash = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Skin rash" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @drug_induced_abdominal_pain = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Abdominal pain" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @drug_induced_anorexia = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Anorexia" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @drug_induced_cough = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Cough" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @drug_induced_diarrhea = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Diarrhea" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @drug_induced_hepatitis = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Hepatitis" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @drug_induced_leg_pain_numbness = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Leg pain / numbness" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @drug_induced_peripheral_neuropathy = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Peripheral neuropathy" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @drug_induced_vomiting = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Vomiting" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @drug_induced_other_symptom = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Other symptom" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    CASE in_field_value_coded
    
        WHEN @drug_induced_lipodystrophy THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, drug_induced_lipodystrophy) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET drug_induced_lipodystrophy = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @drug_induced_anemia THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, drug_induced_anemia) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET drug_induced_anemia = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @drug_induced_jaundice THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, drug_induced_jaundice) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET drug_induced_jaundice = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @drug_induced_lactic_acidosis THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, drug_induced_lactic_acidosis) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET drug_induced_lactic_acidosis = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @drug_induced_fever THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, drug_induced_fever) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET drug_induced_fever = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @drug_induced_skin_rash THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, drug_induced_skin_rash) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET drug_induced_skin_rash = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @drug_induced_abdominal_pain THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, drug_induced_abdominal_pain) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET drug_induced_abdominal_pain = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @drug_induced_anorexia THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, drug_induced_anorexia) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET drug_induced_anorexia = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @drug_induced_cough THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, drug_induced_cough) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET drug_induced_cough = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @drug_induced_diarrhea THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, drug_induced_diarrhea) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET drug_induced_diarrhea = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @drug_induced_hepatitis THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, drug_induced_hepatitis) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET drug_induced_hepatitis = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @drug_induced_leg_pain_numbness THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, drug_induced_leg_pain_numbness) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET drug_induced_leg_pain_numbness = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @drug_induced_peripheral_neuropathy THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, drug_induced_peripheral_neuropathy) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET drug_induced_peripheral_neuropathy = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @drug_induced_vomiting THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, drug_induced_vomiting) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET drug_induced_vomiting = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @drug_induced_other_symptom THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, drug_induced_other_symptom) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET drug_induced_other_symptom = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
            
    END CASE;
    
END$$

DELIMITER ;
