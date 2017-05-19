DROP TABLE IF EXISTS `flat_cohort_table`;

CREATE TABLE `flat_cohort_table`(
  `id` INT NOT NULL AUTO_INCREMENT ,
  `patient_id` INT(11) DEFAULT NULL ,
  `gender` VARCHAR(45) DEFAULT NULL ,
  `birthdate` DATE NULL ,
  `earliest_start_date` DATE DEFAULT NULL ,
  `date_enrolled` date default NULL,
  `age_at_initiation` int(11) default NULL,
  `age_in_days` int(11) default NULL,
  `death_date` DATE  DEFAULT NULL ,
  `hiv_program_state` VARCHAR(45) DEFAULT NULL ,
  `hiv_program_start_date` DATE DEFAULT NULL ,
  `reason_for_starting` VARCHAR(255) DEFAULT NULL ,
  `who_stage` VARCHAR(255) DEFAULT NULL ,
  `who_stages_criteria_present` VARCHAR(255) DEFAULT NULL ,
  `ever_registered_at_art` VARCHAR(255) DEFAULT NULL,
  `date_art_last_taken` date DEFAULT NULL,
  `taken_art_in_last_two_months` varchar(255) DEFAULT NULL,
  `malawi_art_side_effects` VARCHAR(255) DEFAULT NULL,
  `patient_pregnant` varchar(255) DEFAULT NULL,
  `patient_breastfeeding` varchar(255) DEFAULT NULL,
  `drug_induced_abdominal_pain`  varchar(255) DEFAULT NULL,
  `drug_induced_anorexia`  varchar(255) DEFAULT NULL,
  `drug_induced_diarrhea`  varchar(255) DEFAULT NULL,
  `drug_induced_jaundice`  varchar(255) DEFAULT NULL,
  `drug_induced_leg_pain_numbness`  varchar(255) DEFAULT NULL,
  `drug_induced_vomiting`  varchar(255) DEFAULT NULL,
  `drug_induced_peripheral_neuropathy`  varchar(255) DEFAULT NULL,
  `drug_induced_hepatitis`  varchar(255) DEFAULT NULL,
  `drug_induced_anemia`  varchar(255) DEFAULT NULL,
  `drug_induced_lactic_acidosis`  varchar(255) DEFAULT NULL,
  `drug_induced_lipodystrophy`  varchar(255) DEFAULT NULL,
  `drug_induced_skin_rash`  varchar(255) DEFAULT NULL,
  `drug_induced_other`  varchar(255) DEFAULT NULL,
  `drug_induced_fever`  varchar(255) DEFAULT NULL,
  `drug_induced_cough`  varchar(255) DEFAULT NULL,
  `drug_induced_kidney_failure` varchar(255) DEFAULT NULL,
  `drug_induced_nightmares` varchar(255) DEFAULT NULL,
  `drug_induced_diziness` varchar(255) DEFAULT NULL,
  `drug_induced_psychosis` varchar(255) DEFAULT NULL,
  `drug_induced_blurry_vision` varchar(255) DEFAULT NULL,
  `side_effects_peripheral_neuropathy` varchar(255) DEFAULT NULL,
  `side_effects_hepatitis` varchar(255) DEFAULT NULL,
  `side_effects_skin_rash` varchar(255) DEFAULT NULL,
  `side_effects_lipodystrophy` varchar(255) DEFAULT NULL,
  `side_effects_other` varchar(255) DEFAULT NULL,
  `side_effects_gynaecomastia` varchar(255) DEFAULT NULL,
  `side_effects_no` varchar(255) DEFAULT NULL,
  `side_effects_kidney_failure` varchar(255) DEFAULT NULL,
  `side_effects_nightmares` varchar(255) DEFAULT NULL,
  `side_effects_diziness` varchar(255) DEFAULT NULL,
  `side_effects_psychosis` varchar(255) DEFAULT NULL,
  `side_effects_blurry_vision` varchar(255) DEFAULT NULL,
  `side_effects_renal_failure` varchar(255) DEFAULT NULL,
  `tb_not_suspected` VARCHAR(255) DEFAULT NULL,
  `tb_suspected` VARCHAR(255) DEFAULT NULL,
  `confirmed_tb_not_on_treatment` VARCHAR(255) DEFAULT NULL,
  `confirmed_tb_on_treatment`  VARCHAR(255) DEFAULT NULL,
  `unknown_tb_status`  VARCHAR(255) DEFAULT NULL,
  `extrapulmonary_tuberculosis` VARCHAR(255) DEFAULT NULL ,
  `pulmonary_tuberculosis` VARCHAR(255) DEFAULT NULL ,
  `pulmonary_tuberculosis_last_2_years` VARCHAR(255) DEFAULT NULL ,
  `kaposis_sarcoma` VARCHAR(255) DEFAULT NULL ,
  `what_was_the_patient_adherence_for_this_drug1` varchar(255) DEFAULT NULL,
  `what_was_the_patient_adherence_for_this_drug2` varchar(255) DEFAULT NULL,
  `what_was_the_patient_adherence_for_this_drug3` varchar(255) DEFAULT NULL,
  `what_was_the_patient_adherence_for_this_drug4` varchar(255) DEFAULT NULL,
  `what_was_the_patient_adherence_for_this_drug5` varchar(255) DEFAULT NULL,
  `regimen_category_treatment` varchar(255) DEFAULT NULL,
  `regimen_category_dispensed` varchar(255) DEFAULT NULL,
  `type_of_ARV_regimen_given` varchar(255) DEFAULT NULL,
  `arv_regimens_received_construct` varchar(255) DEFAULT NULL,
  `drug_name1` varchar(255) DEFAULT NULL,
  `drug_name2` varchar(255) DEFAULT NULL,
  `drug_name3` varchar(255) DEFAULT NULL,
  `drug_name4` varchar(255) DEFAULT NULL,
  `drug_name5` varchar(255) DEFAULT NULL,
  `drug_inventory_id1` int(11) DEFAULT NULL,
  `drug_inventory_id2` int(11) DEFAULT NULL,
  `drug_inventory_id3` int(11) DEFAULT NULL,
  `drug_inventory_id4` int(11) DEFAULT NULL,
  `drug_inventory_id5` int(11) DEFAULT NULL,
  `drug_auto_expire_date1` date DEFAULT NULL,
  `drug_auto_expire_date2` date DEFAULT NULL,
  `drug_auto_expire_date3` date DEFAULT NULL,
  `drug_auto_expire_date4` date DEFAULT NULL,
  `drug_auto_expire_date5` date DEFAULT NULL,
  `current_location` VARCHAR(255) DEFAULT NULL,
  `hiv_program_state_v_date` DATE DEFAULT NULL,
  `hiv_program_start_date_v_date` DATE DEFAULT NULL,
  `current_tb_status_v_date` DATE DEFAULT NULL,
  `reason_for_starting_v_date` DATE DEFAULT NULL,
  `who_stage_v_date` DATE DEFAULT NULL,
  `who_stages_criteria_present_v_date` DATE DEFAULT NULL,
  `ever_registered_at_art_v_date` DATE DEFAULT NULL,
  `date_art_last_taken_v_date` DATE DEFAULT NULL,
  `taken_art_in_last_two_months_v_date` DATE DEFAULT NULL,
  `drug_induced_abdominal_pain_v_date` DATE DEFAULT NULL,
  `drug_induced_anorexia_v_date` DATE DEFAULT NULL,
  `drug_induced_diarrhea_v_date` DATE DEFAULT NULL,
  `drug_induced_jaundice_v_date` DATE DEFAULT NULL,
  `drug_induced_leg_pain_numbness_v_date` DATE DEFAULT NULL,
  `drug_induced_vomiting_v_date` DATE DEFAULT NULL,
  `drug_induced_peripheral_neuropathy_v_date` DATE DEFAULT NULL,
  `drug_induced_hepatitis_v_date` DATE DEFAULT NULL,
  `drug_induced_anemia_v_date` DATE DEFAULT NULL,
  `drug_induced_lactic_acidosis_v_date` DATE DEFAULT NULL,
  `drug_induced_lipodystrophy_v_date` DATE DEFAULT NULL,
  `drug_induced_skin_rash_v_date` DATE DEFAULT NULL,
  `drug_induced_other_v_date` DATE DEFAULT NULL,
  `drug_induced_fever_v_date` DATE DEFAULT NULL,
  `drug_induced_cough_v_date` DATE DEFAULT NULL,
  `tb_not_suspected_v_date` DATE DEFAULT NULL,
  `tb_suspected_v_date` DATE DEFAULT NULL,
  `confirmed_tb_not_on_treatment_v_date` DATE DEFAULT NULL,
  `confirmed_tb_on_treatment_v_date` DATE DEFAULT NULL,
  `unknown_tb_status_v_date` DATE DEFAULT NULL,
  `extrapulmonary_tuberculosis_v_date` DATE DEFAULT NULL,
  `pulmonary_tuberculosis_v_date` DATE DEFAULT NULL,
  `pulmonary_tuberculosis_last_2_years_v_date` DATE DEFAULT NULL,
  `kaposis_sarcoma_v_date` DATE DEFAULT NULL,
  `what_was_the_patient_adherence_for_this_drug1_v_date` DATE DEFAULT NULL,
  `what_was_the_patient_adherence_for_this_drug2_v_date` DATE DEFAULT NULL,
  `what_was_the_patient_adherence_for_this_drug3_v_date` DATE DEFAULT NULL,
  `what_was_the_patient_adherence_for_this_drug4_v_date` DATE DEFAULT NULL,
  `what_was_the_patient_adherence_for_this_drug5_v_date` DATE DEFAULT NULL,
  `regimen_category_treatment_v_date` DATE DEFAULT NULL,
  `regimen_category_dispensed_v_date` DATE DEFAULT NULL,
  `type_of_ARV_regimen_given_v_date` DATE DEFAULT NULL,
  `arv_regimens_received_construct_v_date` DATE DEFAULT NULL,
  `drug_name1_v_date` DATE DEFAULT NULL,
  `drug_name2_v_date` DATE DEFAULT NULL,
  `drug_name3_v_date` DATE DEFAULT NULL,
  `drug_name4_v_date` DATE DEFAULT NULL,
  `drug_name5_v_date` DATE DEFAULT NULL,
  `drug_inventory_id1_v_date` DATE DEFAULT NULL,
  `drug_inventory_id2_v_date` DATE DEFAULT NULL,
  `drug_inventory_id3_v_date` DATE DEFAULT NULL,
  `drug_inventory_id4_v_date` DATE DEFAULT NULL,
  `drug_inventory_id5_v_date` DATE DEFAULT NULL,
  `drug_auto_expire_date1_v_date` DATE DEFAULT NULL,
  `drug_auto_expire_date2_v_date` DATE DEFAULT NULL,
  `drug_auto_expire_date3_v_date` DATE DEFAULT NULL,
  `drug_auto_expire_date4_v_date` DATE DEFAULT NULL,
  `drug_auto_expire_date5_v_date` DATE DEFAULT NULL,
  `patient_pregnant_v_date` DATE DEFAULT NULL,
  `patient_breastfeeding_v_date` DATE DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID_UNIQUE` (`patient_id`)

);
