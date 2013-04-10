DELIMITER $$
DROP TRIGGER IF EXISTS `flat_table2_after_insert`$$
CREATE TRIGGER `flat_table2_after_insert` AFTER UPDATE 
ON `flat_table2`
FOR EACH ROW
BEGIN
    
    DECLARE done INT DEFAULT 0;
    
    DECLARE var_id int(11);
    DECLARE var_patient_id int(11);
    DECLARE var_gender varchar(45);
    DECLARE var_birthdate date;
    DECLARE var_earliest_start_date date;
    DECLARE var_hiv_program_state varchar(45);
    DECLARE var_hiv_program_start_date date;
    DECLARE var_reason_for_starting varchar(255);
    DECLARE var_ever_registered_at_art varchar(255);
    DECLARE var_date_art_last_taken date;
    DECLARE var_taken_art_in_last_two_months varchar(255);
    DECLARE var_patient_pregnant varchar(255);
    DECLARE var_death_date date;
    DECLARE var_drug_induced_abdominal_pain varchar(255);
    DECLARE var_drug_induced_anorexia varchar(255);
    DECLARE var_drug_induced_diarrhea varchar(255);
    DECLARE var_drug_induced_jaundice varchar(255);
    DECLARE var_drug_induced_leg_pain_numbness varchar(255);
    DECLARE var_drug_induced_vomiting varchar(255);
    DECLARE var_drug_induced_peripheral_neuropathy varchar(255);
    DECLARE var_drug_induced_hepatitis varchar(255);
    DECLARE var_drug_induced_anemia varchar(255);
    DECLARE var_drug_induced_lactic_acidosis varchar(255);
    DECLARE var_drug_induced_lipodystrophy varchar(255);
    DECLARE var_drug_induced_skin_rash varchar(255);
    DECLARE var_drug_induced_other_symptom varchar(255);
    DECLARE var_drug_induced_fever varchar(255);
    DECLARE var_drug_induced_cough varchar(255);
    DECLARE var_tb_not_suspected varchar(255);
    DECLARE var_tb_suspected varchar(255);
    DECLARE var_confirmed_tb_not_on_treatment varchar(255);
    DECLARE var_confirmed_tb_on_treatment varchar(255);
    DECLARE var_unknown_tb_status varchar(255);
    DECLARE var_extrapulmonary_tuberculosis varchar(255);
    DECLARE var_pulmonary_tuberculosis varchar(255);
    DECLARE var_pulmonary_tuberculosis_last_2_years varchar(255);
    DECLARE var_kaposis_sarcoma varchar(255);
    DECLARE var_what_was_the_patient_adherence_for_this_drug1 varchar(255);
    DECLARE var_what_was_the_patient_adherence_for_this_drug2 varchar(255);
    DECLARE var_what_was_the_patient_adherence_for_this_drug3 varchar(255);
    DECLARE var_what_was_the_patient_adherence_for_this_drug4 varchar(255);
    DECLARE var_what_was_the_patient_adherence_for_this_drug5 varchar(255);
    DECLARE var_regimen_category varchar(255);
    DECLARE var_drug_name1 varchar(255);
    DECLARE var_drug_name2 varchar(255);
    DECLARE var_drug_name3 varchar(255);
    DECLARE var_drug_name4 varchar(255);
    DECLARE var_drug_name5 varchar(255);
    DECLARE var_drug_inventory_id1 int(11);
    DECLARE var_drug_inventory_id2 int(11);
    DECLARE var_drug_inventory_id3 int(11);
    DECLARE var_drug_inventory_id4 int(11);
    DECLARE var_drug_inventory_id5 int(11);
    DECLARE var_drug_auto_expire_date1 date;
    DECLARE var_drug_auto_expire_date2 date;
    DECLARE var_drug_auto_expire_date3 date;
    DECLARE var_drug_auto_expire_date4 date;
    DECLARE var_drug_auto_expire_date5 date;
    DECLARE var_hiv_program_state_v_date date;
    DECLARE var_hiv_program_start_date_v_date date;
    DECLARE var_current_tb_status_v_date date;
    DECLARE var_reason_for_starting_v_date date;
    DECLARE var_ever_registered_at_art_v_date date;
    DECLARE var_date_art_last_taken_v_date date;
    DECLARE var_taken_art_in_last_two_months_v_date date;
    DECLARE var_patient_pregnant_v_date date;
    DECLARE var_death_date_v_date date;
    DECLARE var_drug_induced_abdominal_pain_v_date date;
    DECLARE var_drug_induced_anorexia_v_date date;
    DECLARE var_drug_induced_diarrhea_v_date date;
    DECLARE var_drug_induced_jaundice_v_date date;
    DECLARE var_drug_induced_leg_pain_numbness_v_date date;
    DECLARE var_drug_induced_vomiting_v_date date;
    DECLARE var_drug_induced_peripheral_neuropathy_v_date date;
    DECLARE var_drug_induced_hepatitis_v_date date;
    DECLARE var_drug_induced_anemia_v_date date;
    DECLARE var_drug_induced_lactic_acidosis_v_date date;
    DECLARE var_drug_induced_lipodystrophy_v_date date;
    DECLARE var_drug_induced_skin_rash_v_date date;
    DECLARE var_drug_induced_other_symptom_v_date date;
    DECLARE var_drug_induced_fever_v_date date;
    DECLARE var_drug_induced_cough_v_date date;
    DECLARE var_tb_not_suspected_v_date date;
    DECLARE var_tb_suspected_v_date date;
    DECLARE var_confirmed_tb_not_on_treatment_v_date date;
    DECLARE var_confirmed_tb_on_treatment_v_date date;
    DECLARE var_unknown_tb_status_v_date date;
    DECLARE var_extrapulmonary_tuberculosis_v_date date;
    DECLARE var_pulmonary_tuberculosis_v_date date;
    DECLARE var_pulmonary_tuberculosis_last_2_years_v_date date;
    DECLARE var_kaposis_sarcoma_v_date date;
    DECLARE var_what_was_the_patient_adherence_for_this_drug1_v_date date;
    DECLARE var_what_was_the_patient_adherence_for_this_drug2_v_date date;
    DECLARE var_what_was_the_patient_adherence_for_this_drug3_v_date date;
    DECLARE var_what_was_the_patient_adherence_for_this_drug4_v_date date;
    DECLARE var_what_was_the_patient_adherence_for_this_drug5_v_date date;
    DECLARE var_regimen_category_v_date date;
    DECLARE var_drug_name1_v_date date;
    DECLARE var_drug_name2_v_date date;
    DECLARE var_drug_name3_v_date date;
    DECLARE var_drug_name4_v_date date;
    DECLARE var_drug_name5_v_date date;
    DECLARE var_drug_inventory_id1_v_date date;
    DECLARE var_drug_inventory_id2_v_date date;
    DECLARE var_drug_inventory_id3_v_date date;
    DECLARE var_drug_inventory_id4_v_date date;
    DECLARE var_drug_inventory_id5_v_date date;
    DECLARE var_drug_auto_expire_date1_v_date date;
    DECLARE var_drug_auto_expire_date2_v_date date;
    DECLARE var_drug_auto_expire_date3_v_date date;
    DECLARE var_drug_auto_expire_date4_v_date date;
    DECLARE var_drug_auto_expire_date5_v_date date;

    # Declare and initialise cursor for looping through the table
    DECLARE cur CURSOR FOR SELECT id, patient_id, gender, birthdate, earliest_start_date, 
        hiv_program_state, hiv_program_start_date, reason_for_starting, 
        ever_registered_at_art, date_art_last_taken, taken_art_in_last_two_months, 
        patient_pregnant, death_date, drug_induced_abdominal_pain, drug_induced_anorexia, 
        drug_induced_diarrhea, drug_induced_jaundice, drug_induced_leg_pain_numbness, 
        drug_induced_vomiting, drug_induced_peripheral_neuropathy, drug_induced_hepatitis, 
        drug_induced_anemia, drug_induced_lactic_acidosis, drug_induced_lipodystrophy, 
        drug_induced_skin_rash, drug_induced_other_symptom, drug_induced_fever, 
        drug_induced_cough, tb_not_suspected, tb_suspected, confirmed_tb_not_on_treatment, 
        confirmed_tb_on_treatment, unknown_tb_status, extrapulmonary_tuberculosis, 
        pulmonary_tuberculosis, pulmonary_tuberculosis_last_2_years, kaposis_sarcoma, 
        what_was_the_patient_adherence_for_this_drug1, what_was_the_patient_adherence_for_this_drug2,
        what_was_the_patient_adherence_for_this_drug3, what_was_the_patient_adherence_for_this_drug4,
        what_was_the_patient_adherence_for_this_drug5, regimen_category, drug_name1, drug_name2, 
        drug_name3, drug_name4, drug_name5, drug_inventory_id1, drug_inventory_id2, 
        drug_inventory_id3, drug_inventory_id4, drug_inventory_id5, drug_auto_expire_date1, 
        drug_auto_expire_date2, drug_auto_expire_date3, drug_auto_expire_date4, 
        drug_auto_expire_date5, hiv_program_state_v_date, hiv_program_start_date_v_date, 
        current_tb_status_v_date, reason_for_starting_v_date, ever_registered_at_art_v_date, 
        date_art_last_taken_v_date, taken_art_in_last_two_months_v_date, patient_pregnant_v_date, 
        death_date_v_date, drug_induced_abdominal_pain_v_date, drug_induced_anorexia_v_date, 
        drug_induced_diarrhea_v_date, drug_induced_jaundice_v_date, drug_induced_leg_pain_numbness_v_date, 
        drug_induced_vomiting_v_date, drug_induced_peripheral_neuropathy_v_date, 
        drug_induced_hepatitis_v_date, drug_induced_anemia_v_date, drug_induced_lactic_acidosis_v_date, 
        drug_induced_lipodystrophy_v_date, drug_induced_skin_rash_v_date, drug_induced_other_symptom_v_date, 
        drug_induced_fever_v_date, drug_induced_cough_v_date, tb_not_suspected_v_date, 
        tb_suspected_v_date, confirmed_tb_not_on_treatment_v_date, confirmed_tb_on_treatment_v_date, 
        unknown_tb_status_v_date, extrapulmonary_tuberculosis_v_date, pulmonary_tuberculosis_v_date,
        pulmonary_tuberculosis_last_2_years_v_date, kaposis_sarcoma_v_date, 
        what_was_the_patient_adherence_for_this_drug1_v_date, 
        what_was_the_patient_adherence_for_this_drug2_v_date, 
        what_was_the_patient_adherence_for_this_drug3_v_date, 
        what_was_the_patient_adherence_for_this_drug4_v_date, 
        what_was_the_patient_adherence_for_this_drug5_v_date, regimen_category_v_date, 
        drug_name1_v_date, drug_name2_v_date, drug_name3_v_date, drug_name4_v_date, 
        drug_name5_v_date, drug_inventory_id1_v_date, drug_inventory_id2_v_date, 
        drug_inventory_id3_v_date, drug_inventory_id4_v_date, drug_inventory_id5_v_date, 
        drug_auto_expire_date1_v_date, drug_auto_expire_date2_v_date, drug_auto_expire_date3_v_date, 
        drug_auto_expire_date4_v_date, drug_auto_expire_date5_v_date 
        FROM flat_cohort_table WHERE patient_id = NEW.patient_id; 
        # AND QUARTER(NEW.visit_date) = QUARTER(earliest_start_date) AND YEAR(NEW.visit_date) AND YEAR(earliest_start_date) LIMIT 1;  
        
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    # Open cursor
    OPEN cur;
    
    # Get the fields into the variables declared earlier
    FETCH cur INTO var_id, var_patient_id, var_gender, var_birthdate, var_earliest_start_date, 
        var_hiv_program_state, var_hiv_program_start_date, 
        var_reason_for_starting, var_ever_registered_at_art, var_date_art_last_taken, 
        var_taken_art_in_last_two_months, var_patient_pregnant, var_death_date, 
        var_drug_induced_abdominal_pain, var_drug_induced_anorexia, var_drug_induced_diarrhea, 
        var_drug_induced_jaundice, var_drug_induced_leg_pain_numbness, var_drug_induced_vomiting, 
        var_drug_induced_peripheral_neuropathy, var_drug_induced_hepatitis, var_drug_induced_anemia, 
        var_drug_induced_lactic_acidosis, var_drug_induced_lipodystrophy, var_drug_induced_skin_rash, 
        var_drug_induced_other_symptom, var_drug_induced_fever, var_drug_induced_cough, 
        var_tb_not_suspected, var_tb_suspected, var_confirmed_tb_not_on_treatment, 
        var_confirmed_tb_on_treatment, var_unknown_tb_status, var_extrapulmonary_tuberculosis, 
        var_pulmonary_tuberculosis, var_pulmonary_tuberculosis_last_2_years, var_kaposis_sarcoma,
        var_what_was_the_patient_adherence_for_this_drug1, var_what_was_the_patient_adherence_for_this_drug2,
        var_what_was_the_patient_adherence_for_this_drug3, var_what_was_the_patient_adherence_for_this_drug4,
        var_what_was_the_patient_adherence_for_this_drug5, var_regimen_category, var_drug_name1, 
        var_drug_name2, var_drug_name3, var_drug_name4, var_drug_name5, var_drug_inventory_id1, 
        var_drug_inventory_id2, var_drug_inventory_id3, var_drug_inventory_id4, var_drug_inventory_id5, 
        var_drug_auto_expire_date1, var_drug_auto_expire_date2, var_drug_auto_expire_date3, 
        var_drug_auto_expire_date4, var_drug_auto_expire_date5, var_hiv_program_state_v_date, 
        var_hiv_program_start_date_v_date, var_current_tb_status_v_date, var_reason_for_starting_v_date,
        var_ever_registered_at_art_v_date, var_date_art_last_taken_v_date, var_taken_art_in_last_two_months_v_date,
        var_patient_pregnant_v_date, var_death_date_v_date, var_drug_induced_abdominal_pain_v_date, 
        var_drug_induced_anorexia_v_date, var_drug_induced_diarrhea_v_date, var_drug_induced_jaundice_v_date,
        var_drug_induced_leg_pain_numbness_v_date, var_drug_induced_vomiting_v_date, 
        var_drug_induced_peripheral_neuropathy_v_date, var_drug_induced_hepatitis_v_date, 
        var_drug_induced_anemia_v_date, var_drug_induced_lactic_acidosis_v_date, 
        var_drug_induced_lipodystrophy_v_date, var_drug_induced_skin_rash_v_date, 
        var_drug_induced_other_symptom_v_date, var_drug_induced_fever_v_date, 
        var_drug_induced_cough_v_date, var_tb_not_suspected_v_date, var_tb_suspected_v_date,
        var_confirmed_tb_not_on_treatment_v_date, var_confirmed_tb_on_treatment_v_date, 
        var_unknown_tb_status_v_date, var_extrapulmonary_tuberculosis_v_date, 
        var_pulmonary_tuberculosis_v_date, var_pulmonary_tuberculosis_last_2_years_v_date, 
        var_kaposis_sarcoma_v_date, var_what_was_the_patient_adherence_for_this_drug1_v_date,
        var_what_was_the_patient_adherence_for_this_drug2_v_date, 
        var_what_was_the_patient_adherence_for_this_drug3_v_date, 
        var_what_was_the_patient_adherence_for_this_drug4_v_date, 
        var_what_was_the_patient_adherence_for_this_drug5_v_date, var_regimen_category_v_date, 
        var_drug_name1_v_date, var_drug_name2_v_date, var_drug_name3_v_date, var_drug_name4_v_date, 
        var_drug_name5_v_date, var_drug_inventory_id1_v_date, var_drug_inventory_id2_v_date, 
        var_drug_inventory_id3_v_date, var_drug_inventory_id4_v_date, var_drug_inventory_id5_v_date, 
        var_drug_auto_expire_date1_v_date, var_drug_auto_expire_date2_v_date, 
        var_drug_auto_expire_date3_v_date, var_drug_auto_expire_date4_v_date, var_drug_auto_expire_date5_v_date;
    
    IF NOT done THEN
        IF COALESCE(var_id, 0) > 0 THEN
        
            IF DATE(NEW.visit_date) >= DATE(var_hiv_program_state_v_date) THEN
            
                UPDATE flat_cohort_table SET hiv_program_state = NEW.current_hiv_program_state,
                    hiv_program_start_date = NEW.current_hiv_program_start_date, 
                    hiv_program_state_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
            IF DATE(NEW.visit_date) >= DATE(var_drug_induced_abdominal_pain_v_date) THEN
            
                UPDATE flat_cohort_table SET drug_induced_abdominal_pain = NEW.drug_induced_abdominal_pain,
                    drug_induced_abdominal_pain_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
            IF DATE(NEW.visit_date) >= DATE(var_drug_induced_anorexia_v_date) THEN
            
                UPDATE flat_cohort_table SET drug_induced_anorexia = NEW.drug_induced_anorexia,
                    drug_induced_anorexia_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
            IF DATE(NEW.visit_date) >= DATE(var_drug_induced_diarrhea_v_date) THEN
            
                UPDATE flat_cohort_table SET drug_induced_diarrhea = NEW.drug_induced_diarrhea,
                    drug_induced_diarrhea_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
            IF DATE(NEW.visit_date) >= DATE(var_drug_induced_jaundice_v_date) THEN
            
                UPDATE flat_cohort_table SET drug_induced_jaundice = NEW.drug_induced_jaundice,
                    drug_induced_jaundice_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
            IF DATE(NEW.visit_date) >= DATE(var_drug_induced_leg_pain_numbness_v_date) THEN
            
                UPDATE flat_cohort_table SET drug_induced_leg_pain_numbness = NEW.drug_induced_leg_pain_numbness,
                    drug_induced_leg_pain_numbness_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
            IF DATE(NEW.visit_date) >= DATE(var_drug_induced_vomiting_v_date) THEN
            
                UPDATE flat_cohort_table SET drug_induced_vomiting = NEW.drug_induced_vomiting,
                    drug_induced_vomiting_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
            IF DATE(NEW.visit_date) >= DATE(var_drug_induced_peripheral_neuropathy_v_date) THEN
            
                UPDATE flat_cohort_table SET drug_induced_peripheral_neuropathy = NEW.drug_induced_peripheral_neuropathy,
                    drug_induced_peripheral_neuropathy_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
            IF DATE(NEW.visit_date) >= DATE(var_drug_induced_hepatitis_v_date) THEN
            
                UPDATE flat_cohort_table SET drug_induced_hepatitis = NEW.drug_induced_hepatitis,
                    drug_induced_hepatitis_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
            IF DATE(NEW.visit_date) >= DATE(var_drug_induced_anemia_v_date) THEN
            
                UPDATE flat_cohort_table SET drug_induced_anemia = NEW.drug_induced_anemia,
                    drug_induced_anemia_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
            IF DATE(NEW.visit_date) >= DATE(var_drug_induced_lactic_acidosis_v_date) THEN
            
                UPDATE flat_cohort_table SET drug_induced_lactic_acidosis = NEW.drug_induced_lactic_acidosis,
                    drug_induced_lactic_acidosis_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
            IF DATE(NEW.visit_date) >= DATE(var_drug_induced_lipodystrophy_v_date) THEN
            
                UPDATE flat_cohort_table SET drug_induced_lipodystrophy = NEW.drug_induced_lipodystrophy,
                    drug_induced_lipodystrophy_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
            IF DATE(NEW.visit_date) >= DATE(var_drug_induced_skin_rash_v_date) THEN
            
                UPDATE flat_cohort_table SET drug_induced_skin_rash = NEW.drug_induced_skin_rash,
                    drug_induced_skin_rash_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
            IF DATE(NEW.visit_date) >= DATE(var_drug_induced_other_symptom_v_date) THEN
            
                UPDATE flat_cohort_table SET drug_induced_other_symptom = NEW.drug_induced_other_symptom,
                    drug_induced_other_symptom_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
            IF DATE(NEW.visit_date) >= DATE(var_drug_induced_fever_v_date) THEN
            
                UPDATE flat_cohort_table SET drug_induced_fever = NEW.drug_induced_fever,
                    drug_induced_fever_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
            IF DATE(NEW.visit_date) >= DATE(var_drug_induced_cough_v_date) THEN
            
                UPDATE flat_cohort_table SET drug_induced_cough = NEW.drug_induced_cough,
                    drug_induced_cough_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
            IF DATE(NEW.visit_date) >= DATE(var_tb_not_suspected_v_date) THEN
            
                UPDATE flat_cohort_table SET tb_not_suspected = NEW.tb_status_tb_not_suspected,
                    tb_not_suspected_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
            IF DATE(NEW.visit_date) >= DATE(var_tb_suspected_v_date) THEN
            
                UPDATE flat_cohort_table SET tb_suspected = NEW.tb_status_tb_suspected,
                    tb_suspected_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
            IF DATE(NEW.visit_date) >= DATE(var_confirmed_tb_not_on_treatment_v_date) THEN
            
                UPDATE flat_cohort_table SET confirmed_tb_not_on_treatment = NEW.tb_status_confirmed_tb_not_on_treatment,
                    confirmed_tb_not_on_treatment_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
            IF DATE(NEW.visit_date) >= DATE(var_confirmed_tb_on_treatment_v_date) THEN
            
                UPDATE flat_cohort_table SET confirmed_tb_on_treatment = NEW.tb_status_confirmed_tb_on_treatment,
                    confirmed_tb_on_treatment_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
            IF DATE(NEW.visit_date) >= DATE(var_unknown_tb_status_v_date) THEN
            
                UPDATE flat_cohort_table SET unknown_tb_status = NEW.tb_status_unknown,
                    unknown_tb_status_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
            IF DATE(NEW.visit_date) >= DATE(var_what_was_the_patient_adherence_for_this_drug1_v_date) THEN
            
                UPDATE flat_cohort_table SET what_was_the_patient_adherence_for_this_drug1 = 
                    NEW.what_was_the_patient_adherence_for_this_drug1,
                    what_was_the_patient_adherence_for_this_drug1_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
            IF DATE(NEW.visit_date) >= DATE(var_what_was_the_patient_adherence_for_this_drug2_v_date) THEN
            
                UPDATE flat_cohort_table SET what_was_the_patient_adherence_for_this_drug2 = 
                    NEW.what_was_the_patient_adherence_for_this_drug2,
                    what_was_the_patient_adherence_for_this_drug2_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
            IF DATE(NEW.visit_date) >= DATE(var_what_was_the_patient_adherence_for_this_drug3_v_date) THEN
            
                UPDATE flat_cohort_table SET what_was_the_patient_adherence_for_this_drug3 = 
                    NEW.what_was_the_patient_adherence_for_this_drug3,
                    what_was_the_patient_adherence_for_this_drug3_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
            IF DATE(NEW.visit_date) >= DATE(var_what_was_the_patient_adherence_for_this_drug4_v_date) THEN
            
                UPDATE flat_cohort_table SET what_was_the_patient_adherence_for_this_drug4 = 
                    NEW.what_was_the_patient_adherence_for_this_drug4,
                    what_was_the_patient_adherence_for_this_drug4_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
            IF DATE(NEW.visit_date) >= DATE(var_what_was_the_patient_adherence_for_this_drug5_v_date) THEN
            
                UPDATE flat_cohort_table SET what_was_the_patient_adherence_for_this_drug5 = 
                    NEW.what_was_the_patient_adherence_for_this_drug5,
                    what_was_the_patient_adherence_for_this_drug5_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
            IF DATE(NEW.visit_date) >= DATE(var_regimen_category_v_date) THEN
            
                UPDATE flat_cohort_table SET regimen_category = 
                    NEW.regimen_category,
                    regimen_category_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
            IF DATE(NEW.visit_date) >= DATE(var_drug_name1_v_date) THEN
            
                UPDATE flat_cohort_table SET drug_name1 = 
                    NEW.drug_name1,
                    drug_name1_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
            IF DATE(NEW.visit_date) >= DATE(var_drug_name2_v_date) THEN
            
                UPDATE flat_cohort_table SET drug_name2 = 
                    NEW.drug_name2,
                    drug_name2_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
            IF DATE(NEW.visit_date) >= DATE(var_drug_name3_v_date) THEN
            
                UPDATE flat_cohort_table SET drug_name3 = 
                    NEW.drug_name3,
                    drug_name3_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
            IF DATE(NEW.visit_date) >= DATE(var_drug_name4_v_date) THEN
            
                UPDATE flat_cohort_table SET drug_name4 = 
                    NEW.drug_name4,
                    drug_name4_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
            IF DATE(NEW.visit_date) >= DATE(var_drug_name5_v_date) THEN
            
                UPDATE flat_cohort_table SET drug_name5 = 
                    NEW.drug_name5,
                    drug_name5_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
            IF DATE(NEW.visit_date) >= DATE(var_drug_inventory_id1_v_date) THEN
            
                UPDATE flat_cohort_table SET drug_inventory_id1 = 
                    NEW.drug_inventory_id1,
                    drug_inventory_id1_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
            IF DATE(NEW.visit_date) >= DATE(var_drug_inventory_id2_v_date) THEN
            
                UPDATE flat_cohort_table SET drug_inventory_id2 = 
                    NEW.drug_inventory_id2,
                    drug_inventory_id2_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
            IF DATE(NEW.visit_date) >= DATE(var_drug_inventory_id3_v_date) THEN
            
                UPDATE flat_cohort_table SET drug_inventory_id3 = 
                    NEW.drug_inventory_id3,
                    drug_inventory_id3_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
            IF DATE(NEW.visit_date) >= DATE(var_drug_inventory_id4_v_date) THEN
            
                UPDATE flat_cohort_table SET drug_inventory_id4 = 
                    NEW.drug_inventory_id4,
                    drug_inventory_id4_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
            IF DATE(NEW.visit_date) >= DATE(var_drug_inventory_id5_v_date) THEN
            
                UPDATE flat_cohort_table SET drug_inventory_id5 = 
                    NEW.drug_inventory_id5,
                    drug_inventory_id5_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
            IF DATE(NEW.visit_date) >= DATE(var_drug_auto_expire_date1_v_date) THEN
            
                UPDATE flat_cohort_table SET drug_auto_expire_date1 = 
                    NEW.drug_auto_expire_date1,
                    drug_auto_expire_date1_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
            IF DATE(NEW.visit_date) >= DATE(var_drug_auto_expire_date2_v_date) THEN
            
                UPDATE flat_cohort_table SET drug_auto_expire_date2 = 
                    NEW.drug_auto_expire_date2,
                    drug_auto_expire_date2_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
            IF DATE(NEW.visit_date) >= DATE(var_drug_auto_expire_date3_v_date) THEN
            
                UPDATE flat_cohort_table SET drug_auto_expire_date3 = 
                    NEW.drug_auto_expire_date3,
                    drug_auto_expire_date3_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
            IF DATE(NEW.visit_date) >= DATE(var_drug_auto_expire_date4_v_date) THEN
            
                UPDATE flat_cohort_table SET drug_auto_expire_date4 = 
                    NEW.drug_auto_expire_date4,
                    drug_auto_expire_date4_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
            IF DATE(NEW.visit_date) >= DATE(var_drug_auto_expire_date5_v_date) THEN
            
                UPDATE flat_cohort_table SET drug_auto_expire_date5 = 
                    NEW.drug_auto_expire_date5,
                    drug_auto_expire_date5_v_date = NEW.visit_date WHERE patient_id = NEW.patient_id;
            
            END IF;
        
        ELSE
            
            INSERT INTO flat_cohort_table (patient_id, hiv_program_state, hiv_program_start_date, drug_induced_abdominal_pain, drug_induced_anorexia, drug_induced_diarrhea, drug_induced_jaundice, drug_induced_leg_pain_numbness, drug_induced_vomiting, drug_induced_peripheral_neuropathy, drug_induced_hepatitis, drug_induced_anemia, drug_induced_lactic_acidosis, drug_induced_lipodystrophy, drug_induced_skin_rash, drug_induced_other_symptom, drug_induced_fever, drug_induced_cough, tb_not_suspected, tb_suspected, confirmed_tb_not_on_treatment, confirmed_tb_on_treatment, unknown_tb_status, what_was_the_patient_adherence_for_this_drug1, what_was_the_patient_adherence_for_this_drug2, what_was_the_patient_adherence_for_this_drug3, what_was_the_patient_adherence_for_this_drug4, what_was_the_patient_adherence_for_this_drug5, regimen_category, drug_name1, drug_name2, drug_name3, drug_name4, drug_name5, drug_inventory_id1, drug_inventory_id2, drug_inventory_id3, drug_inventory_id4, drug_inventory_id5, drug_auto_expire_date1, drug_auto_expire_date2, drug_auto_expire_date3, drug_auto_expire_date4, drug_auto_expire_date5, hiv_program_state_v_date, hiv_program_start_date_v_date, drug_induced_abdominal_pain_v_date, drug_induced_anorexia_v_date, drug_induced_diarrhea_v_date, drug_induced_jaundice_v_date, drug_induced_leg_pain_numbness_v_date, drug_induced_vomiting_v_date, drug_induced_peripheral_neuropathy_v_date, drug_induced_hepatitis_v_date, drug_induced_anemia_v_date, drug_induced_lactic_acidosis_v_date, drug_induced_lipodystrophy_v_date, drug_induced_skin_rash_v_date, drug_induced_other_symptom_v_date, drug_induced_fever_v_date, drug_induced_cough_v_date, tb_not_suspected_v_date, tb_suspected_v_date, confirmed_tb_not_on_treatment_v_date, confirmed_tb_on_treatment_v_date, unknown_tb_status_v_date, what_was_the_patient_adherence_for_this_drug1_v_date, what_was_the_patient_adherence_for_this_drug2_v_date, what_was_the_patient_adherence_for_this_drug3_v_date, what_was_the_patient_adherence_for_this_drug4_v_date, what_was_the_patient_adherence_for_this_drug5_v_date, regimen_category_v_date, drug_name1_v_date, drug_name2_v_date, drug_name3_v_date, drug_name4_v_date, drug_name5_v_date, drug_inventory_id1_v_date, drug_inventory_id2_v_date, drug_inventory_id3_v_date, drug_inventory_id4_v_date, drug_inventory_id5_v_date, drug_auto_expire_date1_v_date, drug_auto_expire_date2_v_date, drug_auto_expire_date3_v_date, drug_auto_expire_date4_v_date, drug_auto_expire_date5_v_date) VALUES (NEW.patient_id, NEW.current_hiv_program_state, NEW.current_hiv_program_start_date, NEW.drug_induced_abdominal_pain, NEW.drug_induced_anorexia, NEW.drug_induced_diarrhea, NEW.drug_induced_jaundice, NEW.drug_induced_leg_pain_numbness, NEW.drug_induced_vomiting, NEW.drug_induced_peripheral_neuropathy, NEW.drug_induced_hepatitis, NEW.drug_induced_anemia, NEW.drug_induced_lactic_acidosis, NEW.drug_induced_lipodystrophy, NEW.drug_induced_skin_rash, NEW.drug_induced_other_symptom, NEW.drug_induced_fever, NEW.drug_induced_cough, NEW.tb_status_tb_not_suspected, NEW.tb_status_tb_suspected, NEW.tb_status_confirmed_tb_not_on_treatment, NEW.tb_status_confirmed_tb_on_treatment, NEW.tb_status_unknown, NEW.what_was_the_patient_adherence_for_this_drug1, NEW.what_was_the_patient_adherence_for_this_drug2, NEW.what_was_the_patient_adherence_for_this_drug3, NEW.what_was_the_patient_adherence_for_this_drug4, NEW.what_was_the_patient_adherence_for_this_drug5, NEW.regimen_category, NEW.drug_name1, NEW.drug_name2, NEW.drug_name3, NEW.drug_name4, NEW.drug_name5, NEW.drug_inventory_id1, NEW.drug_inventory_id2, NEW.drug_inventory_id3, NEW.drug_inventory_id4, NEW.drug_inventory_id5, NEW.drug_auto_expire_date1, NEW.drug_auto_expire_date2, NEW.drug_auto_expire_date3, NEW.drug_auto_expire_date4, NEW.drug_auto_expire_date5, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date);
        
        END IF;
        
    ELSE
    
        INSERT INTO flat_cohort_table (patient_id, hiv_program_state, hiv_program_start_date, drug_induced_abdominal_pain, drug_induced_anorexia, drug_induced_diarrhea, drug_induced_jaundice, drug_induced_leg_pain_numbness, drug_induced_vomiting, drug_induced_peripheral_neuropathy, drug_induced_hepatitis, drug_induced_anemia, drug_induced_lactic_acidosis, drug_induced_lipodystrophy, drug_induced_skin_rash, drug_induced_other_symptom, drug_induced_fever, drug_induced_cough, tb_not_suspected, tb_suspected, confirmed_tb_not_on_treatment, confirmed_tb_on_treatment, unknown_tb_status, what_was_the_patient_adherence_for_this_drug1, what_was_the_patient_adherence_for_this_drug2, what_was_the_patient_adherence_for_this_drug3, what_was_the_patient_adherence_for_this_drug4, what_was_the_patient_adherence_for_this_drug5, regimen_category, drug_name1, drug_name2, drug_name3, drug_name4, drug_name5, drug_inventory_id1, drug_inventory_id2, drug_inventory_id3, drug_inventory_id4, drug_inventory_id5, drug_auto_expire_date1, drug_auto_expire_date2, drug_auto_expire_date3, drug_auto_expire_date4, drug_auto_expire_date5, hiv_program_state_v_date, hiv_program_start_date_v_date, drug_induced_abdominal_pain_v_date, drug_induced_anorexia_v_date, drug_induced_diarrhea_v_date, drug_induced_jaundice_v_date, drug_induced_leg_pain_numbness_v_date, drug_induced_vomiting_v_date, drug_induced_peripheral_neuropathy_v_date, drug_induced_hepatitis_v_date, drug_induced_anemia_v_date, drug_induced_lactic_acidosis_v_date, drug_induced_lipodystrophy_v_date, drug_induced_skin_rash_v_date, drug_induced_other_symptom_v_date, drug_induced_fever_v_date, drug_induced_cough_v_date, tb_not_suspected_v_date, tb_suspected_v_date, confirmed_tb_not_on_treatment_v_date, confirmed_tb_on_treatment_v_date, unknown_tb_status_v_date, what_was_the_patient_adherence_for_this_drug1_v_date, what_was_the_patient_adherence_for_this_drug2_v_date, what_was_the_patient_adherence_for_this_drug3_v_date, what_was_the_patient_adherence_for_this_drug4_v_date, what_was_the_patient_adherence_for_this_drug5_v_date, regimen_category_v_date, drug_name1_v_date, drug_name2_v_date, drug_name3_v_date, drug_name4_v_date, drug_name5_v_date, drug_inventory_id1_v_date, drug_inventory_id2_v_date, drug_inventory_id3_v_date, drug_inventory_id4_v_date, drug_inventory_id5_v_date, drug_auto_expire_date1_v_date, drug_auto_expire_date2_v_date, drug_auto_expire_date3_v_date, drug_auto_expire_date4_v_date, drug_auto_expire_date5_v_date) VALUES (NEW.patient_id, NEW.current_hiv_program_state, NEW.current_hiv_program_start_date, NEW.drug_induced_abdominal_pain, NEW.drug_induced_anorexia, NEW.drug_induced_diarrhea, NEW.drug_induced_jaundice, NEW.drug_induced_leg_pain_numbness, NEW.drug_induced_vomiting, NEW.drug_induced_peripheral_neuropathy, NEW.drug_induced_hepatitis, NEW.drug_induced_anemia, NEW.drug_induced_lactic_acidosis, NEW.drug_induced_lipodystrophy, NEW.drug_induced_skin_rash, NEW.drug_induced_other_symptom, NEW.drug_induced_fever, NEW.drug_induced_cough, NEW.tb_status_tb_not_suspected, NEW.tb_status_tb_suspected, NEW.tb_status_confirmed_tb_not_on_treatment, NEW.tb_status_confirmed_tb_on_treatment, NEW.tb_status_unknown, NEW.what_was_the_patient_adherence_for_this_drug1, NEW.what_was_the_patient_adherence_for_this_drug2, NEW.what_was_the_patient_adherence_for_this_drug3, NEW.what_was_the_patient_adherence_for_this_drug4, NEW.what_was_the_patient_adherence_for_this_drug5, NEW.regimen_category, NEW.drug_name1, NEW.drug_name2, NEW.drug_name3, NEW.drug_name4, NEW.drug_name5, NEW.drug_inventory_id1, NEW.drug_inventory_id2, NEW.drug_inventory_id3, NEW.drug_inventory_id4, NEW.drug_inventory_id5, NEW.drug_auto_expire_date1, NEW.drug_auto_expire_date2, NEW.drug_auto_expire_date3, NEW.drug_auto_expire_date4, NEW.drug_auto_expire_date5, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date, NEW.visit_date);
    
    END IF;
    
END$$

DELIMITER ;
