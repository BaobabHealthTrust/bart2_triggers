DELIMITER $$
DROP TRIGGER IF EXISTS `encounters_after_update`$$
CREATE TRIGGER `encounters_after_update` AFTER UPDATE 
ON `encounter`
FOR EACH ROW
BEGIN

    # Declare condition for exiting loop
    DECLARE done INT DEFAULT FALSE;
    
    DECLARE  person_id INT(11);
    DECLARE  concept_id INT(11);
    DECLARE  obs_datetime DATE;

    # Declare and initialise cursor for looping through the table
    DECLARE cur CURSOR FOR SELECT DISTINCT person_id, concept_id, DATE(obs_datetime) datetime FROM obs WHERE encounter_id = new.encounter_id;   

    # Declare loop position check
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    # Open cursor
    OPEN cur;
    
    # Declare loop for traversing through the records
    read_loop: LOOP
    
        # Get the fields into the variables declared earlier
        FETCH cur INTO person_id, concept_id, obs_datetime;
            
        # Check if we are done and exit loop if done
        IF done THEN
        
            LEAVE read_loop;
        
        END IF;
    
        # Not done, process the parameters

        IF new.voided = 1 THEN
        
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
            
            SET @Weight = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Weight" AND voided = 0 AND retired = 0 LIMIT 1);
        
            SET @Height = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Height (cm)" AND voided = 0 AND retired = 0 LIMIT 1);
            
            SET @Temperature = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Temperature" AND voided = 0 AND retired = 0 LIMIT 1);
            
            SET @BMI = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "BMI" AND voided = 0 AND retired = 0 LIMIT 1);
            
            SET @systolic_blood_pressure = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Systolic blood pressure" AND voided = 0 AND retired = 0 LIMIT 1);
            
            SET @diastolic_blood_pressure = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Diastolic blood pressure" AND voided = 0 AND retired = 0 LIMIT 1);
            
            SET @weight_for_height = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Weight for height percent of median" AND voided = 0 AND retired = 0 LIMIT 1);
            
            SET @weight_for_age = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Weight for age percent of median" AND voided = 0 AND retired = 0 LIMIT 1);
            
            SET @height_for_age = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Height for age percent of median" AND voided = 0 AND retired = 0 LIMIT 1);
            
            SET @regimen_category = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Regimen Category" AND voided = 0 AND retired = 0 LIMIT 1);
            
            SET @transfer_out_location = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Transfer out to" AND voided = 0 AND retired = 0 LIMIT 1);
            
            SET @appointment_date = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Appointment date" AND voided = 0 AND retired = 0 LIMIT 1);
            
            SET @condoms = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Condoms" AND voided = 0 AND retired = 0 LIMIT 1);
            
            SET @amount_of_drug_brought_to_clinic = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Amount of drug brought to clinic" AND voided = 0 AND retired = 0 LIMIT 1);
            
            SET @amount_of_drug_remaining_at_home = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Amount of drug remaining at home" AND voided = 0 AND retired = 0 LIMIT 1);
            
            SET @what_was_the_patient_adherence_for_this_drug = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "What was the patients adherence for this drug order" AND voided = 0 AND retired = 0 LIMIT 1);
            
            SET @missed_hiv_drug_construct = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Missed HIV drug construct" AND voided = 0 AND retired = 0 LIMIT 1);
                
            CASE
            
                WHEN @allergic_to_sulphur THEN
                
                    UPDATE flat_table2 SET allergic_to_sulphur_yes = NULL, allergic_to_sulphur_no = NULL, allergic_to_sulphur_yes_enc_id = NULL, allergic_to_sulphur_no_enc_id = NULL WHERE flat_table2.allergic_to_sulphur_yes_enc_id = new.encounter_id OR flat_table2.allergic_to_sulphur_no_enc_id = new.encounter_id;
            
                ELSE
                
                    SET @encounter_id = new.encounter_id;
            
            END CASE;
    
        END IF;
        
    END LOOP;

END$$

DELIMITER ;
