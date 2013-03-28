DELIMITER $$

DROP PROCEDURE IF EXISTS `proc_update_observations`$$

CREATE PROCEDURE `proc_update_observations`(
    IN patient_id INT, 
    IN value_date DATE, 
    IN field_concept INT, 
    IN field_value_coded INT,
    IN field_value_coded_name_id INT,
    IN field_text VARCHAR(255),
    IN field_value_numeric DOUBLE,
    IN field_value_datetime DATETIME,
    IN visit_id INT,
    IN voided INT
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

    SET @tb_status = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = "TB status" AND voided = 0 AND retired = 0 LIMIT 1);
                        
    SET @guardian_present = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = "Guardian Present" AND voided = 0 AND retired = 0 LIMIT 1);
                        
    SET @patient_present = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = "Patient Present" AND voided = 0 AND retired = 0 LIMIT 1);
                        
    SET @arv_regimen_type = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = "What type of antiretroviral regimen" AND voided = 0 AND retired = 0 LIMIT 1);
                       
    SET @cpt_given = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = "CPT given" AND voided = 0 AND retired = 0 LIMIT 1);
                         
    SET @ipt_given = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = "Isoniazid" AND voided = 0 AND retired = 0 LIMIT 1);
                         
    SET @prescribe_arvs = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = "Prescribe ARVs this visit" AND voided = 0 AND retired = 0 LIMIT 1);
                         
    SET @continue_existing_regimen = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = "Continue existing regimen" AND voided = 0 AND retired = 0 LIMIT 1);
                         
    SET @breastfeeding = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = "Breastfeeding" AND voided = 0 AND retired = 0 LIMIT 1);
                         
    SET @transfer_within_responsibility = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = "Transfer within responsibility" AND voided = 0 AND retired = 0 LIMIT 1);
                         
    SET @guardian_present = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = "Guardian Present" AND voided = 0 AND retired = 0 LIMIT 1);
                         
    SET @patient_present = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = "Patient present" AND voided = 0 AND retired = 0 LIMIT 1);
                         
    CASE field_concept
    
        WHEN @patient_present THEN
        
            CALL proc_update_patient_present(
                patient_id, 
                value_date, 
                field_concept, 
                field_value_coded, 
                field_value_coded_name_id, 
                NULL,
                visit_id,
                voided
            );
    
        WHEN @guardian_present THEN
        
            CALL proc_update_guardian_present(
                patient_id, 
                value_date, 
                field_concept, 
                field_value_coded, 
                field_value_coded_name_id, 
                NULL,
                visit_id,
                voided
            );
    
        WHEN @transfer_within_responsibility THEN
        
            CALL proc_update_transfer_within_responsibility(
                patient_id, 
                value_date, 
                field_concept, 
                field_value_coded, 
                field_value_coded_name_id, 
                NULL,
                visit_id,
                voided
            );
    
        WHEN @breastfeeding THEN
        
            CALL proc_update_breastfeeding(
                patient_id, 
                value_date, 
                field_concept, 
                field_value_coded, 
                field_value_coded_name_id, 
                NULL,
                visit_id,
                voided
            );
    
        WHEN @continue_existing_regimen THEN
        
            CALL proc_update_continue_existing_regimen(
                patient_id, 
                value_date, 
                field_concept, 
                field_value_coded, 
                field_value_coded_name_id, 
                NULL,
                visit_id,
                voided
            );
    
        WHEN @prescribe_arvs THEN
        
            CALL proc_update_prescribe_arvs(
                patient_id, 
                value_date, 
                field_concept, 
                field_value_coded, 
                field_value_coded_name_id, 
                NULL,
                visit_id,
                voided
            );
    
        WHEN @ipt_given THEN
        
            CALL proc_update_ipt_given(
                patient_id, 
                value_date, 
                field_concept, 
                field_value_coded, 
                field_value_coded_name_id, 
                NULL,
                visit_id,
                voided
            );
    
        WHEN @cpt_given THEN
        
            CALL proc_update_cpt_given(
                patient_id, 
                value_date, 
                field_concept, 
                field_value_coded, 
                field_value_coded_name_id, 
                NULL,
                visit_id,
                voided
            );
    
        WHEN @arv_regimen_type THEN
        
            CALL proc_update_arv_regimen_type(
                patient_id, 
                value_date, 
                field_concept, 
                field_value_coded, 
                field_value_coded_name_id, 
                NULL,
                visit_id,
                voided
            );
    
        WHEN @patient_present THEN
        
            CALL proc_update_patient_present(
                patient_id, 
                value_date, 
                field_concept, 
                field_value_coded, 
                field_value_coded_name_id, 
                NULL,
                visit_id,
                voided
            );
    
        WHEN @guardian_present THEN
        
            CALL proc_update_guardian_present(
                patient_id, 
                value_date, 
                field_concept, 
                field_value_coded, 
                field_value_coded_name_id, 
                NULL,
                visit_id,
                voided
            );
    
        WHEN @pregnant THEN
        
            CALL proc_update_pregnant(
                patient_id, 
                value_date, 
                field_concept, 
                field_value_coded, 
                field_value_coded_name_id, 
                NULL,
                visit_id,
                voided
            );
    
        WHEN @currently_using_family_planning_method THEN
        
            CALL proc_update_currently_using_family_planning_method(
                patient_id, 
                value_date, 
                field_concept, 
                field_value_coded, 
                field_value_coded_name_id, 
                NULL,
                visit_id,
                voided
            );       
    
        WHEN @method_of_family_planning THEN
        
            CALL proc_update_method_of_family_planning(
                patient_id, 
                value_date, 
                field_concept, 
                field_value_coded, 
                field_value_coded_name_id, 
                NULL,
                visit_id,
                voided
            );       
    
        WHEN @symptom_present THEN
        
            CALL proc_update_symptom_present(
                patient_id, 
                value_date, 
                field_concept, 
                field_value_coded, 
                field_value_coded_name_id, 
                NULL,
                visit_id,
                voided
            );       
    
        WHEN @drug_induced THEN
        
            CALL proc_update_drug_induced(
                patient_id, 
                value_date, 
                field_concept, 
                field_value_coded, 
                field_value_coded_name_id, 
                NULL,
                visit_id,
                voided
            );       
    
        WHEN @routine_tb_screening THEN
        
            CALL proc_update_routine_tb_screening(
                patient_id, 
                value_date, 
                field_concept, 
                field_value_coded, 
                field_value_coded_name_id, 
                NULL,
                visit_id,
                voided
            );       
    
        WHEN @allergic_to_sulphur THEN
        
            CALL proc_update_allergic_to_sulphur(
                patient_id, 
                value_date, 
                field_concept, 
                field_value_coded, 
                field_value_coded_name_id, 
                NULL,
                visit_id,
                voided
            );        
    
        WHEN @tb_status THEN
        
            CALL proc_update_tb_status(
                patient_id, 
                value_date, 
                field_concept, 
                field_value_coded, 
                field_value_coded_name_id, 
                NULL,
                visit_id,
                voided
            );             
    
        ELSE
        
            CALL proc_update_other_field(
                patient_id, 
                value_date, 
                field_concept, 
                field_value_coded, 
                field_value_coded_name_id,
                field_text,
                field_value_numeric,
                field_value_datetime,
                visit_id,
                voided
            );       
            
    END CASE;

END$$

DELIMITER ;
