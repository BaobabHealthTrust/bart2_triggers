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

    SET @variable = (SELECT name FROM concept_name WHERE concept_id = in_field_concept AND voided = 0 LIMIT 1 );

    SET @Weight = 'Weight';

    SET @Weight1 =  'Weight (kg)';

    SET @Weight2 =  'WT';
    
    SET @Height = 'Height (cm)';
    
    SET @Temperature = 'Temperature';
    
    SET @BMI = 'BMI';

    SET @BMI2 = 'Body mass index, measured';
    
    SET @systolic_blood_pressure = 'Systolic blood pressure';
    
    SET @diastolic_blood_pressure = 'Diastolic blood pressure';
    
    SET @weight_for_height = 'Weight for height percent of median';
    
    SET @weight_for_age = 'Weight for age percent of median';
    
    SET @height_for_age = 'Height for age percent of median';
    
    SET @regimen_category = 'Regimen Category';
    
    SET @transfer_out_location = 'Transfer out to';

    SET @transfer_out_location1 = 'Transfer to';

    SET @transfer_out_location2 = 'Transfer out to location';

    SET @transfer_out_location3 = 'Transfer out destination';

    SET @transfer_out_location4 = 'Transfer out site';
    
    SET @appointment_date = 'Appointment date';
    
    SET @condoms = 'Condoms';
    
    SET @amount_of_drug_brought_to_clinic = 'Amount of drug brought to clinic';
    
    SET @amount_of_drug_remaining_at_home = 'Amount of drug remaining at home';
    
    SET @what_was_the_patient_adherence_for_this_drug = 'What was the patients adherence for this drug order';
    
    SET @missed_hiv_drug_construct = 'Missed HIV drug construct';

    SET @ever_received_art = 'ever received art';
                     
    SET @date_last_taken_arv = 'Date ART last taken';     
                     
    SET @art_in_2_months = 'Has the patient taken ART in the last two months';                         

    SET @art_in_2_weeks = 'Has the patient taken ART in the last two weeks'; 
                    
    SET @last_arv_reg =  'Last ART drugs taken';                           

    SET @ever_reg_4_art = 'Ever registered at ART clinic';                         

    SET @has_transfer_letter = 'Has transfer letter'; 
                    
    SET @art_init_loc =  'Location of ART INITIATION';
                   
    SET @art_start_date_est = 'Has transfer letter' ; 
                 
    SET @date_started_art =  'ART start date';

    SET @cd4_count_loc =  'Cd4 count location';                          
                                        
    SET @cd4_percent_loc =  'CD4 percent location';                                          

    SET @cd4_count_date =  'Cd4 count datetime';                        
                                                                  
    SET @cd4_count =  'Cd4 count';                                                    

    SET @cd4_count_percent =  'Cd4 percent';                            

    SET @cd4_count_mod =  'Cd4 count';                            

    SET @cd4_percent_less_than_25 = 'CD4 percent less than 25';                            
                    
    SET @cd4_count_less_than_250 = 'CD4 count less than 250';
                                                
    SET @cd4_count_less_than_350 = 'CD4 count less than or equal to 350';                            
                    
    SET @pnuemocystis_pnuemonia = 'Pneumocystis pneumonia';  

    SET @lymphocyte_count_date = 'Lymphocyte count datetime';                            
                    
    SET @lymphocyte_count = 'Lymphocyte count' ;                            

    SET @asymptomatic = 'Asymptomatic HIV infection' ;                            

    SET @pers_gnrl_lymphadenopathy = 'Persistent generalized lymphadenopathy';                            

    SET @unspecified_stage_1_cond = 'Unspecified stage I condition';  

    SET @molluscumm_contagiosum = 'Molluscum contagiosum';  

    SET @wart_virus_infection_extensive = 'Wart virus infection, extensive';  

    SET @oral_ulcerations_recurrent = 'Oral ulcerations, recurrent';  

    SET @parotid_enlargement_pers_unexp = 'Parotid enlargement';  

    SET @lineal_gingival_erythema = 'Lineal gingival erythema';  

    SET @herpes_zoster = 'Herpes zoster';  

    SET @resp_tract_infections_rec =  'Respiratory tract infections, recurrent (sinusitis, tonsilitus, otitis media, pharyngitis)';  

    SET @unspecified_stage2_condition = 'Unspecified stage II condition';  

    SET @angular_chelitis = 'Angular cheilitis';  

    SET @papular_prurtic_eruptions = 'Papular pruritic eruptions / Fungal nail infections';

    SET @hepatosplenomegaly_unexplained = 'Hepatosplenomegaly persistent unexplained';

    SET @oral_hairy_leukoplakia = 'Oral hairy leukoplakia';
                    
    SET @severe_weight_loss = 'Severe weight loss >10% and/or BMI <18.5kg/m^2, unexplained';
                    
    SET @fever_persistent_unexplained = 'Fever, persistent unexplained, intermittent or constant, >1 month';
                    
    SET @pulmonary_tuberculosis = 'Pulmonary tuberculosis (current)';
                    
    SET @pulmonary_tuberculosis_last_2_years = 'Tuberculosis (PTB or EPTB) within the last 2 years';

    SET @severe_bacterial_infection = 'Severe bacterial infections (pneumonia, empyema, pyomyositis, bone/joint, meningitis, bacteraemia)';
                    
    SET @bacterial_pnuemonia = 'Bacterial pneumonia, severe recurrent';
                    
    SET @symptomatic_lymphoid_interstitial_pnuemonitis = 'Symptomatic lymphoid interstitial pneumonia';
                    
    SET @chronic_hiv_assoc_lung_disease = 'Chronic HIV lung disease';
                    
    SET @unspecified_stage3_condition = 'Unspecified stage III condition';
                    
    SET @aneamia = 'Anaemia, unexplained < 8 g/dl';
                    
    SET @neutropaenia = 'Neutropaenia, unexplained < 500 /mm(cubed)';
                    
    SET @thrombocytopaenia_chronic = 'Thrombocytopaenia, chronic < 50,000 /mm(cubed)';
                    
    SET @diarhoea = 'Diarrhoea, chronic (>1 month) unexplained';
                    
    SET @oral_candidiasis = 'Oral candidiasis';
                    
    SET @acute_necrotizing_ulcerative_gingivitis = ' Acute necrotizing ulcerative stomatitis, gingivitis or periodontitis';

    SET @lymph_node_tuberculosis = 'Lymph node tuberculosis';
                    
    SET @toxoplasmosis_of_brain = 'Toxoplasmosis of the brain';
                    
    SET @cryptococcal_meningitis = 'Cryptococcal meningitis or other extrapulmonary cryptococcosis';
                    
    SET @progressive_multifocal_leukoencephalopathy = 'Progressive multifocal leukoencephalopathy';
                    
    SET @disseminated_mycosis = 'Disseminated mycosis (coccidiomycosis or histoplasmosis)';
                    
    SET @candidiasis_of_oesophagus = 'Candidiasis of oseophagus, trachea and bronchi or lungs';
                    
    SET @extrapulmonary_tuberculosis = 'Extrapulmonary tuberculosis (EPTB)';
                    
    SET @cerebral_non_hodgkin_lymphoma = 'Cerebral or B-cell non Hodgkin lymphoma';

    SET @hiv_encephalopathy = 'HIV encephalopathy' ;

    SET @bacterial_infections_severe_recurrent = 'Bacterial infections, severe recurrent  (empyema, pyomyositis, meningitis, bone/joint infections but EXCLUDING pneumonia)';

    SET @unspecified_stage_4_condition = 'Unspecified stage IV condition';
                    
    SET @disseminated_non_tuberculosis_mycobactierial_infection = 'Disseminated non-tuberculosis mycobacterial infection';
                    
    SET @cryptosporidiosis = 'Cryptosporidiosis, chronic with diarroea';

    SET @isosporiasis = 'Isosporiasis >1 month';
                    
    SET @symptomatic_hiv_asscoiated_nephropathy = 'Symptomatic HIV associated nephropathy or cardiomyopathy';

    SET @chronic_herpes_simplex_infection = 'Chronic herpes simplex infection (orolabial, gential / anorectal >1 month or visceral at any site)';

    SET @cytomegalovirus_infection = 'Cytomegalovirus infection';
		                        
    SET @toxoplasomis_of_the_brain_1month = 'Toxoplasmosis, brain > 1 month';

    SET @recto_vaginal_fitsula = 'Rectovaginal fistula';

    SET @mod_wght_loss_less_thanequal_to_10_perc = 'Moderate weight loss less than or equal to 10 percent, unexplained';

    SET @seborrhoeic_dermatitis = 'Seborrhoeic dermatitis';
		                        
    SET @hepatitis_b_or_c_infection = 'Hepatitis B or C infection';
		                        
    SET @kaposis_sarcoma = 'Kaposis sarcoma';

    SET @non_typhoidal_salmonella_bacteraemia_recurrent = 'Non-typhoidal salmonella bacteraemia, recurrent' ;

    SET @leishmaniasis_atypical_disseminated = 'Atypical disseminated leishmaniasis' ;
		                        
    SET @cerebral_or_b_cell_non_hodgkin_lymphoma = 'Cerebral or B-cell non Hodgkin lymphoma';
		                        
    SET @invasive_cancer_of_cervix = 'invasive cancer of cervix';

    SET @who_crit_stage = 'Who stages criteria present';

    CASE @variable
    
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
                        
                    ELSE
                    
                        SET @enc_id = encounter_id;                  
                
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
                        
                    ELSE
                    
                        SET @enc_id = encounter_id;                  
    
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
                    
                        INSERT INTO flat_table2 (patient_id, visit_date, what_was_the_patient_adherence_for_this_drug1, what_was_the_patient_adherence_for_this_drug1_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_numeric, encounter_id);
                       
                    WHEN @what_was_the_patient_adherence_for_this_drug2 = "" THEN
                    
                        INSERT INTO flat_table2 (patient_id, visit_date, what_was_the_patient_adherence_for_this_drug2, what_was_the_patient_adherence_for_this_drug2_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_numeric, encounter_id);
                        
                    WHEN @what_was_the_patient_adherence_for_this_drug3 = "" THEN
                    
                        INSERT INTO flat_table2 (patient_id, visit_date, what_was_the_patient_adherence_for_this_drug3, what_was_the_patient_adherence_for_this_drug3_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_numeric, encounter_id);
                      
                    WHEN @what_was_the_patient_adherence_for_this_drug4 = "" THEN
                    
                        INSERT INTO flat_table2 (patient_id, visit_date, what_was_the_patient_adherence_for_this_drug4, what_was_the_patient_adherence_for_this_drug4_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_numeric, encounter_id);
                       
                    WHEN @what_was_the_patient_adherence_for_this_drug5 = "" THEN
                    
                        INSERT INTO flat_table2 (patient_id, visit_date, what_was_the_patient_adherence_for_this_drug5, what_was_the_patient_adherence_for_this_drug5_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_numeric, encounter_id);
                                    
                    ELSE
                    
                        SET @enc_id = encounter_id;                  
                
                END CASE;
            
            ELSE 
            
                CASE 
                
                    WHEN @what_was_the_patient_adherence_for_this_drug1 = "" THEN
                    
                        UPDATE flat_table2 SET what_was_the_patient_adherence_for_this_drug1 = in_field_value_numeric, what_was_the_patient_adherence_for_this_drug1_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                       
                    WHEN @what_was_the_patient_adherence_for_this_drug2 = "" THEN
                    
                        UPDATE flat_table2 SET what_was_the_patient_adherence_for_this_drug2 = in_field_value_numeric, what_was_the_patient_adherence_for_this_drug2_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                        
                    WHEN @what_was_the_patient_adherence_for_this_drug3 = "" THEN
                    
                        UPDATE flat_table2 SET what_was_the_patient_adherence_for_this_drug3 = in_field_value_numeric, what_was_the_patient_adherence_for_this_drug3_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                      
                    WHEN @what_was_the_patient_adherence_for_this_drug4 = "" THEN
                    
                        UPDATE flat_table2 SET what_was_the_patient_adherence_for_this_drug4 = in_field_value_numeric, what_was_the_patient_adherence_for_this_drug4_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                       
                    WHEN @what_was_the_patient_adherence_for_this_drug5 = "" THEN
                    
                        UPDATE flat_table2 SET what_was_the_patient_adherence_for_this_drug5 = in_field_value_numeric, what_was_the_patient_adherence_for_this_drug5_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                                    
                    ELSE
                    
                        SET @enc_id = encounter_id;                  
                
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
                    
                        INSERT INTO flat_table2 (patient_id, visit_date, amount_of_drug1_remaining_at_home, amount_of_drug1_remaining_at_home_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_numeric, encounter_id);
                       
                    WHEN @amount_of_drug2_remaining_at_home = "" THEN
                    
                        INSERT INTO flat_table2 (patient_id, visit_date, amount_of_drug2_remaining_at_home, amount_of_drug2_remaining_at_home_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_numeric, encounter_id);
                        
                    WHEN @amount_of_drug3_remaining_at_home = "" THEN
                    
                        INSERT INTO flat_table2 (patient_id, visit_date, amount_of_drug3_remaining_at_home, amount_of_drug3_remaining_at_home_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_numeric, encounter_id);
                      
                    WHEN @amount_of_drug4_remaining_at_home = "" THEN
                    
                        INSERT INTO flat_table2 (patient_id, visit_date, amount_of_drug4_remaining_at_home, amount_of_drug4_remaining_at_home_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_numeric, encounter_id);
                       
                    WHEN @amount_of_drug5_remaining_at_home = "" THEN
                    
                        INSERT INTO flat_table2 (patient_id, visit_date, amount_of_drug5_remaining_at_home, amount_of_drug5_remaining_at_home_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_numeric, encounter_id);
                                    
                    ELSE
                    
                        SET @enc_id = encounter_id;                  
                
                END CASE;
            
            ELSE 
            
                CASE 
                
                    WHEN @amount_of_drug1_remaining_at_home = "" THEN
                    
                        UPDATE flat_table2 SET amount_of_drug1_remaining_at_home = in_field_value_numeric, amount_of_drug1_remaining_at_home_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                       
                    WHEN @amount_of_drug2_remaining_at_home = "" THEN
                    
                        UPDATE flat_table2 SET amount_of_drug2_remaining_at_home = in_field_value_numeric, amount_of_drug2_remaining_at_home_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                        
                    WHEN @amount_of_drug3_remaining_at_home = "" THEN
                    
                        UPDATE flat_table2 SET amount_of_drug3_remaining_at_home = in_field_value_numeric, amount_of_drug3_remaining_at_home_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                      
                    WHEN @amount_of_drug4_remaining_at_home = "" THEN
                    
                        UPDATE flat_table2 SET amount_of_drug4_remaining_at_home = in_field_value_numeric, amount_of_drug4_remaining_at_home_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                       
                    WHEN @amount_of_drug5_remaining_at_home = "" THEN
                    
                        UPDATE flat_table2 SET amount_of_drug5_remaining_at_home = in_field_value_numeric, amount_of_drug5_remaining_at_home_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                                    
                    ELSE
                    
                        SET @enc_id = encounter_id;                  
                
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
                    
                        INSERT INTO flat_table2 (patient_id, visit_date, amount_of_drug1_brought_to_clinic, amount_of_drug1_brought_to_clinic_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_numeric, encounter_id);
                       
                    WHEN @amount_of_drug2_brought_to_clinic = "" THEN
                    
                        INSERT INTO flat_table2 (patient_id, visit_date, amount_of_drug2_brought_to_clinic, amount_of_drug2_brought_to_clinic_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_numeric, encounter_id);
                        
                    WHEN @amount_of_drug3_brought_to_clinic = "" THEN
                    
                        INSERT INTO flat_table2 (patient_id, visit_date, amount_of_drug3_brought_to_clinic, amount_of_drug3_brought_to_clinic_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_numeric, encounter_id);
                      
                    WHEN @amount_of_drug4_brought_to_clinic = "" THEN
                    
                        INSERT INTO flat_table2 (patient_id, visit_date, amount_of_drug4_brought_to_clinic, amount_of_drug4_brought_to_clinic_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_numeric, encounter_id);
                       
                    WHEN @amount_of_drug5_brought_to_clinic = "" THEN
                    
                        INSERT INTO flat_table2 (patient_id, visit_date, amount_of_drug5_brought_to_clinic, amount_of_drug5_brought_to_clinic_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_numeric, encounter_id);
                                   
                    ELSE
                    
                        SET @enc_id = encounter_id;                  
                 
                END CASE;
            
            ELSE 
            
                CASE 
                
                    WHEN @amount_of_drug1_brought_to_clinic = "" THEN
                    
                        UPDATE flat_table2 SET amount_of_drug1_brought_to_clinic = in_field_value_numeric, amount_of_drug1_brought_to_clinic_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                       
                    WHEN @amount_of_drug2_brought_to_clinic = "" THEN
                    
                        UPDATE flat_table2 SET amount_of_drug2_brought_to_clinic = in_field_value_numeric, amount_of_drug2_brought_to_clinic_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                        
                    WHEN @amount_of_drug3_brought_to_clinic = "" THEN
                    
                        UPDATE flat_table2 SET amount_of_drug3_brought_to_clinic = in_field_value_numeric, amount_of_drug3_brought_to_clinic_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                      
                    WHEN @amount_of_drug4_brought_to_clinic = "" THEN
                    
                        UPDATE flat_table2 SET amount_of_drug4_brought_to_clinic = in_field_value_numeric, amount_of_drug4_brought_to_clinic_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                       
                    WHEN @amount_of_drug5_brought_to_clinic = "" THEN
                    
                        UPDATE flat_table2 SET amount_of_drug5_brought_to_clinic = in_field_value_numeric, amount_of_drug5_brought_to_clinic_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                                    
                    ELSE
                    
                        SET @enc_id = encounter_id;                  
                
                END CASE;
                                            
            END IF;       
    
    ##########################################################################################################################################
    
        WHEN @condoms THEN
        
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, condoms, condoms_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
            
            ELSE 
            
                UPDATE flat_table2 SET condoms = in_field_value_numeric, condoms_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                
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

        WHEN @transfer_out_location1 THEN

            IF in_visit_id = 0 THEN

                INSERT INTO flat_table2 (patient_id, visit_date, transfer_out_location, transfer_out_location_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);

            ELSE

                UPDATE flat_table2 SET transfer_out_location = in_field_value_text, transfer_out_location_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;

            END IF;

        WHEN @transfer_out_location2 THEN

            IF in_visit_id = 0 THEN

                INSERT INTO flat_table2 (patient_id, visit_date, transfer_out_location, transfer_out_location_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);

            ELSE

                UPDATE flat_table2 SET transfer_out_location = in_field_value_text, transfer_out_location_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;

            END IF;

        WHEN @transfer_out_location3 THEN

            IF in_visit_id = 0 THEN

                INSERT INTO flat_table2 (patient_id, visit_date, transfer_out_location, transfer_out_location_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);

            ELSE

                UPDATE flat_table2 SET transfer_out_location = in_field_value_text, transfer_out_location_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;

            END IF;

        WHEN @transfer_out_location4 THEN

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

        WHEN @Weight2 THEN

            IF in_visit_id = 0 THEN

                INSERT INTO flat_table2 (patient_id, visit_date, Weight, Weight_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_numeric, encounter_id);

            ELSE

                UPDATE flat_table2 SET Weight = in_field_value_numeric, Weight_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;

            END IF;

        WHEN @Weight1 THEN

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

        WHEN @BMI2 THEN

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
            
        WHEN @ever_received_art THEN
           
            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET ever_received_art = @answer WHERE flat_table1.patient_id= in_patient_id;
                             
        WHEN @date_last_taken_arv THEN

            UPDATE flat_table1 SET date_art_last_taken = in_field_value_datetime, date_art_last_taken_v_date = in_visit_date WHERE flat_table1.patient_id= in_patient_id;

        WHEN @art_in_2_months THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET taken_art_in_last_two_months = @answer, taken_art_in_last_two_months_v_date = in_visit_date WHERE flat_table1.patient_id= in_patient_id;

        WHEN @art_in_2_weeks THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET taken_art_in_last_two_weeks = @answer WHERE flat_table1.patient_id= in_patient_id;
                            
        WHEN @last_arv_reg THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET last_art_drugs_taken = @answer WHERE flat_table1.patient_id= in_patient_id;

        WHEN @ever_reg_4_art THEN    

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET ever_registered_at_art_clinic = @answer, ever_registered_at_art_v_date = in_visit_date WHERE flat_table1.patient_id= in_patient_id;
		         
        WHEN @has_transfer_letter THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET has_transfer_letter = @answer WHERE flat_table1.patient_id = patient_id  ;				                    
                            
        WHEN @art_init_loc THEN
				  
				  SET @answer = (SELECT name FROM location WHERE location_id = in_field_value_text);
				 
				 	IF @answer = NULL THEN 
	    			UPDATE flat_table1 SET location_of_art_initialization = "Unknown" WHERE flat_table1.patient_id = patient_id ;
    			ELSE
    					UPDATE flat_table1 SET location_of_art_initialization = @answer WHERE flat_table1.patient_id = patient_id ;

					END IF;
				 
        WHEN @date_started_art THEN

            UPDATE flat_table1 SET date_started_art = in_field_value_datetime WHERE flat_table1.patient_id= in_patient_id;

				WHEN @cd4_count_loc THEN
					
				 SET @answer = (SELECT name FROM location WHERE location_id = in_field_value_text);
				 
				 	IF @answer = NULL THEN 
	    			UPDATE flat_table1 SET cd4_count_location = "Unknown" WHERE flat_table1.patient_id = patient_id ;
    			ELSE
    				UPDATE flat_table1 SET cd4_count_location = @answer WHERE flat_table1.patient_id = patient_id ;

					END IF;
				
				WHEN @cd4_percent_loc THEN
								 
    			UPDATE flat_table1 SET cd4_count_location = in_field_value_text WHERE flat_table1.patient_id = patient_id ;
				
        WHEN @cd4_count_date THEN

            UPDATE flat_table1 SET cd4_count_datetime = in_field_value_datetime WHERE flat_table1.patient_id= in_patient_id;                           				                                              
	         
        WHEN @cd4_count_percent THEN

            UPDATE flat_table1 SET cd4_count_percent = in_field_value_numeric WHERE flat_table1.patient_id= in_patient_id;
         
        WHEN @cd4_percent_less_than_25 THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET cd4_percent_less_than_25 = @answer WHERE flat_table1.patient_id= in_patient_id;
                            
        WHEN @cd4_count_less_than_250 THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET cd4_count_less_than_250 = @answer WHERE flat_table1.patient_id= in_patient_id;
                                                        
        WHEN @cd4_count_less_than_350 THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET cd4_count_less_than_350 = @answer WHERE flat_table1.patient_id= in_patient_id;
                            
        WHEN @lymphocyte_count_date THEN

            UPDATE flat_table1 SET lymphocyte_count_date = in_field_value_datetime WHERE flat_table1.patient_id= in_patient_id;
                            
        WHEN @lymphocyte_count THEN

            UPDATE flat_table1 SET lymphocyte_count = in_field_value_numeric WHERE flat_table1.patient_id= in_patient_id;

        WHEN @asymptomatic THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET asymptomatic = @answer WHERE flat_table1.patient_id= in_patient_id;

        WHEN @pers_gnrl_lymphadenopathy THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET persistent_generalized_lymphadenopathy = @answer WHERE flat_table1.patient_id= in_patient_id;

        WHEN @unspecified_stage_1_cond THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET unspecified_stage_1_cond = @answer WHERE flat_table1.patient_id= in_patient_id;

        WHEN @molluscumm_contagiosum THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET molluscumm_contagiosum = @answer WHERE flat_table1.patient_id= in_patient_id;

        WHEN @wart_virus_infection_extensive THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET wart_virus_infection_extensive = @answer WHERE flat_table1.patient_id= in_patient_id;

        WHEN @oral_ulcerations_recurrent THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET oral_ulcerations_recurrent = @answer WHERE flat_table1.patient_id= in_patient_id;

        WHEN @parotid_enlargement_pers_unexp THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

        UPDATE flat_table1 SET parotid_enlargement_persistent_unexplained = @answer WHERE flat_table1.patient_id= in_patient_id;

        WHEN @lineal_gingival_erythema THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET lineal_gingival_erythema = @answer WHERE flat_table1.patient_id= in_patient_id;

        WHEN @herpes_zoster THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET herpes_zoster = @answer WHERE flat_table1.patient_id= in_patient_id;

        WHEN @resp_tract_infections_rec THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET respiratory_tract_infections_recurrent = @answer WHERE flat_table1.patient_id= in_patient_id;

        WHEN @unspecified_stage2_condition THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET unspecified_stage2_condition = @answer WHERE flat_table1.patient_id= in_patient_id;

        WHEN @angular_chelitis THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET angular_chelitis = @answer WHERE flat_table1.patient_id= in_patient_id;

        WHEN @papular_prurtic_eruptions THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET papular_pruritic_eruptions = @answer WHERE flat_table1.patient_id= in_patient_id;

        WHEN @hepatosplenomegaly_unexplained THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET hepatosplenomegaly_unexplained = @answer WHERE flat_table1.patient_id= in_patient_id;

        WHEN @oral_hairy_leukoplakia THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET oral_hairy_leukoplakia = @answer WHERE flat_table1.patient_id= in_patient_id;
                            
        WHEN @severe_weight_loss THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET severe_weight_loss = @answer WHERE flat_table1.patient_id= in_patient_id;
                            
        WHEN @fever_persistent_unexplained THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET fever_persistent_unexplained = @answer WHERE flat_table1.patient_id= in_patient_id;

        WHEN @pulmonary_tuberculosis THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET pulmonary_tuberculosis = @answer, pulmonary_tuberculosis_v_date = in_visit_date WHERE flat_table1.patient_id= in_patient_id;
                            
        WHEN @pulmonary_tuberculosis_last_2_years THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET pulmonary_tuberculosis_last_2_years = @answer, pulmonary_tuberculosis_last_2_years_v_date = in_visit_date WHERE flat_table1.patient_id= in_patient_id;

        WHEN @severe_bacterial_infection THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET severe_bacterial_infection = @answer WHERE flat_table1.patient_id= in_patient_id;
                            
        WHEN @bacterial_pnuemonia THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET bacterial_pnuemonia = @answer WHERE flat_table1.patient_id= in_patient_id;
                            
        WHEN @symptomatic_lymphoid_interstitial_pnuemonitis THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET symptomatic_lymphoid_interstitial_pnuemonitis = @answer WHERE flat_table1.patient_id= in_patient_id;
                            
        WHEN @chronic_hiv_assoc_lung_disease THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET chronic_hiv_assoc_lung_disease = @answer WHERE flat_table1.patient_id= in_patient_id;
                            
        WHEN @unspecified_stage3_condition THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET unspecified_stage3_condition = @answer WHERE flat_table1.patient_id= in_patient_id;

        WHEN @aneamia THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET aneamia = @answer WHERE flat_table1.patient_id= in_patient_id;
		
        WHEN @neutropaenia THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET neutropaenia = @answer WHERE flat_table1.patient_id= in_patient_id;

        WHEN @thrombocytopaenia_chronic THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET thrombocytopaenia_chronic = @answer WHERE flat_table1.patient_id= in_patient_id;

        WHEN @diarhoea THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET diarhoea = @answer WHERE flat_table1.patient_id= in_patient_id;
		         
        WHEN @oral_candidiasis THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET oral_candidiasis = @answer WHERE flat_table1.patient_id= in_patient_id;

        WHEN @acute_necrotizing_ulcerative_gingivitis THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET acute_necrotizing_ulcerative_gingivitis = @answer WHERE flat_table1.patient_id= in_patient_id;

        WHEN @lymph_node_tuberculosis THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET lymph_node_tuberculosis = @answer WHERE flat_table1.patient_id= in_patient_id;
                            
        WHEN @toxoplasmosis_of_brain THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET toxoplasmosis_of_the_brain  = @answer WHERE flat_table1.patient_id= in_patient_id;

        WHEN @cryptococcal_meningitis THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET cryptococcal_meningitis = @answer WHERE flat_table1.patient_id= in_patient_id;

        WHEN @progressive_multifocal_leukoencephalopathy THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET progressive_multifocal_leukoencephalopathy = @answer WHERE flat_table1.patient_id= in_patient_id;

        WHEN @disseminated_mycosis THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET disseminated_mycosis = @answer WHERE flat_table1.patient_id= in_patient_id;
                            
        WHEN @candidiasis_of_oesophagus THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET candidiasis_of_oesophagus = @answer WHERE flat_table1.patient_id= in_patient_id;

        WHEN @extrapulmonary_tuberculosis THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET extrapulmonary_tuberculosis = @answer, extrapulmonary_tuberculosis_v_date = in_visit_date WHERE flat_table1.patient_id= in_patient_id;

        WHEN @cerebral_non_hodgkin_lymphoma THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET cerebral_non_hodgkin_lymphoma = @answer WHERE flat_table1.patient_id= in_patient_id;

        WHEN @hiv_encephalopathy THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET hiv_encephalopathy = @answer WHERE flat_table1.patient_id= in_patient_id;

        WHEN @bacterial_infections_severe_recurrent  THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET bacterial_infections_severe_recurrent = @answer WHERE flat_table1.patient_id= in_patient_id;

        WHEN @unspecified_stage_4_condition THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET unspecified_stage_4_condition = @answer WHERE flat_table1.patient_id= in_patient_id;

        WHEN @pnuemocystis_pnuemonia THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET pnuemocystis_pnuemonia = @answer WHERE flat_table1.patient_id= in_patient_id;

        WHEN @disseminated_non_tuberculosis_mycobactierial_infection THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET disseminated_non_tuberculosis_mycobacterial_infection = @answer WHERE flat_table1.patient_id= in_patient_id;
                            
        WHEN @cryptosporidiosis THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET cryptosporidiosis = @answer WHERE flat_table1.patient_id= in_patient_id;

        WHEN @isosporiasis THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET isosporiasis = @answer WHERE flat_table1.patient_id= in_patient_id;
                            
        WHEN @symptomatic_hiv_asscoiated_nephropathy THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET symptomatic_hiv_associated_nephropathy = @answer WHERE flat_table1.patient_id= in_patient_id;

        WHEN @chronic_herpes_simplex_infection THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET chronic_herpes_simplex_infection = @answer WHERE flat_table1.patient_id= in_patient_id;

        WHEN @cytomegalovirus_infection THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET cytomegalovirus_infection = @answer WHERE flat_table1.patient_id= in_patient_id;
				                        
        WHEN @toxoplasomis_of_the_brain_1month THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET toxoplasomis_of_the_brain_1month = @answer WHERE flat_table1.patient_id= in_patient_id;

        WHEN @recto_vaginal_fitsula THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET recto_vaginal_fitsula = @answer WHERE flat_table1.patient_id= in_patient_id;

        WHEN @pnuemocystis_pnuemonia THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET pnuemocystis_pnuemonia = @answer WHERE flat_table1.patient_id= in_patient_id;

        WHEN @mod_wght_loss_less_thanequal_to_10_perc THEN 

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET moderate_weight_loss_less_than_or_equal_to_10_percent_unexpl = @answer WHERE flat_table1.patient_id= in_patient_id;

        WHEN @seborrhoeic_dermatitis THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET seborrhoeic_dermatitis = @answer WHERE flat_table1.patient_id= in_patient_id;
				                        
        WHEN @hepatitis_b_or_c_infection THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET hepatitis_b_or_c_infection = @answer WHERE flat_table1.patient_id= in_patient_id;
				                        
        WHEN @kaposis_sarcoma THEN  

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET kaposis_sarcoma = @answer, kaposis_sarcoma_v_date = in_visit_date WHERE flat_table1.patient_id= in_patient_id;

        WHEN @non_typhoidal_salmonella_bacteraemia_recurrent THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET non_typhoidal_salmonella_bacteraemia_recurrent = @answer WHERE flat_table1.patient_id= in_patient_id;

        WHEN @leishmaniasis_atypical_disseminated  THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET leishmaniasis_atypical_disseminated = @answer WHERE flat_table1.patient_id= in_patient_id;

        WHEN @cerebral_or_b_cell_non_hodgkin_lymphoma  THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET cerebral_or_b_cell_non_hodgkin_lymphoma = @answer WHERE flat_table1.patient_id= in_patient_id;
				                        
        WHEN @invasive_cancer_of_cervix THEN

            SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1 SET invasive_cancer_of_cervix = @answer WHERE flat_table1.patient_id= in_patient_id;

       WHEN @who_crit_stage THEN
           SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

            IF (@answer = 'Acute necrotizing ulcerative stomatitis, gingivitis or periodontitis') THEN
              UPDATE flat_table1 SET acute_necrotizing_ulcerative_gingivitis = 'Yes' WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'Anaemia, unexplained < 8 g/dl') THEN
              UPDATE flat_table1 SET aneamia = 'Yes' WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'Angular cheilitis') THEN
             UPDATE flat_table1 SET angular_chelitis = 'Yes' WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'Asymptomatic HIV infection') THEN
              UPDATE flat_table1 SET asymptomatic = 'Yes' WHERE flat_table1.patient_id= in_patient_id;  
            END IF;

            IF (@answer = 'Bacterial infections, severe recurrent  (empyema, pyomyositis, meningitis, bone/joint infections but EXCLUDING pneumonia)') THEN
              UPDATE flat_table1 SET bacterial_infections_severe_recurrent = 'Yes' WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'Bacterial pneumonia, severe recurrent') THEN
              UPDATE flat_table1 SET bacterial_pnuemonia = 'Yes' WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'Candidiasis of oseophagus, trachea and bronchi or lungs') THEN
              UPDATE flat_table1 SET candidiasis_of_oesophagus = 'Yes' WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'Cerebral or B-cell non Hodgkin lymphoma') THEN
              UPDATE flat_table1 SET cerebral_non_hodgkin_lymphoma = 'Yes' WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'Chronic herpes simplex infection (orolabial, gential / anorectal >1 month or visceral at any site)') THEN
              UPDATE flat_table1 SET chronic_herpes_simplex_infection = 'Yes' WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'Cryptococcal meningitis or other extrapulmonary cryptococcosis') THEN
              UPDATE flat_table1 SET cryptococcal_meningitis = 'Yes' WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'Cryptosporidiosis, chronic with diarroea') THEN
              UPDATE flat_table1 SET cryptosporidiosis = 'Yes' WHERE flat_table1.patient_id= in_patient_id;  
            END IF;

            IF (@answer = 'Cytomegalovirus infection (retinitis or infection or other organs)') THEN
              UPDATE flat_table1 SET cytomegalovirus_infection = 'Yes' WHERE flat_table1.patient_id= in_patient_id;  
            END IF;

            IF (@answer = 'Diarrhoea, chronic (>1 month) unexplained') THEN
              UPDATE flat_table1 SET diarhoea = 'Yes' WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'Diarrhoea, persistent unexplained (14 days or more)') THEN
              UPDATE flat_table1 SET diarhoea = 'Yes' WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'Disseminated mycosis (coccidiomycosis or histoplasmosis)') THEN
              UPDATE flat_table1 SET disseminated_mycosis = 'Yes' WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'Disseminated non-tuberculosis mycobacterial infection') THEN
              UPDATE flat_table1 SET disseminated_non_tuberculosis_mycobacterial_infection = 'Yes' WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'Extrapulmonary tuberculosis (EPTB)') THEN
              UPDATE flat_table1 SET extrapulmonary_tuberculosis = 'Yes', extrapulmonary_tuberculosis_v_date = in_visit_date WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'Fever, persistent unexplained, intermittent or constant, >1 month') THEN
              UPDATE flat_table1 SET fever_persistent_unexplained = 'Yes' WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'Hepatosplenomegaly, persistent unexplained') THEN
              UPDATE flat_table1 SET hepatosplenomegaly_unexplained = 'Yes' WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'Herpes zoster') THEN
              UPDATE flat_table1 SET herpes_zoster = 'Yes' WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'HIV encephalopathy') THEN
              UPDATE flat_table1 SET hiv_encephalopathy = 'Yes' WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'HIV wasting syndrome (severe weight loss + persistent fever or severe weight loss + chronic diarrhoea)') THEN
              UPDATE flat_table1 SET severe_weight_loss = 'Yes' WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'Invasive cancer of cervix') THEN
              UPDATE flat_table1 SET invasive_cancer_of_cervix = 'Yes' WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'Isosporiasis >1 month') THEN
              UPDATE flat_table1 SET isosporiasis = 'Yes' WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'Kaposis sarcoma') THEN
              UPDATE flat_table1 SET kaposis_sarcoma = 'Yes', kaposis_sarcoma_v_date = in_visit_date WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'Moderate unexplained wasting/malnutrition not responding to treatment (weight-for-height/ -age 70-79% or muac 11-12 cm)') THEN
              UPDATE flat_table1 SET moderate_weight_loss_less_than_or_equal_to_10_percent_unexpl = 'Yes' WHERE flat_table1.patient_id= in_patient_id; 
            END IF;

            IF (@answer = 'Moderate weight loss less than or equal to 10 percent, unexplained') THEN
              UPDATE flat_table1 SET moderate_weight_loss_less_than_or_equal_to_10_percent_unexpl = 'Yes' WHERE flat_table1.patient_id= in_patient_id;  
            END IF;

            IF (@answer = 'Molluscum contagiosum, extensive') THEN
              UPDATE flat_table1 SET molluscumm_contagiosum = 'Yes' WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'Neutropaenia, unexplained < 500 /mm(cubed)') THEN
              UPDATE flat_table1 SET neutropaenia = 'Yes' WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'Oral candidiasis') THEN
              UPDATE flat_table1 SET oral_candidiasis = 'Yes' WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'Oral candidiasis') THEN
              UPDATE flat_table1 SET oral_candidiasis = 'Yes' WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'Oral candidiasis (from age 2 months)') THEN
              UPDATE flat_table1 SET oral_candidiasis = 'Yes' WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'Oral hairy leukoplakia') THEN
              UPDATE flat_table1 SET oral_hairy_leukoplakia = 'Yes' WHERE flat_table1.patient_id= in_patient_id;  
            END IF;

            IF (@answer = 'Oral ulcerations, recurrent') THEN
              UPDATE flat_table1 SET oral_hairy_leukoplakia = 'Yes' WHERE flat_table1.patient_id= in_patient_id;  
            END IF;

            IF (@answer = 'Papular pruritic eruptions / Fungal nail infections') THEN
              UPDATE flat_table1 SET papular_pruritic_eruptions = 'Yes' WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'Parotid enlargement, persistent unexplained') THEN
              UPDATE flat_table1 SET parotid_enlargement_persistent_unexplained = 'Yes' WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'Persistent generalized lymphadenopathy') THEN
              UPDATE flat_table1 SET persistent_generalized_lymphadenopathy = 'Yes' WHERE flat_table1.patient_id= in_patient_id;  
            END IF;

            IF (@answer = 'Pneumocystis pneumonia') THEN
              UPDATE flat_table1 SET pnuemocystis_pnuemonia = 'Yes' WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'Progressive multifocal leukoencephalopathy') THEN
              UPDATE flat_table1 SET progressive_multifocal_leukoencephalopathy = 'Yes' WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'Pulmonary tuberculosis (current)') THEN
              UPDATE flat_table1 SET pulmonary_tuberculosis_last_2_years = 'Yes', pulmonary_tuberculosis_last_2_years_v_date = in_visit_date WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'Respiratory tract infections, recurrent (sinusitis, tonsilitus, otitis media, pharyngitis)') THEN
              UPDATE flat_table1 SET respiratory_tract_infections_recurrent = 'Yes' WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'Seborrhoeic dermatitis') THEN
              UPDATE flat_table1 SET seborrhoeic_dermatitis = 'Yes' WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'Severe bacterial infections (pneumonia, empyema, pyomyositis, bone/joint, meningitis, bacteraemia)') THEN
              UPDATE flat_table1 SET severe_bacterial_infection = 'Yes' WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'Severe unexplained wasting or malnutrition not responding to treatment (weight-for-height/ -age <70% or MUAC less than 11cm or oedema)') THEN
             UPDATE flat_table1 SET severe_weight_loss = 'Yes' WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'Severe weight loss >10% and/or BMI <18.5kg/m^2, unexplained') THEN
              UPDATE flat_table1 SET severe_weight_loss = 'Yes' WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'Symptomatic HIV-associated nephropathy or cardiomyopathy') THEN
              UPDATE flat_table1 SET symptomatic_hiv_associated_nephropathy = 'Yes' WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'Thrombocytopaenia, chronic < 50,000 /mm(cubed)') THEN
              UPDATE flat_table1 SET thrombocytopaenia_chronic = 'Yes' WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'Toxoplasmosis of the brain') THEN
              UPDATE flat_table1 SET toxoplasmosis_of_the_brain  = 'Yes' WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'Tuberculosis (PTB or EPTB) within the last 2 years') THEN
              UPDATE flat_table1 SET pulmonary_tuberculosis_last_2_years = 'Yes', pulmonary_tuberculosis_last_2_years_v_date = in_visit_date WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'Unspecified stage I condition') THEN
              UPDATE flat_table1 SET unspecified_stage_1_cond = 'Yes' WHERE flat_table1.patient_id= in_patient_id;    
            END IF;

            IF (@answer = 'Unspecified stage II condition') THEN
              UPDATE flat_table1 SET unspecified_stage2_condition = 'Yes' WHERE flat_table1.patient_id= in_patient_id;  
            END IF;

            IF (@answer = 'Unspecified stage III condition') THEN
              UPDATE flat_table1 SET unspecified_stage3_condition = 'Yes' WHERE flat_table1.patient_id= in_patient_id;
            END IF;

            IF (@answer = 'Unspecified stage IV condition') THEN
              UPDATE flat_table1 SET unspecified_stage_4_condition = 'Yes' WHERE flat_table1.patient_id= in_patient_id;  
            END IF;

        ELSE
        
            SET @enc_id = encounter_id;                  
    
    END CASE;
    
END$$

DELIMITER ;
