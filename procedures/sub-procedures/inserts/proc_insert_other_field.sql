DELIMITER $$

DROP PROCEDURE IF EXISTS `proc_insert_other_field`$$

CREATE PROCEDURE `proc_insert_other_field`(
    IN in_patient_id INT, 
    IN in_visit_date DATE, 
    IN in_field_concept INT, 
    IN in_field_value_coded INT,
    IN in_field_value_coded_name_id INT,
    IN in_field_value_text VARCHAR(255),
    IN in_field_value_numeric DOUBLE,
    IN in_field_value_datetime DATETIME,
    IN in_visit_id INT,
    IN encounter_id INT
)
BEGIN

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
    
    CASE in_field_concept
    
        WHEN @missed_hiv_drug_construct THEN
        
            SET @missed_hiv_drug_construct1 = (SELECT COALESCE(missed_hiv_drug_construct1, '') FROM flat_table2 WHERE ID = in_visit_id);
            
            SET @missed_hiv_drug_construct2 = (SELECT COALESCE(missed_hiv_drug_construct2, '') FROM flat_table2 WHERE ID = in_visit_id);
            
            SET @missed_hiv_drug_construct3 = (SELECT COALESCE(missed_hiv_drug_construct3, '') FROM flat_table2 WHERE ID = in_visit_id);
            
            SET @missed_hiv_drug_construct4 = (SELECT COALESCE(missed_hiv_drug_construct4, '') FROM flat_table2 WHERE ID = in_visit_id);
            
            SET @missed_hiv_drug_construct5 = (SELECT COALESCE(missed_hiv_drug_construct5, '') FROM flat_table2 WHERE ID = in_visit_id);
        
            IF in_visit_id = 0 THEN
            
                CASE 
                
                    WHEN @missed_hiv_drug_construct1 = "" THEN
                    
                        INSERT INTO flat_table2 (patient_id, visit_date, missed_hiv_drug_construct1, missed_hiv_drug_construct1_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                       
                    WHEN @missed_hiv_drug_construct2 = "" THEN
                    
                        INSERT INTO flat_table2 (patient_id, visit_date, missed_hiv_drug_construct2, missed_hiv_drug_construct2_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                        
                    WHEN @missed_hiv_drug_construct3 = "" THEN
                    
                        INSERT INTO flat_table2 (patient_id, visit_date, missed_hiv_drug_construct3, missed_hiv_drug_construct3_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                      
                    WHEN @missed_hiv_drug_construct4 = "" THEN
                    
                        INSERT INTO flat_table2 (patient_id, visit_date, missed_hiv_drug_construct4, missed_hiv_drug_construct4_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                       
                    WHEN @missed_hiv_drug_construct5 = "" THEN
                    
                        INSERT INTO flat_table2 (patient_id, visit_date, missed_hiv_drug_construct5, missed_hiv_drug_construct5_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                        
                END CASE;
            
            ELSE 
            
                CASE 
                
                    WHEN @missed_hiv_drug_construct1 = "" THEN
                    
                        UPDATE flat_table2 SET missed_hiv_drug_construct1 = in_field_value_text, missed_hiv_drug_construct1_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                       
                    WHEN @missed_hiv_drug_construct2 = "" THEN
                    
                        UPDATE flat_table2 SET missed_hiv_drug_construct2 = in_field_value_text, missed_hiv_drug_construct2_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                        
                    WHEN @missed_hiv_drug_construct3 = "" THEN
                    
                        UPDATE flat_table2 SET missed_hiv_drug_construct3 = in_field_value_text, missed_hiv_drug_construct3_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                      
                    WHEN @missed_hiv_drug_construct4 = "" THEN
                    
                        UPDATE flat_table2 SET missed_hiv_drug_construct4 = in_field_value_text, missed_hiv_drug_construct4_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                       
                    WHEN @missed_hiv_drug_construct5 = "" THEN
                    
                        UPDATE flat_table2 SET missed_hiv_drug_construct5 = in_field_value_text, missed_hiv_drug_construct5_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                        
                END CASE;
                                            
            END IF;       
    
        #######################################################################################################################################
    
        WHEN @what_was_the_patient_adherence_for_this_drug THEN
        
            SET @what_was_the_patient_adherence_for_this_drug1 = (SELECT COALESCE(what_was_the_patient_adherence_for_this_drug1, '') FROM flat_table2 WHERE ID = in_visit_id);
            
            SET @what_was_the_patient_adherence_for_this_drug2 = (SELECT COALESCE(what_was_the_patient_adherence_for_this_drug2, '') FROM flat_table2 WHERE ID = in_visit_id);
            
            SET @what_was_the_patient_adherence_for_this_drug3 = (SELECT COALESCE(what_was_the_patient_adherence_for_this_drug3, '') FROM flat_table2 WHERE ID = in_visit_id);
            
            SET @what_was_the_patient_adherence_for_this_drug4 = (SELECT COALESCE(what_was_the_patient_adherence_for_this_drug4, '') FROM flat_table2 WHERE ID = in_visit_id);
            
            SET @what_was_the_patient_adherence_for_this_drug5 = (SELECT COALESCE(what_was_the_patient_adherence_for_this_drug5, '') FROM flat_table2 WHERE ID = in_visit_id);
        
            IF in_visit_id = 0 THEN
            
                CASE 
                
                    WHEN @what_was_the_patient_adherence_for_this_drug1 = "" THEN
                    
                        INSERT INTO flat_table2 (patient_id, visit_date, what_was_the_patient_adherence_for_this_drug1, what_was_the_patient_adherence_for_this_drug1_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                       
                    WHEN @what_was_the_patient_adherence_for_this_drug2 = "" THEN
                    
                        INSERT INTO flat_table2 (patient_id, visit_date, what_was_the_patient_adherence_for_this_drug2, what_was_the_patient_adherence_for_this_drug2_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                        
                    WHEN @what_was_the_patient_adherence_for_this_drug3 = "" THEN
                    
                        INSERT INTO flat_table2 (patient_id, visit_date, what_was_the_patient_adherence_for_this_drug3, what_was_the_patient_adherence_for_this_drug3_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                      
                    WHEN @what_was_the_patient_adherence_for_this_drug4 = "" THEN
                    
                        INSERT INTO flat_table2 (patient_id, visit_date, what_was_the_patient_adherence_for_this_drug4, what_was_the_patient_adherence_for_this_drug4_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                       
                    WHEN @what_was_the_patient_adherence_for_this_drug5 = "" THEN
                    
                        INSERT INTO flat_table2 (patient_id, visit_date, what_was_the_patient_adherence_for_this_drug5, what_was_the_patient_adherence_for_this_drug5_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                        
                END CASE;
            
            ELSE 
            
                CASE 
                
                    WHEN @what_was_the_patient_adherence_for_this_drug1 = "" THEN
                    
                        UPDATE flat_table2 SET what_was_the_patient_adherence_for_this_drug1 = in_field_value_text, what_was_the_patient_adherence_for_this_drug1_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                       
                    WHEN @what_was_the_patient_adherence_for_this_drug2 = "" THEN
                    
                        UPDATE flat_table2 SET what_was_the_patient_adherence_for_this_drug2 = in_field_value_text, what_was_the_patient_adherence_for_this_drug2_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                        
                    WHEN @what_was_the_patient_adherence_for_this_drug3 = "" THEN
                    
                        UPDATE flat_table2 SET what_was_the_patient_adherence_for_this_drug3 = in_field_value_text, what_was_the_patient_adherence_for_this_drug3_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                      
                    WHEN @what_was_the_patient_adherence_for_this_drug4 = "" THEN
                    
                        UPDATE flat_table2 SET what_was_the_patient_adherence_for_this_drug4 = in_field_value_text, what_was_the_patient_adherence_for_this_drug4_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                       
                    WHEN @what_was_the_patient_adherence_for_this_drug5 = "" THEN
                    
                        UPDATE flat_table2 SET what_was_the_patient_adherence_for_this_drug5 = in_field_value_text, what_was_the_patient_adherence_for_this_drug5_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                        
                END CASE;
                                            
            END IF;       
    
        #######################################################################################################################################
    
        WHEN @amount_of_drug_remaining_at_home THEN
        
            SET @amount_of_drug1_remaining_at_home = (SELECT COALESCE(amount_of_drug1_remaining_at_home, '') FROM flat_table2 WHERE ID = in_visit_id);
            
            SET @amount_of_drug2_remaining_at_home = (SELECT COALESCE(amount_of_drug2_remaining_at_home, '') FROM flat_table2 WHERE ID = in_visit_id);
            
            SET @amount_of_drug3_remaining_at_home = (SELECT COALESCE(amount_of_drug3_remaining_at_home, '') FROM flat_table2 WHERE ID = in_visit_id);
            
            SET @amount_of_drug4_remaining_at_home = (SELECT COALESCE(amount_of_drug4_remaining_at_home, '') FROM flat_table2 WHERE ID = in_visit_id);
            
            SET @amount_of_drug5_remaining_at_home = (SELECT COALESCE(amount_of_drug5_remaining_at_home, '') FROM flat_table2 WHERE ID = in_visit_id);
        
            IF in_visit_id = 0 THEN
            
                CASE 
                
                    WHEN @amount_of_drug1_remaining_at_home = "" THEN
                    
                        INSERT INTO flat_table2 (patient_id, visit_date, amount_of_drug1_remaining_at_home, amount_of_drug1_remaining_at_home_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                       
                    WHEN @amount_of_drug2_remaining_at_home = "" THEN
                    
                        INSERT INTO flat_table2 (patient_id, visit_date, amount_of_drug2_remaining_at_home, amount_of_drug2_remaining_at_home_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                        
                    WHEN @amount_of_drug3_remaining_at_home = "" THEN
                    
                        INSERT INTO flat_table2 (patient_id, visit_date, amount_of_drug3_remaining_at_home, amount_of_drug3_remaining_at_home_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                      
                    WHEN @amount_of_drug4_remaining_at_home = "" THEN
                    
                        INSERT INTO flat_table2 (patient_id, visit_date, amount_of_drug4_remaining_at_home, amount_of_drug4_remaining_at_home_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                       
                    WHEN @amount_of_drug5_remaining_at_home = "" THEN
                    
                        INSERT INTO flat_table2 (patient_id, visit_date, amount_of_drug5_remaining_at_home, amount_of_drug5_remaining_at_home_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                        
                END CASE;
            
            ELSE 
            
                CASE 
                
                    WHEN @amount_of_drug1_remaining_at_home = "" THEN
                    
                        UPDATE flat_table2 SET amount_of_drug1_remaining_at_home = in_field_value_text, amount_of_drug1_remaining_at_home_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                       
                    WHEN @amount_of_drug2_remaining_at_home = "" THEN
                    
                        UPDATE flat_table2 SET amount_of_drug2_remaining_at_home = in_field_value_text, amount_of_drug2_remaining_at_home_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                        
                    WHEN @amount_of_drug3_remaining_at_home = "" THEN
                    
                        UPDATE flat_table2 SET amount_of_drug3_remaining_at_home = in_field_value_text, amount_of_drug3_remaining_at_home_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                      
                    WHEN @amount_of_drug4_remaining_at_home = "" THEN
                    
                        UPDATE flat_table2 SET amount_of_drug4_remaining_at_home = in_field_value_text, amount_of_drug4_remaining_at_home_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                       
                    WHEN @amount_of_drug5_remaining_at_home = "" THEN
                    
                        UPDATE flat_table2 SET amount_of_drug5_remaining_at_home = in_field_value_text, amount_of_drug5_remaining_at_home_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                        
                END CASE;
                                            
            END IF;       
    
        ###############################################################################################################################################
    
        WHEN @amount_of_drug_brought_to_clinic THEN
        
            SET @amount_of_drug1_brought_to_clinic = (SELECT COALESCE(amount_of_drug1_brought_to_clinic, '') FROM flat_table2 WHERE ID = in_visit_id);
            
            SET @amount_of_drug2_brought_to_clinic = (SELECT COALESCE(amount_of_drug2_brought_to_clinic, '') FROM flat_table2 WHERE ID = in_visit_id);
            
            SET @amount_of_drug3_brought_to_clinic = (SELECT COALESCE(amount_of_drug3_brought_to_clinic, '') FROM flat_table2 WHERE ID = in_visit_id);
            
            SET @amount_of_drug4_brought_to_clinic = (SELECT COALESCE(amount_of_drug4_brought_to_clinic, '') FROM flat_table2 WHERE ID = in_visit_id);
            
            SET @amount_of_drug5_brought_to_clinic = (SELECT COALESCE(amount_of_drug5_brought_to_clinic, '') FROM flat_table2 WHERE ID = in_visit_id);
        
            IF in_visit_id = 0 THEN
            
                CASE 
                
                    WHEN @amount_of_drug1_brought_to_clinic = "" THEN
                    
                        INSERT INTO flat_table2 (patient_id, visit_date, amount_of_drug1_brought_to_clinic, amount_of_drug1_brought_to_clinic_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                       
                    WHEN @amount_of_drug2_brought_to_clinic = "" THEN
                    
                        INSERT INTO flat_table2 (patient_id, visit_date, amount_of_drug2_brought_to_clinic, amount_of_drug2_brought_to_clinic_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                        
                    WHEN @amount_of_drug3_brought_to_clinic = "" THEN
                    
                        INSERT INTO flat_table2 (patient_id, visit_date, amount_of_drug3_brought_to_clinic, amount_of_drug3_brought_to_clinic_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                      
                    WHEN @amount_of_drug4_brought_to_clinic = "" THEN
                    
                        INSERT INTO flat_table2 (patient_id, visit_date, amount_of_drug4_brought_to_clinic, amount_of_drug4_brought_to_clinic_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                       
                    WHEN @amount_of_drug5_brought_to_clinic = "" THEN
                    
                        INSERT INTO flat_table2 (patient_id, visit_date, amount_of_drug5_brought_to_clinic, amount_of_drug5_brought_to_clinic_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                        
                END CASE;
            
            ELSE 
            
                CASE 
                
                    WHEN @amount_of_drug1_brought_to_clinic = "" THEN
                    
                        UPDATE flat_table2 SET amount_of_drug1_brought_to_clinic = in_field_value_text, amount_of_drug1_brought_to_clinic_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                       
                    WHEN @amount_of_drug2_brought_to_clinic = "" THEN
                    
                        UPDATE flat_table2 SET amount_of_drug2_brought_to_clinic = in_field_value_text, amount_of_drug2_brought_to_clinic_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                        
                    WHEN @amount_of_drug3_brought_to_clinic = "" THEN
                    
                        UPDATE flat_table2 SET amount_of_drug3_brought_to_clinic = in_field_value_text, amount_of_drug3_brought_to_clinic_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                      
                    WHEN @amount_of_drug4_brought_to_clinic = "" THEN
                    
                        UPDATE flat_table2 SET amount_of_drug4_brought_to_clinic = in_field_value_text, amount_of_drug4_brought_to_clinic_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                       
                    WHEN @amount_of_drug5_brought_to_clinic = "" THEN
                    
                        UPDATE flat_table2 SET amount_of_drug5_brought_to_clinic = in_field_value_text, amount_of_drug5_brought_to_clinic_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                        
                END CASE;
                                            
            END IF;       
    
    ##########################################################################################################################################
    
        WHEN @condoms THEN
        
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, condoms, condoms_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
            
            ELSE 
            
                UPDATE flat_table2 SET condoms = in_field_value_text, condoms_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                
            END IF; 
        
        WHEN @appointment_date THEN
        
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, appointment_date, appointment_date_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_datetime, encounter_id);
            
            ELSE 
            
                UPDATE flat_table2 SET appointment_date = in_field_value_datetime, appointment_date_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                
            END IF;       
    
        WHEN @transfer_out_location THEN
        
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, transfer_out_location, transfer_out_location_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
            
            ELSE 
            
                UPDATE flat_table2 SET transfer_out_location = in_field_value_text, transfer_out_location_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                
            END IF;       
    
        WHEN @regimen_category THEN
        
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, regimen_category, regimen_category_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
            
            ELSE 
            
                UPDATE flat_table2 SET regimen_category = in_field_value_text, regimen_category_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                
            END IF;       
    
        WHEN @Weight THEN
        
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, Weight, Weight_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_numeric, encounter_id);
            
            ELSE 
            
                UPDATE flat_table2 SET Weight = in_field_value_numeric, Weight_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                
            END IF;       
    
        WHEN @Height THEN
        
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, Height, Height_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_numeric, encounter_id);
            
            ELSE 
            
                UPDATE flat_table2 SET Height = in_field_value_numeric, Height_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                
            END IF;         
    
        WHEN @Temperature THEN
        
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, Temperature, Temperature_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_numeric, encounter_id);
            
            ELSE 
            
                UPDATE flat_table2 SET Temperature = in_field_value_numeric, Temperature_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                
            END IF;           
    
        WHEN @BMI THEN
        
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, BMI, BMI_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_numeric, encounter_id);
            
            ELSE 
            
                UPDATE flat_table2 SET BMI = in_field_value_numeric, BMI_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                
            END IF;               
    
        WHEN @systolic_blood_pressure THEN
        
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, systolic_blood_pressure, systolic_blood_pressure_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_numeric, encounter_id);
            
            ELSE 
            
                UPDATE flat_table2 SET systolic_blood_pressure = in_field_value_numeric, systolic_blood_pressure_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                
            END IF;                  
    
        WHEN @diastolic_blood_pressure THEN
        
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, diastolic_blood_pressure, diastolic_blood_pressure_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_numeric, encounter_id);
            
            ELSE 
            
                UPDATE flat_table2 SET diastolic_blood_pressure = in_field_value_numeric, diastolic_blood_pressure_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                
            END IF;                    
    
        WHEN @weight_for_height THEN
        
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, weight_for_height, weight_for_height_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_numeric, encounter_id);
            
            ELSE 
            
                UPDATE flat_table2 SET weight_for_height = in_field_value_numeric, weight_for_height_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                
            END IF;                      
    
        WHEN @weight_for_age THEN
        
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, weight_for_age, weight_for_age_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_numeric, encounter_id);
            
            ELSE 
            
                UPDATE flat_table2 SET weight_for_age = in_field_value_numeric, weight_for_age_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                
            END IF;                     
    
        WHEN @height_for_age THEN
        
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, height_for_age, height_for_age_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_numeric, encounter_id);
            
            ELSE 
            
                UPDATE flat_table2 SET height_for_age = in_field_value_numeric, height_for_age_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                
            END IF;              
    
    END CASE;
    
END$$

DELIMITER ;
