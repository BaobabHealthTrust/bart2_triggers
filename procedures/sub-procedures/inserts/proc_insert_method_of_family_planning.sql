DELIMITER $$

DROP PROCEDURE IF EXISTS `proc_insert_method_of_family_planning`$$

CREATE PROCEDURE `proc_insert_method_of_family_planning`(
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

    SET @family_planning_method_oral_contraceptive_pills = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Oral contraceptive pills" AND voided = 0 AND retired = 0 LIMIT 1);
    
    SET @family_planning_method_depo_provera = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Depo-provera" AND voided = 0 AND retired = 0 LIMIT 1);
    
    SET @family_planning_method_intrauterine_contraception = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Intrauterine contraception" AND voided = 0 AND retired = 0 LIMIT 1);
    
    SET @family_planning_method_contraceptive_implant = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Contraceptive implant" AND voided = 0 AND retired = 0 LIMIT 1);
    
    SET @family_planning_method_male_condoms = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Male condoms" AND voided = 0 AND retired = 0 LIMIT 1);
    
    SET @family_planning_method_female_condoms = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Female condoms" AND voided = 0 AND retired = 0 LIMIT 1);
    
    SET @family_planning_method__rythm_method = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Rhythm method" AND voided = 0 AND retired = 0 LIMIT 1);
    
    SET @family_planning_method_withdrawal = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Withdrawal method" AND voided = 0 AND retired = 0 LIMIT 1);
    
    SET @family_planning_method_abstinence = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Abstinence" AND voided = 0 AND retired = 0 LIMIT 1);
    
    SET @family_planning_method_tubal_ligation = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Tubal ligation" AND voided = 0 AND retired = 0 LIMIT 1);
    
    SET @family_planning_method_vasectomy = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Vasectomy" AND voided = 0 AND retired = 0 LIMIT 1);
    
    SET @family_planning_method_emergency__contraception = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Emergency contraception" AND voided = 0 AND retired = 0 LIMIT 1);
    
    CASE in_field_value_coded
    
        WHEN @family_planning_method_oral_contraceptive_pills THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, family_planning_method_oral_contraceptive_pills) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET family_planning_method_oral_contraceptive_pills = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
        
        WHEN @family_planning_method_depo_provera THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, family_planning_method_depo_provera) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET family_planning_method_depo_provera = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
        
        WHEN @family_planning_method_intrauterine_contraception THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, family_planning_method_intrauterine_contraception) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET family_planning_method_intrauterine_contraception = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
            
        WHEN @family_planning_method_contraceptive_implant THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, family_planning_method_contraceptive_implant) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET family_planning_method_contraceptive_implant = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
        
        WHEN @family_planning_method_male_condoms THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, family_planning_method_male_condoms) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET family_planning_method_male_condoms = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
        
        WHEN @family_planning_method_female_condoms THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, family_planning_method_female_condoms) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET family_planning_method_female_condoms = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
        
        WHEN @family_planning_method__rythm_method THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, family_planning_method__rythm_method) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET family_planning_method__rythm_method = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
        
        WHEN @family_planning_method_withdrawal THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, family_planning_method_withdrawal) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET family_planning_method_withdrawal = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
        
        WHEN @family_planning_method_abstinence THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, family_planning_method_abstinence) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET family_planning_method_abstinence = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
        
        WHEN @family_planning_method_tubal_ligation THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, family_planning_method_tubal_ligation) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET family_planning_method_tubal_ligation = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
        
        WHEN @family_planning_method_vasectomy THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, family_planning_method_vasectomy) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET family_planning_method_vasectomy = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
        
        WHEN @family_planning_method_emergency__contraception THEN
        
            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, family_planning_method_emergency__contraception) VALUES (in_patient_id, in_visit_date, @value);
            
            ELSE 
            
                UPDATE flat_table2 SET family_planning_method_emergency__contraception = @value WHERE flat_table2.id = in_visit_id;
                
            END IF;
            
    END CASE;
    
END$$

DELIMITER ;
