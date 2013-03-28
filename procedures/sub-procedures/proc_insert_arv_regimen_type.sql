DELIMITER $$

DROP PROCEDURE IF EXISTS `proc_insert_arv_regimen_type`$$

CREATE PROCEDURE `proc_insert_arv_regimen_type`(
    IN in_patient_id INT, 
    IN in_visit_date DATE, 
    IN in_field_concept INT, 
    IN in_field_value_coded INT,
    IN in_field_value_coded_name_id INT,
    IN in_field_other VARCHAR(25),
    IN in_visit_id INT
)
BEGIN

    SET @arv_regimen_type_unknown = (SELECT concept_name.concept_name_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "UNKNOWN ANTIRETROVIRAL DRUG" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @arv_regimen_type_d4T_3TC_NVP = (SELECT concept_name.concept_name_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "d4T/3TC/NVP" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @arv_regimen_type_triomune = (SELECT concept_name.concept_name_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "triomune" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @arv_regimen_type_triomune_30 = (SELECT concept_name.concept_name_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "triomune-30" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @arv_regimen_type_triomune_40 = (SELECT concept_name.concept_name_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "triomune-40" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @arv_regimen_type_AZT_3TC_NVP = (SELECT concept_name.concept_name_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "AZT/3TC/NVP" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @arv_regimen_type_AZT_3TC_LPV_r = (SELECT concept_name.concept_name_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "AZT/3TC+LPV/r" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @arv_regimen_type_AZT_3TC_EFV = (SELECT concept_name.concept_name_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "AZT/3TC+EFV" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @arv_regimen_type_d4T_3TC_EFV = (SELECT concept_name.concept_name_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "d4T/3TC/EFV" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @arv_regimen_type_TDF_3TC_NVP = (SELECT concept_name.concept_name_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "TDF/3TC+NVP" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @arv_regimen_type_TDF_3TC_EFV = (SELECT concept_name.concept_name_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "TDF/3TC/EFV" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @arv_regimen_type_ABC_3TC_LPV_r = (SELECT concept_name.concept_name_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "ABC/3TC+LPV/r" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @arv_regimen_type_TDF_3TC_LPV_r = (SELECT concept_name.concept_name_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "TDF/3TC+LPV/r" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @arv_regimen_type_d4T_3TC_d4T_3TC_NVP = (SELECT concept_name.concept_name_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "d4T/3TC + d4T/3TC/NVP (Starter pack)" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    SET @arv_regimen_type_AZT_3TC_AZT_3TC_NVP = (SELECT concept_name.concept_name_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "AZT/3TC + AZT/3TC/NVP (Starter pack)" AND voided = 0 AND retired = 0 ORDER BY concept_name.concept_id DESC LIMIT 1);
    
    CASE in_field_value_coded_name_id
    
        WHEN @arv_regimen_type_AZT_3TC_AZT_3TC_NVP THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, arv_regimen_type_AZT_3TC_AZT_3TC_NVP) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET arv_regimen_type_AZT_3TC_AZT_3TC_NVP = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @arv_regimen_type_d4T_3TC_d4T_3TC_NVP THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, arv_regimen_type_d4T_3TC_d4T_3TC_NVP) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET arv_regimen_type_d4T_3TC_d4T_3TC_NVP = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @arv_regimen_type_TDF_3TC_LPV_r THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, arv_regimen_type_TDF_3TC_LPV_r) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET arv_regimen_type_TDF_3TC_LPV_r = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @arv_regimen_type_ABC_3TC_LPV_r THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, arv_regimen_type_ABC_3TC_LPV_r) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET arv_regimen_type_ABC_3TC_LPV_r = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @arv_regimen_type_TDF_3TC_EFV THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, arv_regimen_type_TDF_3TC_EFV) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET arv_regimen_type_TDF_3TC_EFV = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @arv_regimen_type_TDF_3TC_NVP THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, arv_regimen_type_TDF_3TC_NVP) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET arv_regimen_type_TDF_3TC_NVP = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @arv_regimen_type_d4T_3TC_EFV THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, arv_regimen_type_d4T_3TC_EFV) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET arv_regimen_type_d4T_3TC_EFV = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @arv_regimen_type_AZT_3TC_EFV THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, arv_regimen_type_AZT_3TC_EFV) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET arv_regimen_type_AZT_3TC_EFV = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @arv_regimen_type_AZT_3TC_LPV_r THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, arv_regimen_type_AZT_3TC_LPV_r) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET arv_regimen_type_AZT_3TC_LPV_r = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @arv_regimen_type_AZT_3TC_NVP THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, arv_regimen_type_AZT_3TC_NVP) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET arv_regimen_type_AZT_3TC_NVP = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @arv_regimen_type_triomune_40 THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, arv_regimen_type_triomune_40) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET arv_regimen_type_triomune_40 = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @arv_regimen_type_triomune_30 THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, arv_regimen_type_triomune_30) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET arv_regimen_type_triomune_30 = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @arv_regimen_type_triomune THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, arv_regimen_type_triomune) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET arv_regimen_type_triomune = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @arv_regimen_type_d4T_3TC_NVP THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, arv_regimen_type_d4T_3TC_NVP) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET arv_regimen_type_d4T_3TC_NVP = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
        WHEN @arv_regimen_type_unknown THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, arv_regimen_type_unknown) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET arv_regimen_type_unknown = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
    
    END CASE;
    
END$$

DELIMITER ;
