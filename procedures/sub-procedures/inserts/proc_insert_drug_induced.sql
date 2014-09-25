DELIMITER $$

DROP PROCEDURE IF EXISTS `proc_insert_drug_induced`$$

CREATE PROCEDURE `proc_insert_drug_induced`(
    IN in_patient_id INT, 
    IN in_visit_date DATE, 
    IN in_field_concept INT, 
    IN in_field_value_coded INT,
    IN in_field_value_coded_name_id INT,
    IN in_field_other VARCHAR(25),
    IN in_visit_id INT,
    IN in_field_voided INT,
    IN encounter_id INT
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

    SET @drug_induced_kidney_failure = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Kidney Failure " AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @drug_induced_nightmares = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Nightmares" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @drug_induced_diziness = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Dizziness" AND concept_name_type = "FULLY_SPECIFIED" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @drug_induced_psychosis = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Psychosis" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @drug_induced_blurry_vision = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Blurry Vision" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);    
    
    CASE in_field_value_coded
    
        WHEN @drug_induced_lipodystrophy THEN
        
            #--SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, drug_induced_lipodystrophy, drug_induced_lipodystrophy_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET drug_induced_lipodystrophy = 'Yes', drug_induced_lipodystrophy_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET drug_induced_lipodystrophy = NULL, drug_induced_lipodystrophy_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;
    
        WHEN @drug_induced_anemia THEN
        
            #--SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, drug_induced_anemia, drug_induced_anemia_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET drug_induced_anemia = 'Yes', drug_induced_anemia_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
             UPDATE flat_table2 SET drug_induced_anemia = NULL, drug_induced_anemia_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;
    
        WHEN @drug_induced_jaundice THEN
        
            #--SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, drug_induced_jaundice, drug_induced_jaundice_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET drug_induced_jaundice = 'Yes', drug_induced_jaundice_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET drug_induced_jaundice = NULL, drug_induced_jaundice_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;
    
        WHEN @drug_induced_lactic_acidosis THEN
        
            #--SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, drug_induced_lactic_acidosis, drug_induced_lactic_acidosis_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET drug_induced_lactic_acidosis = 'Yes', drug_induced_lactic_acidosis_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET drug_induced_lactic_acidosis = NULL, drug_induced_lactic_acidosis_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;
    
        WHEN @drug_induced_fever THEN
        
            #--SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, drug_induced_fever, drug_induced_fever_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET drug_induced_fever = 'Yes', drug_induced_fever_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
               UPDATE flat_table2 SET drug_induced_fever = NULL, drug_induced_fever_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;
    
        WHEN @drug_induced_skin_rash THEN
        
            #--SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, drug_induced_skin_rash, drug_induced_skin_rash_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET drug_induced_skin_rash = 'Yes', drug_induced_skin_rash_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET drug_induced_skin_rash = NULL, drug_induced_skin_rash_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;
    
        WHEN @drug_induced_abdominal_pain THEN
        
            #--SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, drug_induced_abdominal_pain, drug_induced_abdominal_pain_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET drug_induced_abdominal_pain = 'Yes', drug_induced_abdominal_pain_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
               UPDATE flat_table2 SET drug_induced_abdominal_pain = NULL, drug_induced_abdominal_pain_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;
    
        WHEN @drug_induced_anorexia THEN
        
            #--SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, drug_induced_anorexia, drug_induced_anorexia_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET drug_induced_anorexia = 'Yes', drug_induced_anorexia_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET drug_induced_anorexia = NULL, drug_induced_anorexia_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;
    
        WHEN @drug_induced_cough THEN
        
            #--SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, drug_induced_cough, drug_induced_cough_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET drug_induced_cough = 'Yes', drug_induced_cough_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET drug_induced_cough = NULL, drug_induced_cough_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;
    
        WHEN @drug_induced_diarrhea THEN
        
            #--SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, drug_induced_diarrhea, drug_induced_diarrhea_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET drug_induced_diarrhea = 'Yes', drug_induced_diarrhea_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
                UPDATE flat_table2 SET drug_induced_diarrhea = NULL, drug_induced_diarrhea_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;
    
        WHEN @drug_induced_hepatitis THEN
        
            #--SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, drug_induced_hepatitis, drug_induced_hepatitis_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET drug_induced_hepatitis = 'Yes', drug_induced_hepatitis_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET drug_induced_hepatitis = NULL, drug_induced_hepatitis_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;
    
        WHEN @drug_induced_leg_pain_numbness THEN
        
            #--SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, drug_induced_leg_pain_numbness, drug_induced_leg_pain_numbness_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET drug_induced_leg_pain_numbness = 'Yes', drug_induced_leg_pain_numbness_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET drug_induced_leg_pain_numbness = NULL, drug_induced_leg_pain_numbness_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;
    
        WHEN @drug_induced_peripheral_neuropathy THEN
        
            #--SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, drug_induced_peripheral_neuropathy, drug_induced_peripheral_neuropathy_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET drug_induced_peripheral_neuropathy = 'Yes', drug_induced_peripheral_neuropathy_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET drug_induced_peripheral_neuropathy = NULL, drug_induced_peripheral_neuropathy_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;
    
        WHEN @drug_induced_vomiting THEN
        
            #--SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, drug_induced_vomiting, drug_induced_vomiting_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET drug_induced_vomiting = 'Yes', drug_induced_vomiting_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET drug_induced_vomiting = NULL, drug_induced_vomiting_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;
    
        WHEN @drug_induced_other_symptom THEN
        
            #--SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);

            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, drug_induced_other_symptom, drug_induced_other_symptom_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET drug_induced_other_symptom = 'Yes', drug_induced_other_symptom_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET drug_induced_other_symptom = NULL, drug_induced_other_symptom_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;
            
          WHEN @drug_induced_kidney_failure THEN

            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, drug_induced_kidney_failure, drug_induced_kidney_failure_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET drug_induced_kidney_failure = 'Yes', drug_induced_kidney_failure_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET drug_induced_kidney_failure = NULL, drug_induced_kidney_failure_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;

          WHEN @drug_induced_nightmares THEN

            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, drug_induced_nightmares, drug_induced_nightmares_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET drug_induced_nightmares = 'Yes', drug_induced_nightmares_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET drug_induced_nightmares = NULL, drug_induced_nightmares_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;

          WHEN @drug_induced_diziness THEN

            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, drug_induced_diziness, drug_induced_diziness_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET drug_induced_diziness = 'Yes', drug_induced_diziness_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET drug_induced_diziness = NULL, drug_induced_diziness_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;

          WHEN @drug_induced_psychosis THEN

            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, drug_induced_psychosis, drug_induced_psychosis_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET drug_induced_psychosis = 'Yes', drug_induced_psychosis_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET drug_induced_psychosis = NULL, drug_induced_psychosis_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;
            
          WHEN @drug_induced_blurry_vision THEN

            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, drug_induced_blurry_vision, drug_induced_blurry_vision_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET drug_induced_blurry_vision = 'Yes', drug_induced_blurry_vision_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET drug_induced_blurry_vision = NULL, drug_induced_blurry_vision_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;                                    
        ELSE
        
            SET @enc_id = encounter_id;                  
    
    END CASE;
    
END$$

DELIMITER ;
