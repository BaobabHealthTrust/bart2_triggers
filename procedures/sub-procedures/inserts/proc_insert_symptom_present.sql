DELIMITER $$

DROP PROCEDURE IF EXISTS `proc_insert_symptom_present`$$

CREATE PROCEDURE `proc_insert_symptom_present`(
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

    SET @symptom_present_lipodystrophy = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Lipodystrophy" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @symptom_present_anemia = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Anemia" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @symptom_present_jaundice = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Jaundice" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @symptom_present_lactic_acidosis = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Lactic acidosis" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @symptom_present_fever = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Fever" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @symptom_present_skin_rash = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Skin rash" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @symptom_present_abdominal_pain = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Abdominal pain" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @symptom_present_anorexia = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Anorexia" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @symptom_present_cough = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Cough" AND concept_name_type = "FULLY_SPECIFIED" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @symptom_present_diarrhea = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Diarrhea" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @symptom_present_hepatitis = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Hepatitis" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @symptom_present_leg_pain_numbness = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Leg pain / numbness" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @symptom_present_peripheral_neuropathy = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Peripheral neuropathy" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @symptom_present_vomiting = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Vomiting" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @symptom_present_other_symptom = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Other symptom" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);

    SET @symptom_present_kidney_failure = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Kidney Failure " AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @symptom_present_nightmares = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Nightmares" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @symptom_present_diziness = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Dizziness" AND concept_name_type = "FULLY_SPECIFIED" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @symptom_present_psychosis = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Psychosis" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @symptom_present_blurry_vision = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Blurry Vision" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
        
    CASE in_field_value_coded
    
        WHEN @symptom_present_lipodystrophy THEN
        
            #--SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
           
            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, symptom_present_lipodystrophy, symptom_present_lipodystrophy_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET symptom_present_lipodystrophy = 'Yes', symptom_present_lipodystrophy_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET symptom_present_lipodystrophy = NULL, symptom_present_lipodystrophy_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;
        WHEN @symptom_present_anemia THEN
        
            #--SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);

            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, symptom_present_anemia, symptom_present_anemia_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET symptom_present_anemia = 'Yes', symptom_present_anemia_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET symptom_present_anemia = NULL, symptom_present_anemia_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;    
        WHEN @symptom_present_jaundice THEN
        
            #--SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);

            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, symptom_present_jaundice, symptom_present_jaundice_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET symptom_present_jaundice = 'Yes', symptom_present_jaundice_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET symptom_present_jaundice = NULL, symptom_present_jaundice_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;    
        WHEN @symptom_present_lactic_acidosis THEN
        
            #--SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);

            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, symptom_present_lactic_acidosis, symptom_present_lactic_acidosis_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET symptom_present_lactic_acidosis = 'Yes', symptom_present_lactic_acidosis_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
                UPDATE flat_table2 SET symptom_present_lactic_acidosis = NULL, symptom_present_lactic_acidosis_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;    
        WHEN @symptom_present_fever THEN
        
            #--SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);

            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, symptom_present_fever, symptom_present_fever_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET symptom_present_fever = 'Yes', symptom_present_fever_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET symptom_present_fever = NULL, symptom_present_fever_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;    
        WHEN @symptom_present_skin_rash THEN
        
            #--SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);

            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, symptom_present_skin_rash, symptom_present_skin_rash_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET symptom_present_skin_rash = 'Yes', symptom_present_skin_rash_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET symptom_present_skin_rash = NULL, symptom_present_skin_rash_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;    
        WHEN @symptom_present_abdominal_pain THEN
        
            #--SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);

            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, symptom_present_abdominal_pain, symptom_present_abdominal_pain_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET symptom_present_abdominal_pain = 'Yes', symptom_present_abdominal_pain_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET symptom_present_abdominal_pain = NULL, symptom_present_abdominal_pain_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;    
        WHEN @symptom_present_anorexia THEN
        
            #--SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);

            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, symptom_present_anorexia, symptom_present_anorexia_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET symptom_present_anorexia = 'Yes', symptom_present_anorexia_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET symptom_present_anorexia = NULL, symptom_present_anorexia_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;    
        WHEN @symptom_present_cough THEN
        
            #--SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);

            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, symptom_present_cough, symptom_present_cough_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET symptom_present_cough = 'Yes', symptom_present_cough_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET symptom_present_cough = NULL, symptom_present_cough_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;
    
        WHEN @symptom_present_diarrhea THEN
        
            #--SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, symptom_present_diarrhea, symptom_present_diarrhea_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET symptom_present_diarrhea = 'Yes', symptom_present_diarrhea_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET symptom_present_diarrhea = NULL, symptom_present_diarrhea_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;    
        WHEN @symptom_present_hepatitis THEN
        
            #--SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);

            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, symptom_present_hepatitis, symptom_present_hepatitis_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET symptom_present_hepatitis = 'Yes', symptom_present_hepatitis_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET symptom_present_hepatitis = NULL, symptom_present_hepatitis_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;    
        WHEN @symptom_present_leg_pain_numbness THEN
        
            #--SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, symptom_present_leg_pain_numbness, symptom_present_leg_pain_numbness_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET symptom_present_leg_pain_numbness = 'Yes', symptom_present_leg_pain_numbness_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET symptom_present_leg_pain_numbness = NULL, symptom_present_leg_pain_numbness_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;    
        WHEN @symptom_present_peripheral_neuropathy THEN
        
            #--SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, symptom_present_peripheral_neuropathy, symptom_present_peripheral_neuropathy_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET symptom_present_peripheral_neuropathy = 'Yes', symptom_present_peripheral_neuropathy_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET symptom_present_peripheral_neuropathy = NULL, symptom_present_peripheral_neuropathy_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;
        WHEN @symptom_present_vomiting THEN
        
            #--SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, symptom_present_vomiting, symptom_present_vomiting_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET symptom_present_vomiting = 'Yes', symptom_present_vomiting_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET symptom_present_vomiting = NULL, symptom_present_vomiting_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;
        WHEN @symptom_present_other_symptom THEN
        
            #--SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, symptom_present_other_symptom, symptom_present_other_symptom_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET symptom_present_other_symptom = 'Yes', symptom_present_other_symptom_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET symptom_present_other_symptom = NULL, symptom_present_other_symptom_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;

            
          WHEN @symptom_present_kidney_failure THEN

            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, symptom_present_kidney_failure, symptom_present_kidney_failure_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET symptom_present_kidney_failure = 'Yes', symptom_present_kidney_failure_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET symptom_present_kidney_failure = NULL, symptom_present_kidney_failure_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;

          WHEN @symptom_present_nightmares THEN

            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, symptom_present_nightmares, symptom_present_nightmares_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET symptom_present_nightmares = 'Yes', symptom_present_nightmares_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET symptom_present_nightmares = NULL, symptom_present_nightmares_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;

          WHEN @symptom_present_diziness THEN

            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, symptom_present_diziness, symptom_present_diziness_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET symptom_present_diziness = 'Yes', symptom_present_diziness_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET symptom_present_diziness = NULL, symptom_present_diziness_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;

          WHEN @symptom_present_psychosis THEN

            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, symptom_present_psychosis, symptom_present_psychosis_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET symptom_present_psychosis = 'Yes', symptom_present_psychosis_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET symptom_present_psychosis = NULL, symptom_present_psychosis_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;
            
          WHEN @symptom_present_blurry_vision THEN

            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, symptom_present_blurry_vision, symptom_present_blurry_vision_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET symptom_present_blurry_vision = 'Yes', symptom_present_blurry_vision_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET symptom_present_blurry_vision = NULL, symptom_present_blurry_vision_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;

        ELSE
        
            SET @enc_id = encounter_id;                  
    
    END CASE;
    
END$$

DELIMITER ;
