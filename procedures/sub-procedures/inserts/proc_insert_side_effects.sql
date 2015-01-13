DELIMITER $$

DROP PROCEDURE IF EXISTS `proc_insert_side_effects`$$

CREATE PROCEDURE `proc_insert_side_effects`(
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

    SET @side_effects_no = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "No" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @side_effects_peripheral_neuropathy = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Peripheral neuropathy" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @side_effects_hepatitis = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Hepatitis" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @side_effects_skin_rash = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Skin rash" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @side_effects_lipodystrophy = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Lipodystrophy" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @side_effects_other = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "other" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @side_effects_kidney_failure = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Kidney Failure " AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @side_effects_nightmares = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Nightmares" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @side_effects_diziness = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Dizziness" AND concept_name_type = "FULLY_SPECIFIED" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @side_effects_psychosis = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Psychosis" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @side_effects_blurry_vision = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Blurry Vision" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
   
    CASE in_field_value_coded
    
        WHEN @side_effects_no THEN
           
            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, side_effects_no, side_effects_no_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET side_effects_no = 'Yes', side_effects_no_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET side_effects_no = NULL, side_effects_no_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;

        WHEN @side_effects_peripheral_neuropathy THEN

            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, side_effects_peripheral_neuropathy, side_effects_peripheral_neuropathy_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET side_effects_peripheral_neuropathy = 'Yes', side_effects_peripheral_neuropathy_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET side_effects_peripheral_neuropathy = NULL, side_effects_peripheral_neuropathy_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;
    
        WHEN @side_effects_hepatitis THEN

            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, side_effects_hepatitis, side_effects_hepatitis_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET side_effects_hepatitis = 'Yes', side_effects_hepatitis_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET side_effects_hepatitis = NULL, side_effects_hepatitis_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;
    
        WHEN @side_effects_skin_rash THEN

            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, side_effects_skin_rash, side_effects_skin_rash_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET side_effects_skin_rash = 'Yes', side_effects_skin_rash_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
                UPDATE flat_table2 SET side_effects_skin_rash = NULL, side_effects_skin_rash_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;

        WHEN @side_effects_lipodystrophy THEN

            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, side_effects_lipodystrophy, side_effects_lipodystrophy_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET side_effects_lipodystrophy = 'Yes', side_effects_lipodystrophy_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET side_effects_lipodystrophy = NULL, side_effects_lipodystrophy_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;
    
        WHEN @side_effects_other THEN

            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, side_effects_other, side_effects_other_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET side_effects_other = 'Yes', side_effects_other_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET side_effects_other = NULL, side_effects_other_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;
    
        WHEN @side_effects_kidney_failure THEN

            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, side_effects_kidney_failure, side_effects_kidney_failure_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET side_effects_kidney_failure = 'Yes', side_effects_kidney_failure_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET side_effects_kidney_failure = NULL, side_effects_kidney_failure_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;
    
        WHEN @side_effects_nightmares THEN

            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, side_effects_nightmares, side_effects_nightmares_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET side_effects_nightmares = 'Yes', side_effects_nightmares_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET side_effects_nightmares = NULL, side_effects_nightmares_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;
    
        WHEN @side_effects_diziness THEN

            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, side_effects_diziness, side_effects_diziness_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET side_effects_diziness = 'Yes', side_effects_diziness_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET side_effects_diziness = NULL, side_effects_diziness_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;
    
        WHEN @side_effects_psychosis THEN
            
            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, side_effects_psychosis, side_effects_psychosis_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET side_effects_psychosis = 'Yes', side_effects_psychosis_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET side_effects_psychosis = NULL, side_effects_psychosis_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;
    
        WHEN @side_effects_blurry_vision THEN

            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, side_effects_blurry_vision, side_effects_blurry_vision_enc_id) VALUES (in_patient_id, in_visit_date, 'Yes', encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET side_effects_blurry_vision = 'Yes', side_effects_blurry_vision_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET side_effects_blurry_vision = NULL, side_effects_blurry_vision_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;             
        ELSE
        
            SET @enc_id = encounter_id;                  
    
    END CASE;
    
END$$

DELIMITER ;
