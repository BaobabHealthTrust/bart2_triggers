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
    IN in_field_voided INT,    
    IN encounter_id INT
)
BEGIN

    SET @Weight = (SELECT concept_name.concept_id FROM concept_name 
        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
        WHERE name = "Weight" AND voided = 0 AND retired = 0 LIMIT 1);
    
    SET @Height = (SELECT concept_name.concept_id FROM concept_name 
        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
        WHERE name = "Height (cm)" AND voided = 0 AND retired = 0 LIMIT 1);
    
    SET @Temperature = (SELECT concept_name.concept_id FROM concept_name 
        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
        WHERE name = "Temperature" AND voided = 0 AND retired = 0 LIMIT 1);
    
    SET @BMI = (SELECT concept_name.concept_id FROM concept_name 
        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
        WHERE name = "BMI" AND voided = 0 AND retired = 0 LIMIT 1);
    
    SET @systolic_blood_pressure = (SELECT concept_name.concept_id FROM concept_name 
        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
        WHERE name = "Systolic blood pressure" AND voided = 0 AND retired = 0 LIMIT 1);
    
    SET @diastolic_blood_pressure = (SELECT concept_name.concept_id FROM concept_name 
        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
        WHERE name = "Diastolic blood pressure" AND voided = 0 AND retired = 0 LIMIT 1);
    
    SET @weight_for_height = (SELECT concept_name.concept_id FROM concept_name 
        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
        WHERE name = "Weight for height percent of median" AND voided = 0 AND retired = 0 LIMIT 1);
    
    SET @weight_for_age = (SELECT concept_name.concept_id FROM concept_name 
        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
        WHERE name = "Weight for age percent of median" AND voided = 0 AND retired = 0 LIMIT 1);
    
    SET @height_for_age = (SELECT concept_name.concept_id FROM concept_name 
        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
        WHERE name = "Height for age percent of median" AND voided = 0 AND retired = 0 LIMIT 1);
    
    SET @regimen_category = (SELECT concept_name.concept_id FROM concept_name 
        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
        WHERE name = "Regimen Category" AND voided = 0 AND retired = 0 LIMIT 1);
    
    SET @transfer_out_location = (SELECT concept_name.concept_id FROM concept_name 
        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
        WHERE name = "Transfer out to" AND voided = 0 AND retired = 0 LIMIT 1);
    
    SET @appointment_date = (SELECT concept_name.concept_id FROM concept_name 
        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
        WHERE name = "Appointment date" AND voided = 0 AND retired = 0 LIMIT 1);
    
    SET @condoms = (SELECT concept_name.concept_id FROM concept_name 
        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
        WHERE name = "Condoms" AND voided = 0 AND retired = 0 LIMIT 1);

    SET @cpt_given = (SELECT concept_name.concept_id FROM concept_name 
        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
        WHERE name = "CPT started" AND voided = 0 AND retired = 0 LIMIT 1);        

   SET @ipt_given = (SELECT concept_name.concept_id FROM concept_name 
        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
        WHERE name = "Isoniazid" AND voided = 0 AND retired = 0 LIMIT 1);        
    
    SET @amount_of_drug_brought_to_clinic = (SELECT concept_name.concept_id FROM concept_name 
        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
        WHERE name = "Amount of drug brought to clinic" AND voided = 0 AND retired = 0 LIMIT 1);
    
    SET @amount_of_drug_remaining_at_home = (SELECT concept_name.concept_id FROM concept_name 
        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
        WHERE name = "Amount of drug remaining at home" AND voided = 0 AND retired = 0 LIMIT 1);
    
    SET @what_was_the_patient_adherence_for_this_drug = (SELECT concept_name.concept_id FROM concept_name 
        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
        WHERE name = "What was the patients adherence for this drug order" AND voided = 0 AND retired = 0 LIMIT 1);
    
    SET @missed_hiv_drug_construct = (SELECT concept_name.concept_id FROM concept_name 
        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
        WHERE name = "Missed HIV drug construct" AND voided = 0 AND retired = 0 LIMIT 1);
    

    SET @ever_received_art = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = "ever received art" AND voided = 0 AND retired = 0 LIMIT 1);
                     
    SET @date_last_taken_arv = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Date ART last taken' AND voided = 0 AND retired = 0 LIMIT 1);     
                     
    SET @art_in_2_months = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Has the patient taken ART in the last two months' AND voided = 0 AND retired = 0 LIMIT 1);                         

    SET @art_in_2_weeks = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Has the patient taken ART in the last two weeks' AND voided = 0 AND retired = 0 LIMIT 1); 
                    
    SET @last_arv_reg =  (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Last ART drugs taken' AND voided = 0 AND retired = 0 LIMIT 1);                           

    SET @ever_reg_4_art = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Ever registered at ART clinic' AND voided = 0 AND retired = 0 LIMIT 1);                         

    SET @has_transfer_letter = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Has transfer letter' AND voided = 0 AND retired = 0 LIMIT 1); 
                    
    SET @art_init_loc =  (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Location of ART INITIATION' AND voided = 0 AND retired = 0 LIMIT 1);
                   
    SET @art_start_date_est = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Has transfer letter' AND voided = 0 AND retired = 0 LIMIT 1); 
                 
    SET @date_started_art =  (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'ART start date' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @cd4_count_loc =  (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Cd4 count location' AND voided = 0 AND retired = 0 LIMIT 1);                          
                                        
    SET @cd4_percent_loc =  (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'CD4 percent location' AND voided = 0 AND retired = 0 LIMIT 1);                                          

    SET @cd4_count_date =  (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Cd4 count datetime' AND voided = 0 AND retired = 0 LIMIT 1);                        
                                                                  
    SET @cd4_count =  (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Cd4 count' AND voided = 0 AND retired = 0 LIMIT 1);                                                    

    SET @cd4_count_percent =  (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Cd4 percent' AND voided = 0 AND retired = 0 LIMIT 1);                            

    SET @cd4_count_mod =  (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Cd4 count' AND voided = 0 AND retired = 0 LIMIT 1);                            

    SET @cd4_percent_less_than_25 = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'CD4 percent less than 25' AND voided = 0 AND retired = 0 LIMIT 1);                            
                    
    SET @cd4_count_less_than_250 = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'CD4 count less than 250' AND voided = 0 AND retired = 0 LIMIT 1);
                                                
    SET @cd4_count_less_than_350 = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'CD4 count less than or equal to 350' AND voided = 0 AND retired = 0 LIMIT 1);                            
                    
    SET @pnuemocystis_pnuemonia = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Pneumocystis pneumonia' AND voided = 0 AND retired = 0 LIMIT 1);  


    SET @lymphocyte_count_date = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Lymphocyte count datetime' AND voided = 0 AND retired = 0 LIMIT 1);                            
                    
    SET @lymphocyte_count = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Lymphocyte count' AND voided = 0 AND retired = 0 LIMIT 1);                            

    SET @asymptomatic = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Asymptomatic HIV infection' AND voided = 0 AND retired = 0 LIMIT 1);                            

    SET @pers_gnrl_lymphadenopathy = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Persistent generalized lymphadenopathy' AND voided = 0 AND retired = 0 LIMIT 1);                            

    SET @unspecified_stage_1_cond = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Unspecified stage I condition' AND voided = 0 AND retired = 0 LIMIT 1);  

    SET @molluscumm_contagiosum = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Molluscum contagiosum' AND voided = 0 AND retired = 0 LIMIT 1);  

    SET @wart_virus_infection_extensive = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Wart virus infection, extensive' AND voided = 0 AND retired = 0 LIMIT 1);  

    SET @oral_ulcerations_recurrent = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Oral ulcerations, recurrent' AND voided = 0 AND retired = 0 LIMIT 1);  

    SET @parotid_enlargement_pers_unexp = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Parotid enlargement' AND voided = 0 AND retired = 0 LIMIT 1);  

    SET @lineal_gingival_erythema = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Lineal gingival erythema' AND voided = 0 AND retired = 0 LIMIT 1);  

    SET @herpes_zoster = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Herpes zoster' AND voided = 0 AND retired = 0 LIMIT 1);  

    SET @resp_tract_infections_rec =  (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Respiratory tract infections, recurrent (sinusitis, tonsilitus, otitis media, pharyngitis)' AND voided = 0 AND retired = 0 LIMIT 1);  

    SET @unspecified_stage2_condition = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Unspecified stage II condition' AND voided = 0 AND retired = 0 LIMIT 1);  

    SET @angular_chelitis = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Angular cheilitis' AND voided = 0 AND retired = 0 LIMIT 1);  


		SET @papular_prurtic_eruptions = (SELECT concept_name.concept_id FROM  concept_name
        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
        WHERE name = 'Papular pruritic eruptions / Fungal nail infections' AND voided = 0 AND retired = 0 LIMIT 1);


    SET @hepatosplenomegaly_unexplained = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Hepatosplenomegaly persistent unexplained' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @oral_hairy_leukoplakia = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Oral hairy leukoplakia' AND voided = 0 AND retired = 0 LIMIT 1);
                    
    SET @severe_weight_loss = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Severe weight loss >10% and/or BMI <18.5kg/m^2, unexplained' AND voided = 0 AND retired = 0 LIMIT 1);
                    
    SET @fever_persistent_unexplained = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Fever, persistent unexplained, intermittent or constant, >1 month' AND voided = 0 AND retired = 0 LIMIT 1);
                    
    SET @pulmonary_tuberculosis = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Pulmonary tuberculosis (current)' AND voided = 0 AND retired = 0 LIMIT 1);
                    
    SET @pulmonary_tuberculosis_last_2_years = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Tuberculosis (PTB or EPTB) within the last 2 years' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @severe_bacterial_infection = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Severe bacterial infections (pneumonia, empyema, pyomyositis, bone/joint, meningitis, bacteraemia)' AND voided = 0 AND retired = 0 LIMIT 1);
                    
    SET @bacterial_pnuemonia = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Bacterial pneumonia, severe recurrent' AND voided = 0 AND retired = 0 LIMIT 1);
                    
    SET @symptomatic_lymphoid_interstitial_pnuemonitis = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Symptomatic lymphoid interstitial pneumonia' AND voided = 0 AND retired = 0 LIMIT 1);
                    
    SET @chronic_hiv_assoc_lung_disease = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Chronic HIV lung disease' AND voided = 0 AND retired = 0 LIMIT 1);
                    
    SET @unspecified_stage3_condition = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Unspecified stage III condition' AND voided = 0 AND retired = 0 LIMIT 1);
                    
    SET @aneamia = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Anaemia, unexplained < 8 g/dl' AND voided = 0 AND retired = 0 LIMIT 1);
                    
    SET @neutropaenia = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Neutropaenia, unexplained < 500 /mm(cubed)' AND voided = 0 AND retired = 0 LIMIT 1);
                    
    SET @thrombocytopaenia_chronic = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Thrombocytopaenia, chronic < 50,000 /mm(cubed)' AND voided = 0 AND retired = 0 LIMIT 1);
                    
    SET @diarhoea = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Diarrhoea, chronic (>1 month) unexplained' AND voided = 0 AND retired = 0 LIMIT 1);
                    
    SET @oral_candidiasis = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Oral candidiasis' AND voided = 0 AND retired = 0 LIMIT 1);
                    
    SET @acute_necrotizing_ulcerative_gingivitis = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = '%Acute necrotizing ulcerative stomatitis, gingivitis or periodontitis%' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @lymph_node_tuberculosis = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Lymph node tuberculosis' AND voided = 0 AND retired = 0 LIMIT 1);
                    
    SET @toxoplasmosis_of_brain = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Toxoplasmosis of the brain' AND voided = 0 AND retired = 0 LIMIT 1);
                    
    SET @cryptococcal_meningitis = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Cryptococcal meningitis or other extrapulmonary cryptococcosis' AND voided = 0 AND retired = 0 LIMIT 1);
                    
    SET @progressive_multifocal_leukoencephalopathy = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Progressive multifocal leukoencephalopathy' AND voided = 0 AND retired = 0 LIMIT 1);
                    
    SET @disseminated_mycosis = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Disseminated mycosis (coccidiomycosis or histoplasmosis)' AND voided = 0 AND retired = 0 LIMIT 1);
                    
    SET @candidiasis_of_oesophagus = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Candidiasis of oseophagus, trachea and bronchi or lungs' AND voided = 0 AND retired = 0 LIMIT 1);
                    
    SET @extrapulmonary_tuberculosis = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Extrapulmonary tuberculosis (EPTB)' AND voided = 0 AND retired = 0 LIMIT 1);
                    
    SET @cerebral_non_hodgkin_lymphoma = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Cerebral or B-cell non Hodgkin lymphoma' AND voided = 0 AND retired = 0 LIMIT 1);


    SET @hiv_encephalopathy = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'HIV encephalopathy' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @bacterial_infections_severe_recurrent = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Bacterial infections, severe recurrent  (empyema, pyomyositis, meningitis, bone/joint infections but EXCLUDING pneumonia)' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @unspecified_stage_4_condition = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Unspecified stage IV condition' AND voided = 0 AND retired = 0 LIMIT 1);
                    
    SET @disseminated_non_tuberculosis_mycobactierial_infection = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Disseminated non-tuberculosis mycobacterial infection' AND voided = 0 AND retired = 0 LIMIT 1);
                    
    SET @cryptosporidiosis = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Cryptosporidiosis, chronic with diarroea' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @isosporiasis = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Isosporiasis >1 month' AND voided = 0 AND retired = 0 LIMIT 1);
                    
    SET @symptomatic_hiv_asscoiated_nephropathy = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Symptomatic HIV associated nephropathy or cardiomyopathy' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @chronic_herpes_simplex_infection = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Chronic herpes simplex infection (orolabial, gential / anorectal >1 month or visceral at any site)' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @cytomegalovirus_infection = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Cytomegalovirus infection' AND voided = 0 AND retired = 0 LIMIT 1);
		                        
    SET @toxoplasomis_of_the_brain_1month = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Toxoplasmosis, brain > 1 month' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @recto_vaginal_fitsula = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Rectovaginal fistula' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @mod_wght_loss_less_thanequal_to_10_perc = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Moderate weight loss less than or equal to 10 percent, unexplained' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @seborrhoeic_dermatitis = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Seborrhoeic dermatitis' AND voided = 0 AND retired = 0 LIMIT 1);
		                        
    SET @hepatitis_b_or_c_infection = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Hepatitis B or C infection' AND voided = 0 AND retired = 0 LIMIT 1);
		                        
    SET @kaposis_sarcoma = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Kaposis sarcoma' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @non_typhoidal_salmonella_bacteraemia_recurrent = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Non-typhoidal salmonella bacteraemia, recurrent' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @leishmaniasis_atypical_disseminated = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Atypical disseminated leishmaniasis' AND voided = 0 AND retired = 0 LIMIT 1);
		                        
    SET @cerebral_or_b_cell_non_hodgkin_lymphoma = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Cerebral or B-cell non Hodgkin lymphoma' AND voided = 0 AND retired = 0 LIMIT 1);
		                        
    SET @invasive_cancer_of_cervix = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'invasive cancer of cervix' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @cryptococcal_meningitis_or_other_eptb_cryptococcosis = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'Cryptococcal meningitis or other extrapulmonary cryptococcosis' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @candidiasis_of_oesophagus_trachea_bronchi_or_lungs = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'Candidiasis of oseophagus, trachea and bronchi or lungs' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @severe_unexplained_wasting_malnutrition = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'Severe unexplained wasting or malnutrition not responding to treatment (weight-for-height/ -age <70% or MUAC less than 11cm or oedema)' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @diarrhoea_chronic_less_1_month_unexplained = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'Diarrhoea, chronic (>1 month) unexplained' AND voided = 0 AND retired = 0 LIMIT 1);                                                           
                        
    SET @moderate_weight_loss_10_unexplained = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'Moderate weight loss less than or equal to 10 percent, unexplained' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @cd4_percentage_available = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'CD4 percent available' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @acute_necrotizing_ulcerative_stomatitis_gingivitis_or_period = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'Acute necrotizing ulcerative stomatitis, gingivitis or periodontitis' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @moderate_unexplained_wasting_malnutrition = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'Moderate unexplained wasting/malnutrition not responding to treatment (weight-for-height/ -age 70-79% or muac 11-12 cm)' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @diarrhoea_persistent_unexplained_14_days_or_more = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'Diarrhoea, persistent unexplained (14 days or more)' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @acute_ulcerative_mouth_infections = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'Acute ulcerative mouth infections' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @anaemia_unexplained_8_g_dl = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'Anaemia, unexplained < 8 g/dl' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @atypical_mycobacteriosis_disseminated_or_lung = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'Atypical mycobacteriosis, disseminated or lung' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @bacterial_infections_sev_recurrent_excluding_pneumonia = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'Bacterial infections, severe recurrent  (empyema, pyomyositis, meningitis, bone/joint infections but EXCLUDING pneumonia)' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @cancer_cervix = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'Cancer cervix' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @chronic_herpes_simplex_infection_genital = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'Chronic herpes simplex infection(orolabial, genital / anorectal >1 month or visceral at any site)' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @cryptosporidiosis_chronic_with_diarrhoea = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'Cryptosporidiosis, chronic with diarroea' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @cytomegalovirus_infection_retinitis_or_other_organ = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'Cytomegalovirus infection: rentinitis or other organ (from age 1 month)' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @cytomegalovirus_of_an_organ_other_than_liver = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'Cytomegalovirus of an organ other than liver, spleen or lymph node' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @fungal_nail_infections = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'Fungal nail infection' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @herpes_simplex_infection_mucocutaneous_visceral = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'Herpes simplex infection, mucocutaneous for longer than 1 month or visceral' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @hiv_associated_cardiomyopathy = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'HIV associated cardiomyopathy' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @hiv_associated_nephropathy = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'HIV associated nephropathy' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @invasive_cancer_cervix = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'Invasive cancer of cervix' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @isosporiasis_1_month = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'Isosporiasis >1 month' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @leishmaniasis_atypical_disseminated = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'Leishmaniasis, atypical disseminated' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @minor_mucocutaneous_manifestations_seborrheic_dermatitis = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'Minor mucocutaneous manifestations (seborrheic dermatitis, prurigo, fungal nail infections, recurrent oral ulcerations, angular chelitis)' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @moderate_unexplained_malnutrition = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'Moderate unexplained wasting/malnutrition not responding to treatment (weight-for-height/ -age 70-79% or muac 11-12 cm)' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @molluscum_contagiosum_extensive = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'Molluscum contagiosum, extensive' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @non_typhoidal_salmonella_bacteraemia_recurrent = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'Non-typhoidal Salmonella bacteraemia, recurrent' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @oral_candidiasis_from_age_2_months = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'Oral candidiasis (from age 2 months)' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @oral_thrush = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'Oral thrush' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @perform_extended_staging = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'Perform extended staging' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @pneumocystis_carinii_pneumonia = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'Pneumocystis carinii pneumonia' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @pneumonia_severe = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'Pneumonia, severe' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @recurrent_bacteraemia_or_sepsis_with_nts = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'Recurrent bacteraemia or sepsis with NTS' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @recurrent_severe_presumed_pneumonia = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'Recurrent severe presumed pneumonia' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @recurrent_upper_respiratory_tract_bac_sinusitis = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'Recurrent upper respiratory infection (ie, bacterial sinusitis)' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @seborrhoeic_dermatitis = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'Seborrhoeic dermatitis' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @sepsis_severe = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'Sepsis, severe' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @tb_lymphadenopathy = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'TB lymphadenopathy' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @unexplained_anaemia_neutropenia_or_thrombocytopenia = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'Unexplained anaemia, neutropaenia, or throbocytopaenia' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @visceral_leishmaniasis = (SELECT concept_name.concept_id FROM concept_name concept_name 
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                        WHERE name = 'Visceral leishmaniasis' AND voided = 0 AND retired = 0 LIMIT 1);

    SET @who_crit_stage = (SELECT concept_name.concept_id FROM concept_name concept_name 
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                    WHERE name = 'Who stages criteria present' AND voided = 0 AND retired = 0 LIMIT 1);

    IF (in_field_voided = 0) THEN
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
                          
                      ELSE
                      
                          SET @enc_id = encounter_id;                  
                  
                  END CASE;
              
              ELSE 
              
                  CASE 
                  
                      WHEN @missed_hiv_drug_construct1 = "" THEN
                        IF in_field_voided = 0 THEN
                          UPDATE flat_table2 SET missed_hiv_drug_construct1 = in_field_value_text, missed_hiv_drug_construct1_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                        ELSE
                          UPDATE flat_table2 SET missed_hiv_drug_construct1 = NULL, missed_hiv_drug_construct1_enc_id = NULL WHERE flat_table2.id = in_visit_id;
                        END IF;                        
                      WHEN @missed_hiv_drug_construct2 = "" THEN
                        IF in_field_voided = 0 THEN
                          UPDATE flat_table2 SET missed_hiv_drug_construct2 = in_field_value_text, missed_hiv_drug_construct2_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                        ELSE
                          UPDATE flat_table2 SET missed_hiv_drug_construct2 = NULL, missed_hiv_drug_construct2_enc_id = NULL WHERE flat_table2.id = in_visit_id;
                        END IF; 
                      WHEN @missed_hiv_drug_construct3 = "" THEN
                        IF in_field_voided = 0 THEN
                          UPDATE flat_table2 SET missed_hiv_drug_construct3 = in_field_value_text, missed_hiv_drug_construct3_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                        ELSE
                          UPDATE flat_table2 SET missed_hiv_drug_construct3 = NULL, missed_hiv_drug_construct3_enc_id = NULL WHERE flat_table2.id = in_visit_id;
                        END IF;                        
                      WHEN @missed_hiv_drug_construct4 = "" THEN
                        IF in_field_voided = 0 THEN
                          UPDATE flat_table2 SET missed_hiv_drug_construct4 = in_field_value_text, missed_hiv_drug_construct4_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                        ELSE
                          UPDATE flat_table2 SET missed_hiv_drug_construct4 = NULL, missed_hiv_drug_construct4_enc_id = NULL WHERE flat_table2.id = in_visit_id;
                        END IF;                         
                      WHEN @missed_hiv_drug_construct5 = "" THEN
                        IF in_field_voided = 0 THEN
                          UPDATE flat_table2 SET missed_hiv_drug_construct5 = in_field_value_text, missed_hiv_drug_construct5_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                        ELSE
                          UPDATE flat_table2 SET missed_hiv_drug_construct5 = NULL, missed_hiv_drug_construct5_enc_id = NULL WHERE flat_table2.id = in_visit_id;
                        END IF;                          
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
                        IF COALESCE(in_field_value_numeric, 0) = 0 THEN
                          INSERT INTO flat_table2 (patient_id, visit_date, what_was_the_patient_adherence_for_this_drug1, what_was_the_patient_adherence_for_this_drug1_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                        ELSE
                          INSERT INTO flat_table2 (patient_id, visit_date, what_was_the_patient_adherence_for_this_drug1, what_was_the_patient_adherence_for_this_drug1_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_numeric, encounter_id);
                        END IF;
                         
                      WHEN @what_was_the_patient_adherence_for_this_drug2 = "" THEN
                        IF COALESCE(in_field_value_numeric, 0) = 0 THEN
                          INSERT INTO flat_table2 (patient_id, visit_date, what_was_the_patient_adherence_for_this_drug2, what_was_the_patient_adherence_for_this_drug2_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                        ELSE
                          INSERT INTO flat_table2 (patient_id, visit_date, what_was_the_patient_adherence_for_this_drug2, what_was_the_patient_adherence_for_this_drug2_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_numeric, encounter_id);
                        END IF;
                          
                      WHEN @what_was_the_patient_adherence_for_this_drug3 = "" THEN
                        IF COALESCE(in_field_value_numeric, 0) = 0 THEN
                          INSERT INTO flat_table2 (patient_id, visit_date, what_was_the_patient_adherence_for_this_drug3, what_was_the_patient_adherence_for_this_drug3_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                        ELSE
                          INSERT INTO flat_table2 (patient_id, visit_date, what_was_the_patient_adherence_for_this_drug3, what_was_the_patient_adherence_for_this_drug3_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_numeric, encounter_id);
                        END IF;
                        
                      WHEN @what_was_the_patient_adherence_for_this_drug4 = "" THEN
                        IF COALESCE(in_field_value_numeric, 0) = 0 THEN
                          INSERT INTO flat_table2 (patient_id, visit_date, what_was_the_patient_adherence_for_this_drug4, what_was_the_patient_adherence_for_this_drug4_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                        ELSE
                          INSERT INTO flat_table2 (patient_id, visit_date, what_was_the_patient_adherence_for_this_drug4, what_was_the_patient_adherence_for_this_drug4_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_numeric, encounter_id);              
                        END IF;
                      WHEN @what_was_the_patient_adherence_for_this_drug5 = "" THEN
                        IF COALESCE(in_field_value_numeric, 0) = 0 THEN
                          INSERT INTO flat_table2 (patient_id, visit_date, what_was_the_patient_adherence_for_this_drug5, what_was_the_patient_adherence_for_this_drug5_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                        ELSE
                          INSERT INTO flat_table2 (patient_id, visit_date, what_was_the_patient_adherence_for_this_drug5, what_was_the_patient_adherence_for_this_drug5_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_numeric, encounter_id);              
                        END IF;                      
                      ELSE
                      
                          SET @enc_id = encounter_id;                  
                  
                  END CASE;
              
              ELSE 
              
                  CASE 
                  
                      WHEN @what_was_the_patient_adherence_for_this_drug1 = "" THEN
                        IF in_field_voided = 0 THEN
                          IF COALESCE(in_field_value_numeric, 0) = 0 THEN
                            UPDATE flat_table2 SET what_was_the_patient_adherence_for_this_drug1 = in_field_value_text, what_was_the_patient_adherence_for_this_drug1_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                          ELSE
                            UPDATE flat_table2 SET what_was_the_patient_adherence_for_this_drug1 = in_field_value_numeric, what_was_the_patient_adherence_for_this_drug1_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                          END IF;
                        ELSE
                          UPDATE flat_table2 SET what_was_the_patient_adherence_for_this_drug1 = NULL, what_was_the_patient_adherence_for_this_drug1_enc_id = NULL WHERE flat_table2.id = in_visit_id;
                        END IF;
                      WHEN @what_was_the_patient_adherence_for_this_drug2 = "" THEN
                        IF in_field_voided = 0 THEN
                          IF COALESCE(in_field_value_numeric, 0) = 0 THEN                    
                            UPDATE flat_table2 SET what_was_the_patient_adherence_for_this_drug2 = in_field_value_text, what_was_the_patient_adherence_for_this_drug2_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                          ELSE
                            UPDATE flat_table2 SET what_was_the_patient_adherence_for_this_drug2 = in_field_value_numeric, what_was_the_patient_adherence_for_this_drug2_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                          END IF;
                        ELSE
                          UPDATE flat_table2 SET what_was_the_patient_adherence_for_this_drug2 = NULL, what_was_the_patient_adherence_for_this_drug2_enc_id = NULL WHERE flat_table2.id = in_visit_id;
                        END IF;
                      WHEN @what_was_the_patient_adherence_for_this_drug3 = "" THEN
                        IF in_field_voided = 0 THEN
                          IF COALESCE(in_field_value_numeric, 0) = 0 THEN                                        
                            UPDATE flat_table2 SET what_was_the_patient_adherence_for_this_drug3 = in_field_value_text, what_was_the_patient_adherence_for_this_drug3_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                          ELSE
                            UPDATE flat_table2 SET what_was_the_patient_adherence_for_this_drug3 = in_field_value_numeric, what_was_the_patient_adherence_for_this_drug3_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                          END IF;
                        ELSE
                          UPDATE flat_table2 SET what_was_the_patient_adherence_for_this_drug3 = NULL, what_was_the_patient_adherence_for_this_drug3_enc_id = NULL WHERE flat_table2.id = in_visit_id;
                        END IF;
                      WHEN @what_was_the_patient_adherence_for_this_drug4 = "" THEN
                        IF in_field_voided = 0 THEN
                          IF COALESCE(in_field_value_numeric, 0) = 0 THEN                                        
                            UPDATE flat_table2 SET what_was_the_patient_adherence_for_this_drug4 = in_field_value_text, what_was_the_patient_adherence_for_this_drug4_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                          ELSE
                            UPDATE flat_table2 SET what_was_the_patient_adherence_for_this_drug4 = in_field_value_numeric, what_was_the_patient_adherence_for_this_drug4_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                          END IF;
                        ELSE
                          UPDATE flat_table2 SET what_was_the_patient_adherence_for_this_drug4 = NULL, what_was_the_patient_adherence_for_this_drug4_enc_id = NULL WHERE flat_table2.id = in_visit_id;
                        END IF;
                      WHEN @what_was_the_patient_adherence_for_this_drug5 = "" THEN
                        IF in_field_voided = 0 THEN
                          IF COALESCE(in_field_value_numeric, 0) = 0 THEN                                        
                            UPDATE flat_table2 SET what_was_the_patient_adherence_for_this_drug5 = in_field_value_text, what_was_the_patient_adherence_for_this_drug5_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                          ELSE
                            UPDATE flat_table2 SET what_was_the_patient_adherence_for_this_drug5 = in_field_value_numeric, what_was_the_patient_adherence_for_this_drug5_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                          END IF;
                        ELSE
                          UPDATE flat_table2 SET what_was_the_patient_adherence_for_this_drug5 = NULL, what_was_the_patient_adherence_for_this_drug5_enc_id = NULL WHERE flat_table2.id = in_visit_id;
                        END IF;                                
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
                        IF in_field_voided = 0 THEN
                          UPDATE flat_table2 SET amount_of_drug1_remaining_at_home = in_field_value_numeric, amount_of_drug1_remaining_at_home_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                        ELSE
                          UPDATE flat_table2 SET amount_of_drug1_remaining_at_home = NULL, amount_of_drug1_remaining_at_home_enc_id = NULL WHERE flat_table2.id = in_visit_id;
                        END IF;
                      WHEN @amount_of_drug2_remaining_at_home = "" THEN
                        IF in_field_voided = 0 THEN
                          UPDATE flat_table2 SET amount_of_drug2_remaining_at_home = in_field_value_numeric, amount_of_drug2_remaining_at_home_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                        ELSE
                          UPDATE flat_table2 SET amount_of_drug2_remaining_at_home = NULL, amount_of_drug2_remaining_at_home_enc_id = NULL WHERE flat_table2.id = in_visit_id;
                        END IF;
                      WHEN @amount_of_drug3_remaining_at_home = "" THEN
                        IF in_field_voided = 0 THEN
                          UPDATE flat_table2 SET amount_of_drug3_remaining_at_home = in_field_value_numeric, amount_of_drug3_remaining_at_home_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                        ELSE
                          UPDATE flat_table2 SET amount_of_drug3_remaining_at_home = NULL, amount_of_drug3_remaining_at_home_enc_id = NULL WHERE flat_table2.id = in_visit_id;
                        END IF;                        
                      WHEN @amount_of_drug4_remaining_at_home = "" THEN
                        IF in_field_voided = 0 THEN
                          UPDATE flat_table2 SET amount_of_drug4_remaining_at_home = in_field_value_numeric, amount_of_drug4_remaining_at_home_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                        ELSE
                          UPDATE flat_table2 SET amount_of_drug4_remaining_at_home = NULL, amount_of_drug4_remaining_at_home_enc_id = NULL WHERE flat_table2.id = in_visit_id;
                        END IF;                         
                      WHEN @amount_of_drug5_remaining_at_home = "" THEN
                        IF in_field_voided = 0 THEN
                          UPDATE flat_table2 SET amount_of_drug5_remaining_at_home = in_field_value_numeric, amount_of_drug5_remaining_at_home_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                        ELSE
                          UPDATE flat_table2 SET amount_of_drug5_remaining_at_home = NULL, amount_of_drug5_remaining_at_home_enc_id = NULL WHERE flat_table2.id = in_visit_id;
                        END IF;                                      
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
                        IF in_field_voided = 0 THEN
                          UPDATE flat_table2 SET amount_of_drug1_brought_to_clinic = in_field_value_numeric, amount_of_drug1_brought_to_clinic_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                        ELSE
                          UPDATE flat_table2 SET amount_of_drug1_brought_to_clinic = NULL, amount_of_drug1_brought_to_clinic_enc_id = NULL WHERE flat_table2.id = in_visit_id;
                        END IF;
                      WHEN @amount_of_drug2_brought_to_clinic = "" THEN
                        IF in_field_voided = 0 THEN
                          UPDATE flat_table2 SET amount_of_drug2_brought_to_clinic = in_field_value_numeric, amount_of_drug2_brought_to_clinic_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                        ELSE
                          UPDATE flat_table2 SET amount_of_drug2_brought_to_clinic = NULL, amount_of_drug2_brought_to_clinic_enc_id = NULL WHERE flat_table2.id = in_visit_id;
                        END IF;                          
                      WHEN @amount_of_drug3_brought_to_clinic = "" THEN
                        IF in_field_voided = 0 THEN
                          UPDATE flat_table2 SET amount_of_drug3_brought_to_clinic = in_field_value_numeric, amount_of_drug3_brought_to_clinic_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                        ELSE
                          UPDATE flat_table2 SET amount_of_drug3_brought_to_clinic = NULL, amount_of_drug3_brought_to_clinic_enc_id = NULL WHERE flat_table2.id = in_visit_id;
                        END IF;                        
                      WHEN @amount_of_drug4_brought_to_clinic = "" THEN
                        IF in_field_voided = 0 THEN
                          UPDATE flat_table2 SET amount_of_drug4_brought_to_clinic = in_field_value_numeric, amount_of_drug4_brought_to_clinic_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                        ELSE
                          UPDATE flat_table2 SET amount_of_drug4_brought_to_clinic = NULL, amount_of_drug4_brought_to_clinic_enc_id = NULL WHERE flat_table2.id = in_visit_id;
                        END IF;                         
                      WHEN @amount_of_drug5_brought_to_clinic = "" THEN
                        IF in_field_voided = 0 THEN
                          UPDATE flat_table2 SET amount_of_drug5_brought_to_clinic = in_field_value_numeric, amount_of_drug5_brought_to_clinic_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                        ELSE
                          UPDATE flat_table2 SET amount_of_drug5_brought_to_clinic = NULL, amount_of_drug5_brought_to_clinic_enc_id = NULL WHERE flat_table2.id = in_visit_id;
                        END IF;                                      
                      ELSE
                      
                          SET @enc_id = encounter_id;                  
                  
                  END CASE;
                                              
              END IF;       
      
      ##########################################################################################################################################
      
          WHEN @cpt_given THEN
            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
                
                  INSERT INTO flat_table2 (patient_id, visit_date, condoms_given, condoms_given_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
              
              ELSE 
              
                UPDATE flat_table2 SET condoms_given = in_field_value_numeric, condoms_given_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET condoms_given = NULL, condoms_given_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF; 
          
          WHEN @appointment_date THEN
            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, appointment_date, appointment_date_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_datetime, encounter_id);
              
              ELSE 
              
                UPDATE flat_table2 SET appointment_date = in_field_value_datetime, appointment_date_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;       
            ELSE
              UPDATE flat_table2 SET appointment_date = NULL, appointment_date_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;      
          WHEN @transfer_out_location THEN
            IF in_field_voided = 0 THEN          
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, transfer_out_location, transfer_out_location_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
              
              ELSE 
                UPDATE flat_table2 SET transfer_out_location = in_field_value_text, transfer_out_location_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;       
            ELSE
              UPDATE flat_table2 SET transfer_out_location = NULL, transfer_out_location_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;
          WHEN @regimen_category THEN
              
              SET @reg_category = COALESCE((SELECT obs.value_text FROM obs obs INNER JOIN encounter e ON e.encounter_id = obs.encounter_id and e.encounter_type = 54 WHERE obs.person_id = in_patient_id AND obs.encounter_id = encounter_id AND DATE(obs.obs_datetime) = DATE(in_visit_date) LIMIT 1),in_field_value_text);

            IF in_field_voided = 0 THEN
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, regimen_category, regimen_category_enc_id) VALUES (in_patient_id, in_visit_date, @reg_category, encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET regimen_category = @reg_category, regimen_category_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET regimen_category = NULL, regimen_category_enc_id = NULL WHERE flat_table2.id = in_visit_id;              
            END IF;                    
      
          WHEN @Weight THEN
            IF in_field_voided = 0 THEN
            #--check if weight was saved as text or nemeric
            IF ISNULL(in_field_value_numeric) THEN
              SET @wt_value = in_field_value_text;
            ELSE
              SET @wt_value = in_field_value_numeric;            
            END IF;

              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, Weight, Weight_enc_id) VALUES (in_patient_id, in_visit_date, @wt_value, encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET Weight = @wt_value, Weight_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET Weight = NULL, Weight_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;       
      
          WHEN @Height THEN
            IF in_field_voided = 0 THEN

            #--check if weight was saved as text or nemeric
            IF ISNULL(in_field_value_numeric) THEN
              SET @ht_value = in_field_value_text;
            ELSE
              SET @ht_value = in_field_value_numeric;            
            END IF;
              
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, Height, Height_enc_id) VALUES (in_patient_id, in_visit_date, @ht_value, encounter_id);
              
              ELSE 
              
                UPDATE flat_table2 SET Height = @ht_value, Height_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
                UPDATE flat_table2 SET Height = NULL, Height_enc_id = NULL WHERE flat_table2.id = in_visit_id;              
            END IF;        
      
          WHEN @Temperature THEN
            IF in_field_voided = 0 THEN
            #--check if weight was saved as text or nemeric
              IF ISNULL(in_field_value_numeric) THEN
                SET @temp_value = in_field_value_text;
              ELSE
                SET @temp_value = in_field_value_numeric;            
              END IF;
          
              IF in_visit_id = 0 THEN
              
                INSERT INTO flat_table2 (patient_id, visit_date, Temperature, Temperature_enc_id) VALUES (in_patient_id, in_visit_date, @temp_value, encounter_id);
              
              ELSE 
                UPDATE flat_table2 SET Temperature = @temp_value, Temperature_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET Temperature = NULL, Temperature_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;              
      
          WHEN @BMI THEN
            IF in_field_voided = 0 THEN
              #--check if weight was saved as text or nemeric
              IF ISNULL(in_field_value_numeric) THEN
                SET @bmi_value = in_field_value_text;
              ELSE
                SET @bmi_value = in_field_value_numeric;            
              END IF;            
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, BMI, BMI_enc_id) VALUES (in_patient_id, in_visit_date, @bmi_value, encounter_id);
              
              ELSE 
              
                  UPDATE flat_table2 SET BMI = @bmi_value, BMI_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET BMI = NULL, BMI_enc_id = NULL WHERE flat_table2.id = in_visit_id;
      
            END IF;              
      
          WHEN @systolic_blood_pressure THEN
            IF in_field_voided = 0 THEN
              #--check if weight was saved as text or nemeric
              IF ISNULL(in_field_value_numeric) THEN
                SET @sys_value = in_field_value_text;
              ELSE
                SET @sys_value = in_field_value_numeric;            
              END IF;            
              IF in_visit_id = 0 THEN
                INSERT INTO flat_table2 (patient_id, visit_date, systolic_blood_pressure, systolic_blood_pressure_enc_id) VALUES (in_patient_id, in_visit_date, @sys_value, encounter_id);
              
              ELSE 
                UPDATE flat_table2 SET systolic_blood_pressure = @sys_value, systolic_blood_pressure_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
     
              END IF;
            ELSE
               UPDATE flat_table2 SET systolic_blood_pressure = NULL, systolic_blood_pressure_enc_id = NULL WHERE flat_table2.id = in_visit_id; 
            END IF;                  
      
          WHEN @diastolic_blood_pressure THEN
            IF in_field_voided = 0 THEN
              #--check if weight was saved as text or nemeric
              IF ISNULL(in_field_value_numeric) THEN
                SET @dia_value = in_field_value_text;
              ELSE
                SET @dia_value = in_field_value_numeric;            
              END IF;
               
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, diastolic_blood_pressure, diastolic_blood_pressure_enc_id) VALUES (in_patient_id, in_visit_date, @dia_value, encounter_id);
              
              ELSE 
              
                UPDATE flat_table2 SET diastolic_blood_pressure = @dia_value, diastolic_blood_pressure_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET diastolic_blood_pressure = NULL, diastolic_blood_pressure_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;                               
      
          WHEN @weight_for_height THEN
            IF in_field_voided = 0 THEN
              #--check if weight was saved as text or nemeric
              IF ISNULL(in_field_value_numeric) THEN
                SET @wt4ht_value = in_field_value_text;
              ELSE
                SET @wt4ht_value = in_field_value_numeric;            
              END IF;

              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, weight_for_height, weight_for_height_enc_id) VALUES (in_patient_id, in_visit_date, @wt4ht_value, encounter_id);
              
              ELSE 
                UPDATE flat_table2 SET weight_for_height = @wt4ht_value, weight_for_height_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET weight_for_height = NULL, weight_for_height_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;                     
      
          WHEN @weight_for_age THEN
            IF in_field_voided = 0 THEN
              #--check if weight was saved as text or nemeric
              IF ISNULL(in_field_value_numeric) THEN
                SET @wt4age_value = in_field_value_text;
              ELSE
                SET @wt4age = in_field_value_numeric;            
              END IF;              
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, weight_for_age, weight_for_age_enc_id) VALUES (in_patient_id, in_visit_date, @wt4age, encounter_id);
              
              ELSE 
                UPDATE flat_table2 SET weight_for_age = @wt4age, weight_for_age_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET weight_for_age = NULL, weight_for_age_enc_id = NULL WHERE flat_table2.id = in_visit_id;
            END IF;                                   
      
          WHEN @height_for_age THEN
            IF in_field_voided = 0 THEN          
              #--check if weight was saved as text or nemeric
              IF ISNULL(in_field_value_numeric) THEN
                SET @ht4age_value = in_field_value_text;
              ELSE
                SET @ht4age = in_field_value_numeric;            
              END IF;              
              IF in_visit_id = 0 THEN
              
                  INSERT INTO flat_table2 (patient_id, visit_date, height_for_age, height_for_age_enc_id) VALUES (in_patient_id, in_visit_date, @ht4age_value, encounter_id);
              
              ELSE 
                UPDATE flat_table2 SET height_for_age = @ht4age_value, height_for_age_enc_id = encounter_id WHERE flat_table2.id = in_visit_id;
                  
              END IF;
            ELSE
              UPDATE flat_table2 SET height_for_age = NULL, height_for_age_enc_id = NULL WHERE flat_table2.id = in_visit_id;            
            END IF;                           
              
          WHEN @ever_received_art THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET ever_received_art = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET ever_received_art = NULL WHERE flat_table1.patient_id= in_patient_id;
            END IF;
                               
          WHEN @date_last_taken_arv THEN
            IF in_field_voided = 0 THEN
              UPDATE flat_table1 SET date_art_last_taken = in_field_value_datetime, date_art_last_taken_v_date = in_visit_date WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET date_art_last_taken = NULL, date_art_last_taken_v_date = NULL WHERE flat_table1.patient_id= in_patient_id;
            END IF;
          WHEN @art_in_2_months THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET taken_art_in_last_two_months = @answer, taken_art_in_last_two_months_v_date = in_visit_date WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET taken_art_in_last_two_months = NULL, taken_art_in_last_two_months_v_date = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;
          WHEN @art_in_2_weeks THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET taken_art_in_last_two_weeks = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET taken_art_in_last_two_weeks = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;              
                              
          WHEN @last_arv_reg THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET last_art_drugs_taken = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET last_art_drugs_taken = NULL WHERE flat_table1.patient_id= in_patient_id;              
            END IF;
          WHEN @ever_reg_4_art THEN    
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET ever_registered_at_art_clinic = @answer, ever_registered_at_art_v_date = in_visit_date WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET ever_registered_at_art_clinic = NULL, ever_registered_at_art_v_date = NULL WHERE flat_table1.patient_id= in_patient_id;
            END IF;              
		           
          WHEN @has_transfer_letter THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET has_transfer_letter = @answer WHERE flat_table1.patient_id = patient_id;
            ELSE
              UPDATE flat_table1 SET has_transfer_letter = NULL WHERE flat_table1.patient_id = patient_id;              
            END IF;              		                    
                              
          WHEN @art_init_loc THEN
            IF in_field_voided = 0 THEN
				      SET @answer = (SELECT name FROM location WHERE location_id = in_field_value_text);
				   
				     	IF @answer = NULL THEN 
	        			UPDATE flat_table1 SET location_of_art_initialization = "Unknown" WHERE flat_table1.patient_id = patient_id ;
        			ELSE
        			  UPDATE flat_table1 SET location_of_art_initialization = @answer WHERE flat_table1.patient_id = patient_id ;
					    END IF;
					 ELSE
					  UPDATE flat_table1 SET location_of_art_initialization = NULL WHERE flat_table1.patient_id = patient_id ;
					 END IF;
				   
          WHEN @date_started_art THEN
            IF in_field_voided = 0 THEN
              UPDATE flat_table1 SET date_started_art = in_field_value_datetime WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET date_started_art = NULL WHERE flat_table1.patient_id= in_patient_id;
            END IF;
				  WHEN @cd4_count_loc THEN
            IF in_field_voided = 0 THEN
				      SET @answer = (SELECT name FROM location WHERE location_id = in_field_value_text);
				     
				     	IF @answer = NULL THEN 
	        			UPDATE flat_table1 SET cd4_count_location = "Unknown" WHERE flat_table1.patient_id = patient_id ;
        			ELSE
        				UPDATE flat_table1 SET cd4_count_location = @answer WHERE flat_table1.patient_id = patient_id ;

					    END IF;
					  ELSE
              UPDATE flat_table1 SET cd4_count_location = NULL WHERE flat_table1.patient_id = patient_id ;
					  END IF;
				
				  WHEN @cd4_percent_loc THEN
            IF in_field_voided = 0 THEN
      			  UPDATE flat_table1 SET cd4_count_location = in_field_value_text WHERE flat_table1.patient_id = patient_id ;
				    ELSE
      			  UPDATE flat_table1 SET cd4_count_location = NULL WHERE flat_table1.patient_id = patient_id ;				    
				    END IF;
          WHEN @cd4_count_date THEN
            IF in_field_voided = 0 THEN
              UPDATE flat_table1 SET cd4_count_datetime = in_field_value_datetime WHERE flat_table1.patient_id= in_patient_id;                           				                                              
	          ELSE
              UPDATE flat_table1 SET cd4_count_datetime = NULL WHERE flat_table1.patient_id= in_patient_id;	          
            END IF; 
          WHEN @cd4_count_percent THEN

              UPDATE flat_table1 SET cd4_count_percent = in_field_value_numeric WHERE flat_table1.patient_id= in_patient_id;
           
          WHEN @cd4_percent_less_than_25 THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET cd4_percent_less_than_25 = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET cd4_percent_less_than_25 = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;                              
          WHEN @cd4_count_less_than_250 THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET cd4_count_less_than_250 = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET cd4_count_less_than_250 = NULL WHERE flat_table1.patient_id= in_patient_id;
            END IF;                                         
          WHEN @cd4_count_less_than_350 THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET cd4_count_less_than_350 = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET cd4_count_less_than_350 = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;                              
          WHEN @lymphocyte_count_date THEN
            IF in_field_voided = 0 THEN
              UPDATE flat_table1 SET lymphocyte_count_date = in_field_value_datetime WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET lymphocyte_count_date = NULL WHERE flat_table1.patient_id= in_patient_id;
            END IF;                  
          WHEN @lymphocyte_count THEN
            IF in_field_voided = 0 THEN
              UPDATE flat_table1 SET lymphocyte_count = in_field_value_numeric WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET lymphocyte_count = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;
          WHEN @asymptomatic THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET asymptomatic = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET asymptomatic = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;
          WHEN @pers_gnrl_lymphadenopathy THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET persistent_generalized_lymphadenopathy = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET persistent_generalized_lymphadenopathy = NULL WHERE flat_table1.patient_id= in_patient_id;
            END IF;
          WHEN @unspecified_stage_1_cond THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET unspecified_stage_1_cond = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET unspecified_stage_1_cond = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;
          WHEN @molluscumm_contagiosum THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET molluscumm_contagiosum = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET molluscumm_contagiosum = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;
          WHEN @wart_virus_infection_extensive THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET wart_virus_infection_extensive = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET wart_virus_infection_extensive = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;
          WHEN @oral_ulcerations_recurrent THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET oral_ulcerations_recurrent = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET oral_ulcerations_recurrent = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;
          WHEN @parotid_enlargement_pers_unexp THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

          UPDATE flat_table1 SET parotid_enlargement_persistent_unexplained = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET parotid_enlargement_persistent_unexplained = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;
          WHEN @lineal_gingival_erythema THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET lineal_gingival_erythema = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET lineal_gingival_erythema = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;
          WHEN @herpes_zoster THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET herpes_zoster = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET herpes_zoster = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;
          WHEN @resp_tract_infections_rec THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET respiratory_tract_infections_recurrent = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET respiratory_tract_infections_recurrent = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;
          WHEN @unspecified_stage2_condition THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET unspecified_stage2_condition = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET unspecified_stage2_condition = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;
          WHEN @angular_chelitis THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET angular_chelitis = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET angular_chelitis = NULL WHERE flat_table1.patient_id= in_patient_id;
            END IF;
          WHEN @papular_prurtic_eruptions THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET papular_pruritic_eruptions = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET papular_pruritic_eruptions = NULL WHERE flat_table1.patient_id= in_patient_id;
            END IF;
          WHEN @hepatosplenomegaly_unexplained THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET hepatosplenomegaly_unexplained = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET hepatosplenomegaly_unexplained = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;
          WHEN @oral_hairy_leukoplakia THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET oral_hairy_leukoplakia = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET oral_hairy_leukoplakia = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;                   
          WHEN @severe_weight_loss THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET severe_weight_loss = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET severe_weight_loss = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;                              
          WHEN @fever_persistent_unexplained THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET fever_persistent_unexplained = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET fever_persistent_unexplained = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;
          WHEN @pulmonary_tuberculosis THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET pulmonary_tuberculosis = @answer, pulmonary_tuberculosis_v_date = in_visit_date WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET pulmonary_tuberculosis = NULL, pulmonary_tuberculosis_v_date = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;                              
          WHEN @pulmonary_tuberculosis_last_2_years THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET pulmonary_tuberculosis_last_2_years = @answer, pulmonary_tuberculosis_last_2_years_v_date = in_visit_date WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET pulmonary_tuberculosis_last_2_years = NULL, pulmonary_tuberculosis_last_2_years_v_date = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;
          WHEN @severe_bacterial_infection THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET severe_bacterial_infection = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET severe_bacterial_infection = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;                              
          WHEN @bacterial_pnuemonia THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET bacterial_pnuemonia = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET bacterial_pnuemonia = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;                              
          WHEN @symptomatic_lymphoid_interstitial_pnuemonitis THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET symptomatic_lymphoid_interstitial_pnuemonitis = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET symptomatic_lymphoid_interstitial_pnuemonitis = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;                              
          WHEN @chronic_hiv_assoc_lung_disease THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET chronic_hiv_assoc_lung_disease = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET chronic_hiv_assoc_lung_disease = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;                              
          WHEN @unspecified_stage3_condition THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET unspecified_stage3_condition = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET unspecified_stage3_condition = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;
          WHEN @aneamia THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET aneamia = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET aneamia = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;		
          WHEN @neutropaenia THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET neutropaenia = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET neutropaenia = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;
          WHEN @thrombocytopaenia_chronic THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET thrombocytopaenia_chronic = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET thrombocytopaenia_chronic = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;
          WHEN @diarhoea THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET diarhoea = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET diarhoea = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;		           
          WHEN @oral_candidiasis THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET oral_candidiasis = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET oral_candidiasis = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;
          WHEN @acute_necrotizing_ulcerative_gingivitis THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET acute_necrotizing_ulcerative_gingivitis = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET acute_necrotizing_ulcerative_gingivitis = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;
          WHEN @lymph_node_tuberculosis THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET lymph_node_tuberculosis = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET lymph_node_tuberculosis = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;                              
          WHEN @toxoplasmosis_of_brain THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET toxoplasmosis_of_the_brain  = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET toxoplasmosis_of_the_brain  = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;
          WHEN @cryptococcal_meningitis THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET cryptococcal_meningitis = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET cryptococcal_meningitis = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;
          WHEN @progressive_multifocal_leukoencephalopathy THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET progressive_multifocal_leukoencephalopathy = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET progressive_multifocal_leukoencephalopathy = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;
          WHEN @disseminated_mycosis THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET disseminated_mycosis = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET disseminated_mycosis = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;                              
          WHEN @candidiasis_of_oesophagus THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET candidiasis_of_oesophagus = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET candidiasis_of_oesophagus = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;
          WHEN @extrapulmonary_tuberculosis THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET extrapulmonary_tuberculosis = @answer, extrapulmonary_tuberculosis_v_date = in_visit_date WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET extrapulmonary_tuberculosis = NULL, extrapulmonary_tuberculosis_v_date = NULL WHERE flat_table1.patient_id= in_patient_id;
            END IF;
          WHEN @cerebral_non_hodgkin_lymphoma THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET cerebral_non_hodgkin_lymphoma = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET cerebral_non_hodgkin_lymphoma = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;
          WHEN @hiv_encephalopathy THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET hiv_encephalopathy = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET hiv_encephalopathy = NULL WHERE flat_table1.patient_id= in_patient_id;
            END IF;
          WHEN @bacterial_infections_severe_recurrent  THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET bacterial_infections_severe_recurrent = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET bacterial_infections_severe_recurrent = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;
          WHEN @unspecified_stage_4_condition THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET unspecified_stage_4_condition = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET unspecified_stage_4_condition = NULL WHERE flat_table1.patient_id= in_patient_id;
            END IF;
          WHEN @pnuemocystis_pnuemonia THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET pnuemocystis_pnuemonia = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET pnuemocystis_pnuemonia = NULL WHERE flat_table1.patient_id= in_patient_id;
            END IF;
          WHEN @disseminated_non_tuberculosis_mycobactierial_infection THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET disseminated_non_tuberculosis_mycobacterial_infection = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET disseminated_non_tuberculosis_mycobacterial_infection = NULL WHERE flat_table1.patient_id= in_patient_id;
            END IF;                              
          WHEN @cryptosporidiosis THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET cryptosporidiosis = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET cryptosporidiosis = NULL WHERE flat_table1.patient_id= in_patient_id;
            END IF;
          WHEN @isosporiasis THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET isosporiasis = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET isosporiasis = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;                 
          WHEN @symptomatic_hiv_asscoiated_nephropathy THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET symptomatic_hiv_associated_nephropathy = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET symptomatic_hiv_associated_nephropathy = NULL WHERE flat_table1.patient_id= in_patient_id;
            END IF;
          WHEN @chronic_herpes_simplex_infection THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET chronic_herpes_simplex_infection = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET chronic_herpes_simplex_infection = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;
          WHEN @cytomegalovirus_infection THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET cytomegalovirus_infection = @answer WHERE flat_table1.patient_id= in_patient_id;
				    ELSE
              UPDATE flat_table1 SET cytomegalovirus_infection = NULL WHERE flat_table1.patient_id= in_patient_id;				    
				    END IF;                        
          WHEN @toxoplasomis_of_the_brain_1month THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET toxoplasomis_of_the_brain_1month = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET toxoplasomis_of_the_brain_1month = NULL WHERE flat_table1.patient_id= in_patient_id;
            END IF;
          WHEN @recto_vaginal_fitsula THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET recto_vaginal_fitsula = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET recto_vaginal_fitsula = NULL WHERE flat_table1.patient_id= in_patient_id;
            END IF;
          WHEN @pnuemocystis_pnuemonia THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET pnuemocystis_pnuemonia = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET pnuemocystis_pnuemonia = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;
          WHEN @mod_wght_loss_less_thanequal_to_10_perc THEN 
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET moderate_weight_loss_less_than_or_equal_to_10_percent_unexpl = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET moderate_weight_loss_less_than_or_equal_to_10_percent_unexpl = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;
          WHEN @seborrhoeic_dermatitis THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET seborrhoeic_dermatitis = @answer WHERE flat_table1.patient_id= in_patient_id;
				    ELSE
              UPDATE flat_table1 SET seborrhoeic_dermatitis = NULL WHERE flat_table1.patient_id= in_patient_id;				    
				    END IF;                    
          WHEN @hepatitis_b_or_c_infection THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET hepatitis_b_or_c_infection = @answer WHERE flat_table1.patient_id= in_patient_id;
				    ELSE
              UPDATE flat_table1 SET hepatitis_b_or_c_infection = NULL WHERE flat_table1.patient_id= in_patient_id;				    
            END IF;                    
          WHEN @kaposis_sarcoma THEN  
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET kaposis_sarcoma = @answer, kaposis_sarcoma_v_date = in_visit_date WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET kaposis_sarcoma = NULL, kaposis_sarcoma_v_date = NULL WHERE flat_table1.patient_id= in_patient_id;
            END IF;
          WHEN @non_typhoidal_salmonella_bacteraemia_recurrent THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET non_typhoidal_salmonella_bacteraemia_recurrent = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET non_typhoidal_salmonella_bacteraemia_recurrent = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;
          WHEN @leishmaniasis_atypical_disseminated  THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET leishmaniasis_atypical_disseminated = @answer WHERE flat_table1.patient_id= in_patient_id;
            ELSE
              UPDATE flat_table1 SET leishmaniasis_atypical_disseminated = NULL WHERE flat_table1.patient_id= in_patient_id;            
            END IF;
          WHEN @cerebral_or_b_cell_non_hodgkin_lymphoma  THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET cerebral_or_b_cell_non_hodgkin_lymphoma = @answer WHERE flat_table1.patient_id= in_patient_id;
				    ELSE
              UPDATE flat_table1 SET cerebral_or_b_cell_non_hodgkin_lymphoma = NULL WHERE flat_table1.patient_id= in_patient_id;				    
				    END IF;                      
          WHEN @invasive_cancer_of_cervix THEN
            IF in_field_voided = 0 THEN
              SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                  WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              UPDATE flat_table1 SET invasive_cancer_of_cervix = @answer WHERE flat_table1.patient_id= in_patient_id;
           ELSE
              UPDATE flat_table1 SET invasive_cancer_of_cervix = NULL WHERE flat_table1.patient_id= in_patient_id;           
           END IF;
           
           
        WHEN @cryptococcal_meningitis_or_other_eptb_cryptococcosis THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET cryptococcal_meningitis_or_other_eptb_cryptococcosis = @answer,   
                cryptococcal_meningitis_or_other_eptb_cryptococcosis_v_date = in_visit_date,
                cryptococcal_meningitis_or_other_eptb_cryptococcosis_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET cryptococcal_meningitis_or_other_eptb_cryptococcosis = NULL,
                cryptococcal_meningitis_or_other_eptb_cryptococcosis_v_date = NULL,
                cryptococcal_meningitis_or_other_eptb_cryptococcosis_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;

        WHEN @candidiasis_of_oesophagus_trachea_bronchi_or_lungs THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET candidiasis_of_oesophagus_trachea_bronchi_or_lungs = @answer,   
                candidiasis_of_oesophagus_trachea_bronchi_or_lungs_v_date = in_visit_date,
                candidiasis_of_oesophagus_trachea_bronchi_or_lungs_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET candidiasis_of_oesophagus_trachea_bronchi_or_lungs = NULL,
                candidiasis_of_oesophagus_trachea_bronchi_or_lungs_v_date = NULL,
                candidiasis_of_oesophagus_trachea_bronchi_or_lungs_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;

        WHEN @severe_unexplained_wasting_malnutrition THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET severe_unexplained_wasting_malnutrition = @answer,   
                severe_unexplained_wasting_malnutrition_v_date = in_visit_date,
                severe_unexplained_wasting_malnutrition_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET severe_unexplained_wasting_malnutrition = NULL,
                severe_unexplained_wasting_malnutrition_v_date = NULL,
                severe_unexplained_wasting_malnutrition_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;

        WHEN @diarrhoea_chronic_less_1_month_unexplained THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET diarrhoea_chronic_less_1_month_unexplained = @answer,   
                diarrhoea_chronic_less_1_month_unexplained_v_date = in_visit_date,
                diarrhoea_chronic_less_1_month_unexplained_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET diarrhoea_chronic_less_1_month_unexplained = NULL,
                diarrhoea_chronic_less_1_month_unexplained_v_date = NULL,
                diarrhoea_chronic_less_1_month_unexplained_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;

        WHEN @moderate_weight_loss_10_unexplained THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET moderate_weight_loss_10_unexplained = @answer,   
                moderate_weight_loss_10_unexplained_v_date = in_visit_date,
                moderate_weight_loss_10_unexplained_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET moderate_weight_loss_10_unexplained = NULL,
                moderate_weight_loss_10_unexplained_v_date = NULL,
                moderate_weight_loss_10_unexplained_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;

        WHEN @acute_necrotizing_ulcerative_stomatitis_gingivitis_or_period THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET acute_necrotizing_ulcerative_stomatitis_gingivitis_or_period = @answer,   
                acute_necrotizing_ulcerative_stomatitis_gingivitis_or_period_v_date = in_visit_date,
                acute_necrotizing_ulcerative_stomatitis_gingivitis_or_period_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET acute_necrotizing_ulcerative_stomatitis_gingivitis_or_period = NULL,
                acute_necrotizing_ulcerative_stomatitis_gingivitis_or_period_v_date = NULL,
                acute_necrotizing_ulcerative_stomatitis_gingivitis_or_period_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;

        WHEN @moderate_unexplained_wasting_malnutrition THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET moderate_unexplained_wasting_malnutrition = @answer,   
                moderate_unexplained_wasting_malnutrition_v_date = in_visit_date,
                moderate_unexplained_wasting_malnutrition_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET moderate_unexplained_wasting_malnutrition = NULL,
                moderate_unexplained_wasting_malnutrition_v_date = NULL,
                moderate_unexplained_wasting_malnutrition_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;

        WHEN @diarrhoea_persistent_unexplained_14_days_or_more THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET diarrhoea_persistent_unexplained_14_days_or_more = @answer,   
                diarrhoea_persistent_unexplained_14_days_or_more_v_date = in_visit_date,
                diarrhoea_persistent_unexplained_14_days_or_more_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET diarrhoea_persistent_unexplained_14_days_or_more = NULL,
                diarrhoea_persistent_unexplained_14_days_or_more_v_date = NULL,
                diarrhoea_persistent_unexplained_14_days_or_more_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;

        WHEN @acute_ulcerative_mouth_infections THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET acute_ulcerative_mouth_infections = @answer,   
                acute_ulcerative_mouth_infections_v_date = in_visit_date,
                acute_ulcerative_mouth_infections_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET acute_ulcerative_mouth_infections = NULL,
                acute_ulcerative_mouth_infections_v_date = NULL,
                acute_ulcerative_mouth_infections_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;

        WHEN @anaemia_unexplained_8_g_dl THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET anaemia_unexplained_8_g_dl = @answer,   
                anaemia_unexplained_8_g_dl_v_date = in_visit_date,
                anaemia_unexplained_8_g_dl_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET anaemia_unexplained_8_g_dl = NULL,
                anaemia_unexplained_8_g_dl_v_date = NULL,
                anaemia_unexplained_8_g_dl_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;

        WHEN @atypical_mycobacteriosis_disseminated_or_lung THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET atypical_mycobacteriosis_disseminated_or_lung = @answer,   
                atypical_mycobacteriosis_disseminated_or_lung_v_date = in_visit_date,
                atypical_mycobacteriosis_disseminated_or_lung_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET atypical_mycobacteriosis_disseminated_or_lung = NULL,
                atypical_mycobacteriosis_disseminated_or_lung_v_date = NULL,
                atypical_mycobacteriosis_disseminated_or_lung_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;

        WHEN @bacterial_infections_sev_recurrent_excluding_pneumonia THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET bacterial_infections_sev_recurrent_excluding_pneumonia = @answer,   
                bacterial_infections_sev_recurrent_excluding_pneumonia_v_date = in_visit_date,
                bacterial_infections_sev_recurrent_excluding_pneumonia_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET bacterial_infections_sev_recurrent_excluding_pneumonia = NULL,
                bacterial_infections_sev_recurrent_excluding_pneumonia_v_date = NULL,
                bacterial_infections_sev_recurrent_excluding_pneumonia_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;

        WHEN @cancer_cervix THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET cancer_cervix = @answer,   
                cancer_cervix_v_date = in_visit_date,
                cancer_cervix_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET cancer_cervix = NULL,
                cancer_cervix_v_date = NULL,
                cancer_cervix_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;

        WHEN @chronic_herpes_simplex_infection_genital THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET chronic_herpes_simplex_infection_genital = @answer,   
                chronic_herpes_simplex_infection_genital_v_date = in_visit_date,
                chronic_herpes_simplex_infection_genital_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET chronic_herpes_simplex_infection_genital = NULL,
                chronic_herpes_simplex_infection_genital_v_date = NULL,
                chronic_herpes_simplex_infection_genital_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;

        WHEN @cryptosporidiosis_chronic_with_diarrhoea THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET cryptosporidiosis_chronic_with_diarrhoea = @answer,   
                cryptosporidiosis_chronic_with_diarrhoea_v_date = in_visit_date,
                cryptosporidiosis_chronic_with_diarrhoea_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET cryptosporidiosis_chronic_with_diarrhoea = NULL,
                cryptosporidiosis_chronic_with_diarrhoea_v_date = NULL,
                cryptosporidiosis_chronic_with_diarrhoea_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;

        WHEN @cytomegalovirus_infection_retinitis_or_other_organ THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET cytomegalovirus_infection_retinitis_or_other_organ = @answer,   
                cytomegalovirus_infection_retinitis_or_other_organ_v_date = in_visit_date,
                cytomegalovirus_infection_retinitis_or_other_organ_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET cytomegalovirus_infection_retinitis_or_other_organ = NULL,
                cytomegalovirus_infection_retinitis_or_other_organ_v_date = NULL,
                cytomegalovirus_infection_retinitis_or_other_organ_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;

        WHEN @cytomegalovirus_of_an_organ_other_than_liver THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET cytomegalovirus_of_an_organ_other_than_liver = @answer,   
                cytomegalovirus_of_an_organ_other_than_liver_v_date = in_visit_date,
                cytomegalovirus_of_an_organ_other_than_liver_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET cytomegalovirus_of_an_organ_other_than_liver = NULL,
                cytomegalovirus_of_an_organ_other_than_liver_v_date = NULL,
                cytomegalovirus_of_an_organ_other_than_liver_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;

        WHEN @fungal_nail_infections THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET fungal_nail_infections = @answer,   
                fungal_nail_infections_v_date = in_visit_date,
                fungal_nail_infections_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET fungal_nail_infections = NULL,
                fungal_nail_infections_v_date = NULL,
                fungal_nail_infections_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;

        WHEN @herpes_simplex_infection_mucocutaneous_visceral THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET herpes_simplex_infection_mucocutaneous_visceral = @answer,   
                herpes_simplex_infection_mucocutaneous_visceral_v_date = in_visit_date,
                herpes_simplex_infection_mucocutaneous_visceral_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET herpes_simplex_infection_mucocutaneous_visceral = NULL,
                herpes_simplex_infection_mucocutaneous_visceral_v_date = NULL,
                herpes_simplex_infection_mucocutaneous_visceral_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;

        WHEN @hiv_associated_cardiomyopathy THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET hiv_associated_cardiomyopathy = @answer,   
                hiv_associated_cardiomyopathy_v_date = in_visit_date,
                hiv_associated_cardiomyopathy_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET hiv_associated_cardiomyopathy = NULL,
                hiv_associated_cardiomyopathy_v_date = NULL,
                hiv_associated_cardiomyopathy_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;

        WHEN @hiv_associated_nephropathy THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET hiv_associated_nephropathy = @answer,   
                hiv_associated_nephropathy_v_date = in_visit_date,
                hiv_associated_nephropathy_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET hiv_associated_nephropathy = NULL,
                hiv_associated_nephropathy_v_date = NULL,
                hiv_associated_nephropathy_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;

        WHEN @invasive_cancer_cervix THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET invasive_cancer_cervix = @answer,   
                invasive_cancer_cervix_v_date = in_visit_date,
                invasive_cancer_cervix_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET invasive_cancer_cervix = NULL,
                invasive_cancer_cervix_v_date = NULL,
                invasive_cancer_cervix_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;

        WHEN @isosporiasis_1_month THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET isosporiasis_1_month = @answer,   
                isosporiasis_1_month_v_date = in_visit_date,
                isosporiasis_1_month_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET isosporiasis_1_month = NULL,
                isosporiasis_1_month_v_date = NULL,
                isosporiasis_1_month_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;

        WHEN @leishmaniasis_atypical_disseminated THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET leishmaniasis_atypical_disseminated = @answer,   
                leishmaniasis_atypical_disseminated_v_date = in_visit_date,
                leishmaniasis_atypical_disseminated_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET leishmaniasis_atypical_disseminated = NULL,
                leishmaniasis_atypical_disseminated_v_date = NULL,
                leishmaniasis_atypical_disseminated_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;

        WHEN @minor_mucocutaneous_manifestations_seborrheic_dermatitis THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET minor_mucocutaneous_manifestations_seborrheic_dermatitis = @answer,   
                minor_mucocutaneous_manifestations_seborrheic_dermatitis_v_date = in_visit_date,
                minor_mucocutaneous_manifestations_seborrheic_dermatitis_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET minor_mucocutaneous_manifestations_seborrheic_dermatitis = NULL,
                minor_mucocutaneous_manifestations_seborrheic_dermatitis_v_date = NULL,
                minor_mucocutaneous_manifestations_seborrheic_dermatitis_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;

        WHEN @cd4_percentage_available THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET cd4_percentage_available = @answer,   
                cd4_percentage_available_v_date = in_visit_date,
                cd4_percentage_available_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET cd4_percentage_available = NULL,
                cd4_percentage_available_v_date = NULL,
                cd4_percentage_available_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;

        WHEN @moderate_unexplained_malnutrition THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET moderate_unexplained_malnutrition = @answer,   
                moderate_unexplained_malnutrition_v_date = in_visit_date,
                moderate_unexplained_malnutrition_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET moderate_unexplained_malnutrition = NULL,
                moderate_unexplained_malnutrition_v_date = NULL,
                moderate_unexplained_malnutrition_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;

        WHEN @molluscum_contagiosum_extensive THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET molluscum_contagiosum_extensive = @answer,   
                molluscum_contagiosum_extensive_v_date = in_visit_date,
                molluscum_contagiosum_extensive_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET molluscum_contagiosum_extensive = NULL,
                molluscum_contagiosum_extensive_v_date = NULL,
                molluscum_contagiosum_extensive_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;

        WHEN @non_typhoidal_salmonella_bacteraemia_recurrent THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET non_typhoidal_salmonella_bacteraemia_recurrent = @answer,   
                non_typhoidal_salmonella_bacteraemia_recurrent_v_date = in_visit_date,
                non_typhoidal_salmonella_bacteraemia_recurrent_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET non_typhoidal_salmonella_bacteraemia_recurrent = NULL,
                non_typhoidal_salmonella_bacteraemia_recurrent_v_date = NULL,
                non_typhoidal_salmonella_bacteraemia_recurrent_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;

        WHEN @oral_candidiasis_from_age_2_months THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET oral_candidiasis_from_age_2_months = @answer,   
                oral_candidiasis_from_age_2_months_v_date = in_visit_date,
                oral_candidiasis_from_age_2_months_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET oral_candidiasis_from_age_2_months = NULL,
                oral_candidiasis_from_age_2_months_v_date = NULL,
                oral_candidiasis_from_age_2_months_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;

        WHEN @oral_thrush THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET oral_thrush = @answer,   
                oral_thrush_v_date = in_visit_date,
                oral_thrush_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET oral_thrush = NULL,
                oral_thrush_v_date = NULL,
                oral_thrush_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;

        WHEN @perform_extended_staging THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET perform_extended_staging = @answer,   
                perform_extended_staging_v_date = in_visit_date,
                perform_extended_staging_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET perform_extended_staging = NULL,
                perform_extended_staging_v_date = NULL,
                perform_extended_staging_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;

        WHEN @pneumocystis_carinii_pneumonia THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET pneumocystis_carinii_pneumonia = @answer,   
                pneumocystis_carinii_pneumonia_v_date = in_visit_date,
                pneumocystis_carinii_pneumonia_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET pneumocystis_carinii_pneumonia = NULL,
                pneumocystis_carinii_pneumonia_v_date = NULL,
                pneumocystis_carinii_pneumonia_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;

        WHEN @pneumonia_severe THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET pneumonia_severe = @answer,   
                pneumonia_severe_v_date = in_visit_date,
                pneumonia_severe_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET pneumonia_severe = NULL,
                pneumonia_severe_v_date = NULL,
                pneumonia_severe_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;

        WHEN @recurrent_bacteraemia_or_sepsis_with_nts THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET recurrent_bacteraemia_or_sepsis_with_nts = @answer,   
                recurrent_bacteraemia_or_sepsis_with_nts_v_date = in_visit_date,
                recurrent_bacteraemia_or_sepsis_with_nts_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET recurrent_bacteraemia_or_sepsis_with_nts = NULL,
                recurrent_bacteraemia_or_sepsis_with_nts_v_date = NULL,
                recurrent_bacteraemia_or_sepsis_with_nts_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;

        WHEN @recurrent_severe_presumed_pneumonia THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET recurrent_severe_presumed_pneumonia = @answer,   
                recurrent_severe_presumed_pneumonia_v_date = in_visit_date,
                recurrent_severe_presumed_pneumonia_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET recurrent_severe_presumed_pneumonia = NULL,
                recurrent_severe_presumed_pneumonia_v_date = NULL,
                recurrent_severe_presumed_pneumonia_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;

        WHEN @recurrent_upper_respiratory_tract_bac_sinusitis THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET recurrent_upper_respiratory_tract_bac_sinusitis = @answer,   
                recurrent_upper_respiratory_tract_bac_sinusitis_v_date = in_visit_date,
                recurrent_upper_respiratory_tract_bac_sinusitis_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET recurrent_upper_respiratory_tract_bac_sinusitis = NULL,
                recurrent_upper_respiratory_tract_bac_sinusitis_v_date = NULL,
                recurrent_upper_respiratory_tract_bac_sinusitis_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;

        WHEN @seborrhoeic_dermatitis THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET seborrhoeic_dermatitis = @answer,   
                seborrhoeic_dermatitis_v_date = in_visit_date,
                seborrhoeic_dermatitis_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET seborrhoeic_dermatitis = NULL,
                seborrhoeic_dermatitis_v_date = NULL,
                seborrhoeic_dermatitis_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;

        WHEN @sepsis_severe THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET sepsis_severe = @answer,   
                sepsis_severe_v_date = in_visit_date,
                sepsis_severe_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET sepsis_severe = NULL,
                sepsis_severe_v_date = NULL,
                sepsis_severe_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;

        WHEN @tb_lymphadenopathy THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET tb_lymphadenopathy = @answer,   
                tb_lymphadenopathy_v_date = in_visit_date,
                tb_lymphadenopathy_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET tb_lymphadenopathy = NULL,
                tb_lymphadenopathy_v_date = NULL,
                tb_lymphadenopathy_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;

        WHEN @unexplained_anaemia_neutropenia_or_thrombocytopenia THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET unexplained_anaemia_neutropenia_or_thrombocytopenia = @answer,   
                unexplained_anaemia_neutropenia_or_thrombocytopenia_v_date = in_visit_date,
                unexplained_anaemia_neutropenia_or_thrombocytopenia_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET unexplained_anaemia_neutropenia_or_thrombocytopenia = NULL,
                unexplained_anaemia_neutropenia_or_thrombocytopenia_v_date = NULL,
                unexplained_anaemia_neutropenia_or_thrombocytopenia_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;

        WHEN @visceral_leishmaniasis THEN  
          IF in_field_voided = 0 THEN
            SET @answer = (SELECT name from concept_name 
                             LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                           WHERE  concept.concept_id = in_field_value_coded
                           AND voided = 0 AND retired = 0 LIMIT 1);

            UPDATE flat_table1
            SET visceral_leishmaniasis = @answer,   
                visceral_leishmaniasis_v_date = in_visit_date,
                visceral_leishmaniasis_enc_id = encounter_id
            WHERE flat_table1.patient_id= in_patient_id;
          ELSE
            UPDATE flat_table1
            SET visceral_leishmaniasis = NULL,
                visceral_leishmaniasis_v_date = NULL,
                visceral_leishmaniasis_enc_id = NULL                  
            WHERE flat_table1.patient_id= in_patient_id;
          END IF;           
           

         WHEN @who_crit_stage THEN
             SET @answer = (SELECT name from concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id 
                             WHERE  concept.concept_id = in_field_value_coded AND voided = 0 AND retired = 0 LIMIT 1);

              IF in_field_voided = 0 THEN
                IF (@answer = 'Acute necrotizing ulcerative stomatitis, gingivitis or periodontitis') THEN
                  UPDATE flat_table1 SET acute_necrotizing_ulcerative_gingivitis = 'Yes' WHERE flat_table1.patient_id= in_patient_id;
                END IF;

                IF (@answer = 'Anaemia, unexplained < 8 g/dl') THEN
                  UPDATE flat_table1 SET anaemia_unexplained_8_g_dl = 'Yes' WHERE flat_table1.patient_id= in_patient_id;
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
                 UPDATE flat_table1 SET severe_unexplained_wasting_malnutrition = 'Yes' WHERE flat_table1.patient_id= in_patient_id;
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
              IF (@answer = 'Acute necrotizing ulcerative stomatitis, gingivitis or periodontitis') THEN
                UPDATE flat_table1 SET acute_necrotizing_ulcerative_gingivitis = NULL WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'Anaemia, unexplained < 8 g/dl') THEN
                UPDATE flat_table1 SET aneamia = NULL WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'Angular cheilitis') THEN
               UPDATE flat_table1 SET angular_chelitis = NULL WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'Asymptomatic HIV infection') THEN
                UPDATE flat_table1 SET asymptomatic = NULL WHERE flat_table1.patient_id= in_patient_id;  
              END IF;

              IF (@answer = 'Bacterial infections, severe recurrent  (empyema, pyomyositis, meningitis, bone/joint infections but EXCLUDING pneumonia)') THEN
                UPDATE flat_table1 SET bacterial_infections_severe_recurrent = NULL WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'Bacterial pneumonia, severe recurrent') THEN
                UPDATE flat_table1 SET bacterial_pnuemonia = NULL WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'Candidiasis of oseophagus, trachea and bronchi or lungs') THEN
                UPDATE flat_table1 SET candidiasis_of_oesophagus = NULL WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'Cerebral or B-cell non Hodgkin lymphoma') THEN
                UPDATE flat_table1 SET cerebral_non_hodgkin_lymphoma = NULL WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'Chronic herpes simplex infection (orolabial, gential / anorectal >1 month or visceral at any site)') THEN
                UPDATE flat_table1 SET chronic_herpes_simplex_infection = NULL WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'Cryptococcal meningitis or other extrapulmonary cryptococcosis') THEN
                UPDATE flat_table1 SET cryptococcal_meningitis = NULL WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'Cryptosporidiosis, chronic with diarroea') THEN
                UPDATE flat_table1 SET cryptosporidiosis = NULL WHERE flat_table1.patient_id= in_patient_id;  
              END IF;

              IF (@answer = 'Cytomegalovirus infection (retinitis or infection or other organs)') THEN
                UPDATE flat_table1 SET cytomegalovirus_infection = NULL WHERE flat_table1.patient_id= in_patient_id;  
              END IF;

              IF (@answer = 'Diarrhoea, chronic (>1 month) unexplained') THEN
                UPDATE flat_table1 SET diarrhoea_chronic_less_1_month_unexplained = NULL WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'Diarrhoea, persistent unexplained (14 days or more)') THEN
                UPDATE flat_table1 SET diarrhoea_persistent_unexplained_14_days_or_more = NULL WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'Disseminated mycosis (coccidiomycosis or histoplasmosis)') THEN
                UPDATE flat_table1 SET disseminated_mycosis = NULL WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'Disseminated non-tuberculosis mycobacterial infection') THEN
                UPDATE flat_table1 SET disseminated_non_tuberculosis_mycobacterial_infection = NULL WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'Extrapulmonary tuberculosis (EPTB)') THEN
                UPDATE flat_table1 SET extrapulmonary_tuberculosis = NULL, extrapulmonary_tuberculosis_v_date = in_visit_date WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'Fever, persistent unexplained, intermittent or constant, >1 month') THEN
                UPDATE flat_table1 SET fever_persistent_unexplained = NULL WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'Hepatosplenomegaly, persistent unexplained') THEN
                UPDATE flat_table1 SET hepatosplenomegaly_unexplained = NULL WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'Herpes zoster') THEN
                UPDATE flat_table1 SET herpes_zoster = NULL WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'HIV encephalopathy') THEN
                UPDATE flat_table1 SET hiv_encephalopathy = NULL WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'HIV wasting syndrome (severe weight loss + persistent fever or severe weight loss + chronic diarrhoea)') THEN
                UPDATE flat_table1 SET severe_weight_loss = NULL WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'Invasive cancer of cervix') THEN
                UPDATE flat_table1 SET invasive_cancer_of_cervix = NULL WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'Isosporiasis >1 month') THEN
                UPDATE flat_table1 SET isosporiasis = NULL WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'Kaposis sarcoma') THEN
                UPDATE flat_table1 SET kaposis_sarcoma = NULL, kaposis_sarcoma_v_date = in_visit_date WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'Moderate unexplained wasting/malnutrition not responding to treatment (weight-for-height/ -age 70-79% or muac 11-12 cm)') THEN
                UPDATE flat_table1 SET moderate_weight_loss_less_than_or_equal_to_10_percent_unexpl = NULL WHERE flat_table1.patient_id= in_patient_id; 
              END IF;

              IF (@answer = 'Moderate weight loss less than or equal to 10 percent, unexplained') THEN
                UPDATE flat_table1 SET moderate_weight_loss_less_than_or_equal_to_10_percent_unexpl = NULL WHERE flat_table1.patient_id= in_patient_id;  
              END IF;

              IF (@answer = 'Molluscum contagiosum, extensive') THEN
                UPDATE flat_table1 SET molluscumm_contagiosum = NULL WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'Neutropaenia, unexplained < 500 /mm(cubed)') THEN
                UPDATE flat_table1 SET neutropaenia = NULL WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'Oral candidiasis') THEN
                UPDATE flat_table1 SET oral_candidiasis = NULL WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'Oral candidiasis') THEN
                UPDATE flat_table1 SET oral_candidiasis = NULL WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'Oral candidiasis (from age 2 months)') THEN
                UPDATE flat_table1 SET oral_candidiasis = NULL WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'Oral hairy leukoplakia') THEN
                UPDATE flat_table1 SET oral_hairy_leukoplakia = NULL WHERE flat_table1.patient_id= in_patient_id;  
              END IF;

              IF (@answer = 'Oral ulcerations, recurrent') THEN
                UPDATE flat_table1 SET oral_hairy_leukoplakia = NULL WHERE flat_table1.patient_id= in_patient_id;  
              END IF;

              IF (@answer = 'Papular pruritic eruptions / Fungal nail infections') THEN
                UPDATE flat_table1 SET papular_pruritic_eruptions = NULL WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'Parotid enlargement, persistent unexplained') THEN
                UPDATE flat_table1 SET parotid_enlargement_persistent_unexplained = NULL WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'Persistent generalized lymphadenopathy') THEN
                UPDATE flat_table1 SET persistent_generalized_lymphadenopathy = NULL WHERE flat_table1.patient_id= in_patient_id;  
              END IF;

              IF (@answer = 'Pneumocystis pneumonia') THEN
                UPDATE flat_table1 SET pnuemocystis_pnuemonia = NULL WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'Progressive multifocal leukoencephalopathy') THEN
                UPDATE flat_table1 SET progressive_multifocal_leukoencephalopathy = NULL WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'Pulmonary tuberculosis (current)') THEN
                UPDATE flat_table1 SET pulmonary_tuberculosis_last_2_years = NULL, pulmonary_tuberculosis_last_2_years_v_date = in_visit_date WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'Respiratory tract infections, recurrent (sinusitis, tonsilitus, otitis media, pharyngitis)') THEN
                UPDATE flat_table1 SET respiratory_tract_infections_recurrent = NULL WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'Seborrhoeic dermatitis') THEN
                UPDATE flat_table1 SET seborrhoeic_dermatitis = NULL WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'Severe bacterial infections (pneumonia, empyema, pyomyositis, bone/joint, meningitis, bacteraemia)') THEN
                UPDATE flat_table1 SET severe_bacterial_infection = NULL WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'Severe unexplained wasting or malnutrition not responding to treatment (weight-for-height/ -age <70% or MUAC less than 11cm or oedema)') THEN
               UPDATE flat_table1 SET severe_weight_loss = NULL WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'Severe weight loss >10% and/or BMI <18.5kg/m^2, unexplained') THEN
                UPDATE flat_table1 SET severe_weight_loss = NULL WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'Symptomatic HIV-associated nephropathy or cardiomyopathy') THEN
                UPDATE flat_table1 SET symptomatic_hiv_associated_nephropathy = NULL WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'Thrombocytopaenia, chronic < 50,000 /mm(cubed)') THEN
                UPDATE flat_table1 SET thrombocytopaenia_chronic = NULL WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'Toxoplasmosis of the brain') THEN
                UPDATE flat_table1 SET toxoplasmosis_of_the_brain  = NULL WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'Tuberculosis (PTB or EPTB) within the last 2 years') THEN
                UPDATE flat_table1 SET pulmonary_tuberculosis_last_2_years = NULL, pulmonary_tuberculosis_last_2_years_v_date = in_visit_date WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'Unspecified stage I condition') THEN
                UPDATE flat_table1 SET unspecified_stage_1_cond = NULL WHERE flat_table1.patient_id= in_patient_id;    
              END IF;

              IF (@answer = 'Unspecified stage II condition') THEN
                UPDATE flat_table1 SET unspecified_stage2_condition = NULL WHERE flat_table1.patient_id= in_patient_id;  
              END IF;

              IF (@answer = 'Unspecified stage III condition') THEN
                UPDATE flat_table1 SET unspecified_stage3_condition = NULL WHERE flat_table1.patient_id= in_patient_id;
              END IF;

              IF (@answer = 'Unspecified stage IV condition') THEN
                UPDATE flat_table1 SET unspecified_stage_4_condition = NULL WHERE flat_table1.patient_id= in_patient_id;  
              END IF;          
          
          END IF;
          ELSE
          
              SET @enc_id = encounter_id;                  
      
      END CASE;
    END IF;
END$$

DELIMITER ;
