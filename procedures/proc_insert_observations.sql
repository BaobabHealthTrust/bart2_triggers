DELIMITER $$

DROP PROCEDURE IF EXISTS `proc_insert_observations`$$

CREATE PROCEDURE `proc_insert_observations`(
    IN patient_id INT, 
    IN value_date DATE, 
    IN field_concept INT, 
    IN field_value_coded INT,
    IN field_value_coded_name_id INT,
    IN field_other VARCHAR(25),
    IN visit_id INT
)
BEGIN

    SET @pregnant = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = "Patient pregnant" AND voided = 0 AND retired = 0 LIMIT 1);
                        
    SET @breast_feeding = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = "Breast feeding" AND voided = 0 AND retired = 0 LIMIT 1);
                        
    SET @currently_using_family_planning_method = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = "Currently using family planning method" AND voided = 0 AND retired = 0 LIMIT 1);
                        
    SET @method_of_family_planning = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = "Method of family planning" AND voided = 0 AND retired = 0 LIMIT 1);
                        
    SET @symptom_present = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = "Symptom present" AND voided = 0 AND retired = 0 LIMIT 1);
                        
    SET @drug_induced = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = "Drug induced" AND voided = 0 AND retired = 0 LIMIT 1);
                        
    SET @routine_tb_screening = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = "Routine TB Screening" AND voided = 0 AND retired = 0 LIMIT 1);
                        
    SET @allergic_to_sulphur = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = "Allergic to sulphur" AND voided = 0 AND retired = 0 LIMIT 1);

    CASE field_concept
    
        WHEN @pregnant THEN
        
            CALL proc_insert_pregnant(
                patient_id, 
                value_date, 
                field_concept, 
                field_value_coded, 
                field_value_coded_name_id, 
                NULL,
                visit_id
            );
    
        WHEN @breast_feeding THEN
        
            CALL proc_insert_breast_feeding(
                patient_id, 
                value_date, 
                field_concept, 
                field_value_coded, 
                field_value_coded_name_id, 
                NULL,
                visit_id
            );       
    
        WHEN @currently_using_family_planning_method THEN
        
            CALL proc_insert_currently_using_family_planning_method(
                patient_id, 
                value_date, 
                field_concept, 
                field_value_coded, 
                field_value_coded_name_id, 
                NULL,
                visit_id
            );       
    
        WHEN @method_of_family_planning THEN
        
            CALL proc_insert_method_of_family_planning(
                patient_id, 
                value_date, 
                field_concept, 
                field_value_coded, 
                field_value_coded_name_id, 
                NULL,
                visit_id
            );       
    
        WHEN @symptom_present THEN
        
            CALL proc_insert_symptom_present(
                patient_id, 
                value_date, 
                field_concept, 
                field_value_coded, 
                field_value_coded_name_id, 
                NULL,
                visit_id
            );       
    
        WHEN @drug_induced THEN
        
            CALL proc_insert_drug_induced(
                patient_id, 
                value_date, 
                field_concept, 
                field_value_coded, 
                field_value_coded_name_id, 
                NULL,
                visit_id
            );       
    
        WHEN @routine_tb_screening THEN
        
            CALL proc_insert_routine_tb_screening(
                patient_id, 
                value_date, 
                field_concept, 
                field_value_coded, 
                field_value_coded_name_id, 
                NULL,
                visit_id
            );       
    
        WHEN @allergic_to_sulphur THEN
        
            CALL proc_insert_allergic_to_sulphur(
                patient_id, 
                value_date, 
                field_concept, 
                field_value_coded, 
                field_value_coded_name_id, 
                NULL,
                visit_id
            );       
            
    END CASE;

END$$

DELIMITER ;
