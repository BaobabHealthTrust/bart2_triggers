-- MySQL dump 10.13  Distrib 5.5.29, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: bart2_bare_bones
-- ------------------------------------------------------
-- Server version	5.5.29-0ubuntu0.12.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `flat_table2`
--

DROP TABLE IF EXISTS `flat_table2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flat_table2` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) DEFAULT NULL,
  `visit_date` date DEFAULT NULL,
  `patient_pregnant` varchar(255) DEFAULT NULL,
  `patient_breastfeeding` varchar(255) DEFAULT NULL,
  `currently_using_family_planning_method` varchar(255) DEFAULT NULL,
  `family_planning_method_oral_contraceptive_pills` varchar(255) DEFAULT NULL,
  `family_planning_method_depo_provera` varchar(255) DEFAULT NULL,
  `family_planning_method_intrauterine_contraception` varchar(255) DEFAULT NULL,
  `family_planning_method_contraceptive_implant` varchar(255) DEFAULT NULL,
  `family_planning_method_male_condoms` varchar(255) DEFAULT NULL,
  `family_planning_method_female_condoms` varchar(255) DEFAULT NULL,
  `family_planning_method_rythm_method` varchar(255) DEFAULT NULL,
  `family_planning_method_withdrawal` varchar(255) DEFAULT NULL,
  `family_planning_method_abstinence` varchar(255) DEFAULT NULL,
  `family_planning_method_tubal_ligation` varchar(255) DEFAULT NULL,
  `family_planning_method_vasectomy` varchar(255) DEFAULT NULL,
  `family_planning_method_emergency_contraception` varchar(255) DEFAULT NULL,
  `symptom_present_lipodystrophy` varchar(255) DEFAULT NULL,
  `symptom_present_anemia` varchar(255) DEFAULT NULL,
  `symptom_present_jaundice` varchar(255) DEFAULT NULL,
  `symptom_present_lactic_acidosis` varchar(255) DEFAULT NULL,
  `symptom_present_fever` varchar(255) DEFAULT NULL,
  `symptom_present_skin_rash` varchar(255) DEFAULT NULL,
  `symptom_present_abdominal_pain` varchar(255) DEFAULT NULL,
  `symptom_present_anorexia` varchar(255) DEFAULT NULL,
  `symptom_present_cough` varchar(255) DEFAULT NULL,
  `symptom_present_diarrhea` varchar(255) DEFAULT NULL,
  `symptom_present_hepatitis` varchar(255) DEFAULT NULL,
  `symptom_present_leg_pain_numbness` varchar(255) DEFAULT NULL,
  `symptom_present_peripheral_neuropathy` varchar(255) DEFAULT NULL,
  `symptom_present_vomiting` varchar(255) DEFAULT NULL,
  `symptom_present_other_symptom` varchar(255) DEFAULT NULL,
  `symptom_present_kidney_failure` varchar(255) DEFAULT NULL,
  `symptom_present_nightmares` varchar(255) DEFAULT NULL,
  `symptom_present_diziness` varchar(255) DEFAULT NULL,
  `symptom_present_psychosis` varchar(255) DEFAULT NULL,
  `symptom_present_blurry_vision` varchar(255) DEFAULT NULL,
  `symptom_present_gynaecomastia` varchar(255) DEFAULT NULL,
  `symptom_present_no` varchar(255) DEFAULT NULL,
  `sysmptom_present_renal_failure` varchar(255) DEFAULT NULL,
  `side_effects_abdominal_pain` varchar(45) DEFAULT NULL,
  `side_effects_anemia` varchar(45) DEFAULT NULL,
  `side_effects_anorexia` varchar(45) DEFAULT NULL,
  `side_effects_blurry_vision` varchar(45) DEFAULT NULL,
  `side_effects_cough` varchar(45) DEFAULT NULL,
  `side_effects_diarrhea` varchar(45) DEFAULT NULL,
  `side_effects_diziness` varchar(45) DEFAULT NULL,
  `side_effects_fever` varchar(45) DEFAULT NULL,
  `side_effects_gynaecomastia` varchar(45) DEFAULT NULL,
  `side_effects_hepatitis` varchar(45) DEFAULT NULL,
  `side_effects_jaundice` varchar(45) DEFAULT NULL,
  `side_effects_kidney_failure` varchar(45) DEFAULT NULL,
  `side_effects_lactic_acidosis` varchar(45) DEFAULT NULL,
  `side_effects_leg_pain_numbness` varchar(45) DEFAULT NULL,
  `side_effects_lipodystrophy` varchar(45) DEFAULT NULL,
  `side_effects_no` varchar(45) DEFAULT NULL,
  `side_effects_other` varchar(45) DEFAULT NULL,
  `side_effects_peripheral_neuropathy` varchar(45) DEFAULT NULL,
  `side_effects_psychosis` varchar(45) DEFAULT NULL,
  `side_effects_renal_failure` varchar(45) DEFAULT NULL,
  `side_effects_skin_rash` varchar(45) DEFAULT NULL,
  `side_effects_vomiting` varchar(45) DEFAULT NULL,
  `side_effects_nightmares` varchar(45) DEFAULT NULL,
  `drug_induced_abdominal_pain` varchar(45) DEFAULT NULL,
  `drug_induced_anemia` varchar(45) DEFAULT NULL,
  `drug_induced_anorexia` varchar(45) DEFAULT NULL,
  `drug_induced_blurry_vision` varchar(45) DEFAULT NULL,
  `drug_induced_cough` varchar(45) DEFAULT NULL,
  `drug_induced_diarrhea` varchar(45) DEFAULT NULL,
  `drug_induced_diziness` varchar(45) DEFAULT NULL,
  `drug_induced_fever` varchar(45) DEFAULT NULL,
  `drug_induced_gynaecomastia` varchar(45) DEFAULT NULL,
  `drug_induced_hepatitis` varchar(45) DEFAULT NULL,
  `drug_induced_jaundice` varchar(45) DEFAULT NULL,
  `drug_induced_kidney_failure` varchar(45) DEFAULT NULL,
  `drug_induced_lactic_acidosis` varchar(45) DEFAULT NULL,
  `drug_induced_leg_pain_numbness` varchar(45) DEFAULT NULL,
  `drug_induced_lipodystrophy` varchar(45) DEFAULT NULL,
  `drug_induced_no` varchar(45) DEFAULT NULL,
  `drug_induced_other` varchar(45) DEFAULT NULL,
  `drug_induced_peripheral_neuropathy` varchar(45) DEFAULT NULL,
  `drug_induced_psychosis` varchar(45) DEFAULT NULL,
  `drug_induced_renal_failure` varchar(45) DEFAULT NULL,
  `drug_induced_skin_rash` varchar(45) DEFAULT NULL,
  `drug_induced_vomiting` varchar(45) DEFAULT NULL,
  `drug_induced_nightmares` varchar(45) DEFAULT NULL,
  `routine_tb_screening_fever` varchar(255) DEFAULT NULL,
  `routine_tb_screening_night_sweats` varchar(255) DEFAULT NULL,
  `routine_tb_screening_cough_of_any_duration` varchar(255) DEFAULT NULL,
  `routine_tb_screening_weight_loss_failure` varchar(255) DEFAULT NULL,
  `tb_status_tb_not_suspected` varchar(255) DEFAULT NULL,
  `tb_status_tb_suspected` varchar(255) DEFAULT NULL,
  `tb_status_confirmed_tb_not_on_treatment` varchar(255) DEFAULT NULL,
  `tb_status_confirmed_tb_on_treatment` varchar(255) DEFAULT NULL,
  `tb_status_unknown` varchar(255) DEFAULT NULL,
  `allergic_to_sulphur_yes` varchar(255) DEFAULT NULL,
  `allergic_to_sulphur_no` varchar(255) DEFAULT NULL,
  `weight` varchar(255) DEFAULT NULL,
  `height` varchar(255) DEFAULT NULL,
  `temperature` varchar(255) DEFAULT NULL,
  `bmi` varchar(255) DEFAULT NULL,
  `systolic_blood_pressure` varchar(255) DEFAULT NULL,
  `diastolic_blood_pressure` varchar(255) DEFAULT NULL,
  `weight_for_height` varchar(255) DEFAULT NULL,
  `weight_for_age` varchar(255) DEFAULT NULL,
  `height_for_age` varchar(255) DEFAULT NULL,
  `patient_program` varchar(255) DEFAULT NULL,
  `prescribe_arvs` varchar(255) DEFAULT NULL,
  `prescribe_ipt` varchar(255) DEFAULT NULL,
  `continue_existing_regimen_yes` varchar(255) DEFAULT NULL,
  `continue_existing_regimen_no` varchar(255) DEFAULT NULL,

  `regimen_concept_id_art_regimen` varchar(255) DEFAULT NULL,
  `regimen_fomulation_and_dosages` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `transfer_out_location` varchar(255) DEFAULT NULL,
  `current_state` varchar(255) DEFAULT NULL,
  `initial_start_date` varchar(255) DEFAULT NULL,

  `cpt_given` varchar(255) DEFAULT NULL,
  `ipt_given` varchar(255) DEFAULT NULL,
  `condoms_given` varchar(255) DEFAULT NULL,
  `allergic_to_sulphur` varchar(255) DEFAULT NULL,
  `regimen_category` varchar(255) DEFAULT NULL,
  `regimen_category_treatment` varchar(255) DEFAULT NULL,
  `type_of_ARV_regimen_given` varchar(255) DEFAULT NULL,

  `regimen_category_dispensed` varchar(255) DEFAULT NULL,
  `arv_regimens_received_construct` varchar(255) DEFAULT NULL,
  `drugs_dispensed` varchar(255) DEFAULT NULL,

  `drug_order_id1` varchar(255) DEFAULT NULL,
  `drug_encounter_id1` varchar(255) DEFAULT NULL,
  `drug_start_date1` varchar(255) DEFAULT NULL,
  `drug_auto_expire_date1` varchar(255) DEFAULT NULL,
  `drug_inventory_id1` varchar(255) DEFAULT NULL,
  `drug_name1` varchar(255) DEFAULT NULL,
  `drug_equivalent_daily_dose1` varchar(255) DEFAULT NULL,
  `drug_dose1` varchar(255) DEFAULT NULL,
  `drug_frequency1` varchar(255) DEFAULT NULL,
  `drug_quantity1` varchar(255) DEFAULT NULL,
  `drug_order_id2` varchar(255) DEFAULT NULL,
  `drug_encounter_id2` varchar(255) DEFAULT NULL,
  `drug_start_date2` varchar(255) DEFAULT NULL,
  `drug_auto_expire_date2` varchar(255) DEFAULT NULL,
  `drug_inventory_id2` varchar(255) DEFAULT NULL,
  `drug_name2` varchar(255) DEFAULT NULL,
  `drug_equivalent_daily_dose2` varchar(255) DEFAULT NULL,
  `drug_dose2` varchar(255) DEFAULT NULL,
  `drug_frequency2` varchar(255) DEFAULT NULL,
  `drug_quantity2` varchar(255) DEFAULT NULL,
  `drug_order_id3` varchar(255) DEFAULT NULL,
  `drug_encounter_id3` varchar(255) DEFAULT NULL,
  `drug_start_date3` varchar(255) DEFAULT NULL,
  `drug_auto_expire_date3` varchar(255) DEFAULT NULL,
  `drug_inventory_id3` varchar(255) DEFAULT NULL,
  `drug_name3` varchar(255) DEFAULT NULL,
  `drug_equivalent_daily_dose3` varchar(255) DEFAULT NULL,
  `drug_dose3` varchar(255) DEFAULT NULL,
  `drug_frequency3` varchar(255) DEFAULT NULL,
  `drug_quantity3` varchar(255) DEFAULT NULL,
  `drug_order_id4` varchar(255) DEFAULT NULL,
  `drug_encounter_id4` varchar(255) DEFAULT NULL,
  `drug_start_date4` varchar(255) DEFAULT NULL,
  `drug_auto_expire_date4` varchar(255) DEFAULT NULL,
  `drug_inventory_id4` varchar(255) DEFAULT NULL,
  `drug_name4` varchar(255) DEFAULT NULL,
  `drug_equivalent_daily_dose4` varchar(255) DEFAULT NULL,
  `drug_dose4` varchar(255) DEFAULT NULL,
  `drug_frequency4` varchar(255) DEFAULT NULL,
  `drug_quantity4` varchar(255) DEFAULT NULL,
  `drug_order_id5` varchar(255) DEFAULT NULL,
  `drug_encounter_id5` varchar(255) DEFAULT NULL,
  `drug_start_date5` varchar(255) DEFAULT NULL,
  `drug_auto_expire_date5` varchar(255) DEFAULT NULL,
  `drug_inventory_id5` varchar(255) DEFAULT NULL,
  `drug_name5` varchar(255) DEFAULT NULL,
  `drug_equivalent_daily_dose5` varchar(255) DEFAULT NULL,
  `drug_dose5` varchar(255) DEFAULT NULL,
  `drug_frequency5` varchar(255) DEFAULT NULL,
  `drug_quantity5` varchar(255) DEFAULT NULL,
  `amount_of_drug1_brought_to_clinic` varchar(255) DEFAULT NULL,
  `amount_of_drug1_remaining_at_home` varchar(255) DEFAULT NULL,
  `what_was_the_patient_adherence_for_this_drug1` varchar(255) DEFAULT NULL,
  `missed_hiv_drug_construct1` varchar(255) DEFAULT NULL,
  `amount_of_drug2_brought_to_clinic` varchar(255) DEFAULT NULL,
  `amount_of_drug2_remaining_at_home` varchar(255) DEFAULT NULL,
  `what_was_the_patient_adherence_for_this_drug2` varchar(255) DEFAULT NULL,
  `missed_hiv_drug_construct2` varchar(255) DEFAULT NULL,
  `amount_of_drug3_brought_to_clinic` varchar(255) DEFAULT NULL,
  `amount_of_drug3_remaining_at_home` varchar(255) DEFAULT NULL,
  `what_was_the_patient_adherence_for_this_drug3` varchar(255) DEFAULT NULL,
  `missed_hiv_drug_construct3` varchar(255) DEFAULT NULL,
  `amount_of_drug4_brought_to_clinic` varchar(255) DEFAULT NULL,
  `amount_of_drug4_remaining_at_home` varchar(255) DEFAULT NULL,
  `what_was_the_patient_adherence_for_this_drug4` varchar(255) DEFAULT NULL,
  `missed_hiv_drug_construct4` varchar(255) DEFAULT NULL,
  `amount_of_drug5_brought_to_clinic` varchar(255) DEFAULT NULL,
  `amount_of_drug5_remaining_at_home` varchar(255) DEFAULT NULL,
  `what_was_the_patient_adherence_for_this_drug5` varchar(255) DEFAULT NULL,
  `missed_hiv_drug_construct5` varchar(255) DEFAULT NULL,
  `current_hiv_program_state` varchar(255) DEFAULT NULL,
  `current_hiv_program_start_date` varchar(255) DEFAULT NULL,
  `current_hiv_program_end_date` varchar(255) DEFAULT NULL,
  `patient_present` varchar(255) DEFAULT NULL,
  `appointment_date` varchar(255) DEFAULT NULL,
  `transfer_within_responsibility_no` varchar(255) DEFAULT NULL,
  `transfer_within_responsibility_yes` varchar(255) DEFAULT NULL,
  `guardian_present` varchar(255) DEFAULT NULL,
  `arv_regimen_type_unknown` varchar(255) DEFAULT NULL,
  `arv_regimen_type_d4T_3TC_NVP` varchar(255) DEFAULT NULL,
  `arv_regimen_type_triomune` varchar(255) DEFAULT NULL,
  `arv_regimen_type_triomune_30` varchar(255) DEFAULT NULL,
  `arv_regimen_type_triomune_40` varchar(255) DEFAULT NULL,
  `arv_regimen_type_AZT_3TC_NVP` varchar(255) DEFAULT NULL,
  `arv_regimen_type_AZT_3TC_LPV_r` varchar(255) DEFAULT NULL,
  `arv_regimen_type_AZT_3TC_EFV` varchar(255) DEFAULT NULL,
  `arv_regimen_type_d4T_3TC_EFV` varchar(255) DEFAULT NULL,
  `arv_regimen_type_TDF_3TC_NVP` varchar(255) DEFAULT NULL,
  `arv_regimen_type_TDF_3TC_EFV` varchar(255) DEFAULT NULL,
  `arv_regimen_type_ABC_3TC_LPV_r` varchar(255) DEFAULT NULL,
  `arv_regimen_type_TDF_3TC_LPV_r` varchar(255) DEFAULT NULL,
  `arv_regimen_type_d4T_3TC_d4T_3TC_NVP` varchar(255) DEFAULT NULL,
  `arv_regimen_type_AZT_3TC_AZT_3TC_NVP` varchar(255) DEFAULT NULL,
  `arv_regimen_type_ABC_3TC_LPV_r200_50` varchar(255) DEFAULT NULL,
  `arv_regimen_type_TDF_3TC_LPV_r200_50` varchar(255) DEFAULT NULL,
  `arv_regimen_type_AZT_3TC_LPV_r200_25` varchar(255) DEFAULT NULL,
  `arv_regimen_type_AZT_3TC_LPV_r200_50` varchar(255) DEFAULT NULL,
  `arv_regimen_type_DVR_r100_EFV_RAL400` varchar(255) DEFAULT NULL,
  `patient_pregnant_enc_id` int(11) DEFAULT NULL,
  `patient_breastfeeding_enc_id` int(11) DEFAULT NULL,
  `patient_pregnant_v_date` date DEFAULT NULL,
  `patient_breastfeeding_v_date` date DEFAULT NULL,
  `currently_using_family_planning_method_enc_id` int(11) DEFAULT NULL,
  `family_planning_method_oral_contraceptive_pills_enc_id` int(11) DEFAULT NULL,
  `family_planning_method_depo_provera_enc_id` int(11) DEFAULT NULL,
  `family_planning_method_intrauterine_contraception_enc_id` int(11) DEFAULT NULL,
  `family_planning_method_contraceptive_implant_enc_id` int(11) DEFAULT NULL,
  `family_planning_method_male_condoms_enc_id` int(11) DEFAULT NULL,
  `family_planning_method_female_condoms_enc_id` int(11) DEFAULT NULL,
  `family_planning_method_rythm_method_enc_id` int(11) DEFAULT NULL,
  `family_planning_method_withdrawal_enc_id` int(11) DEFAULT NULL,
  `family_planning_method_abstinence_enc_id` int(11) DEFAULT NULL,
  `family_planning_method_tubal_ligation_enc_id` int(11) DEFAULT NULL,
  `family_planning_method_vasectomy_enc_id` int(11) DEFAULT NULL,
  `family_planning_method_emergency_contraception_enc_id` int(11) DEFAULT NULL,
  `symptom_present_abdominal_pain_enc_id` int(11) DEFAULT NULL,
  `symptom_present_anemia_enc_id` int(11) DEFAULT NULL,
  `symptom_present_anorexia_enc_id` int(11) DEFAULT NULL,
  `symptom_present_blurry_vision_enc_id` int(11) DEFAULT NULL,
  `symptom_present_cough_enc_id` int(11) DEFAULT NULL,
  `symptom_present_diarrhea_enc_id` int(11) DEFAULT NULL,
  `symptom_present_diziness_enc_id` int(11) DEFAULT NULL,
  `symptom_present_fever_enc_id` int(11) DEFAULT NULL,
  `symptom_present_gynaecomastia_enc_id` int(11) DEFAULT NULL,
  `symptom_present_hepatitis_enc_id` int(11) DEFAULT NULL,
  `symptom_present_jaundice_enc_id` int(11) DEFAULT NULL,
  `symptom_present_kidney_failure_enc_id` int(11) DEFAULT NULL,
  `symptom_present_lactic_acidosis_enc_id` int(11) DEFAULT NULL,
  `symptom_present_leg_pain_numbness_enc_id` int(11) DEFAULT NULL,
  `symptom_present_lipodystrophy_enc_id` int(11) DEFAULT NULL,
  `symptom_present_no_enc_id` int(11) DEFAULT NULL,
  `symptom_present_other_enc_id` int(11) DEFAULT NULL,
  `symptom_present_peripheral_neuropathy_enc_id` int(11) DEFAULT NULL,
  `symptom_present_psychosis_enc_id` int(11) DEFAULT NULL,
  `symptom_present_renal_failure_enc_id` int(11) DEFAULT NULL,
  `symptom_present_skin_rash_enc_id` int(11) DEFAULT NULL,
  `symptom_present_vomiting_enc_id` int(11) DEFAULT NULL,
  `sysmptom_present_renal_failure_enc_id`  int(11) DEFAULT NULL,
  `side_effects_abdominal_pain_enc_id` int(11) DEFAULT NULL,
  `side_effects_anemia_enc_id` int(11) DEFAULT NULL,
  `side_effects_anorexia_enc_id` int(11) DEFAULT NULL,
  `side_effects_blurry_vision_enc_id` int(11) DEFAULT NULL,
  `side_effects_cough_enc_id` int(11) DEFAULT NULL,
  `side_effects_diarrhea_enc_id` int(11) DEFAULT NULL,
  `side_effects_diziness_enc_id` int(11) DEFAULT NULL,
  `side_effects_fever_enc_id` int(11) DEFAULT NULL,
  `side_effects_hepatitis_enc_id` int(11) DEFAULT NULL,
  `side_effects_jaundice_enc_id` int(11) DEFAULT NULL,
  `side_effects_kidney_failure_enc_id` int(11) DEFAULT NULL,
  `side_effects_lactic_acidosis_enc_id` int(11) DEFAULT NULL,
  `side_effects_leg_pain_numbness_enc_id` int(11) DEFAULT NULL,
  `side_effects_lipodystrophy_enc_id` int(11) DEFAULT NULL,
  `side_effects_no_enc_id` int(11) DEFAULT NULL,
  `side_effects_other_enc_id` int(11) DEFAULT NULL,
  `side_effects_peripheral_neuropathy_enc_id` int(11) DEFAULT NULL,
  `side_effects_psychosis_enc_id` int(11) DEFAULT NULL,
  `side_effects_renal_failure_enc_id` int(11) DEFAULT NULL,
  `side_effects_skin_rash_enc_id` int(11) DEFAULT NULL,
  `side_effects_vomiting_enc_id` int(11) DEFAULT NULL,
  `side_effects_gynaecomastia_enc_id` int(11) DEFAULT NULL,
  `side_effects_nightmares_enc_id` int(11) DEFAULT NULL,
  `drug_induced_abdominal_pain_enc_id` int(11) DEFAULT NULL,
  `drug_induced_anemia_enc_id` int(11) DEFAULT NULL,
  `drug_induced_anorexia_enc_id` int(11) DEFAULT NULL,
  `drug_induced_blurry_vision_enc_id` int(11) DEFAULT NULL,
  `drug_induced_cough_enc_id` int(11) DEFAULT NULL,
  `drug_induced_diarrhea_enc_id` int(11) DEFAULT NULL,
  `drug_induced_diziness_enc_id` int(11) DEFAULT NULL,
  `drug_induced_fever_enc_id` int(11) DEFAULT NULL,
  `drug_induced_gynaecomastia_enc_id` int(11) DEFAULT NULL,
  `drug_induced_hepatitis_enc_id` int(11) DEFAULT NULL,
  `drug_induced_jaundice_enc_id` int(11) DEFAULT NULL,
  `drug_induced_kidney_failure_enc_id` int(11) DEFAULT NULL,
  `drug_induced_lactic_acidosis_enc_id` int(11) DEFAULT NULL,
  `drug_induced_leg_pain_numbness_enc_id` int(11) DEFAULT NULL,
  `drug_induced_lipodystrophy_enc_id` int(11) DEFAULT NULL,
  `drug_induced_no_enc_id` int(11) DEFAULT NULL,
  `drug_induced_other_enc_id` int(11) DEFAULT NULL,
  `drug_induced_peripheral_neuropathy_enc_id` int(11) DEFAULT NULL,
  `drug_induced_psychosis_enc_id` int(11) DEFAULT NULL,
  `drug_induced_renal_failure_enc_id` int(11) DEFAULT NULL,
  `drug_induced_skin_rash_enc_id` int(11) DEFAULT NULL,
  `drug_induced_vomiting_enc_id` int(11) DEFAULT NULL,
  `drug_induced_nightmares_enc_id` int(11) DEFAULT NULL,
  `routine_tb_screening_fever_enc_id` int(11) DEFAULT NULL,
  `routine_tb_screening_night_sweats_enc_id` int(11) DEFAULT NULL,
  `routine_tb_screening_cough_of_any_duration_enc_id` int(11) DEFAULT NULL,
  `routine_tb_screening_weight_loss_failure_enc_id` int(11) DEFAULT NULL,
  `tb_status_tb_not_suspected_enc_id` int(11) DEFAULT NULL,
  `tb_status_tb_suspected_enc_id` int(11) DEFAULT NULL,
  `tb_status_confirmed_tb_not_on_treatment_enc_id` int(11) DEFAULT NULL,
  `tb_status_confirmed_tb_on_treatment_enc_id` int(11) DEFAULT NULL,
  `tb_status_unknown_enc_id` int(11) DEFAULT NULL,
  `allergic_to_sulphur_yes_enc_id` int(11) DEFAULT NULL,
  `allergic_to_sulphur_no_enc_id` int(11) DEFAULT NULL,
  `weight_enc_id` int(11) DEFAULT NULL,
  `height_enc_id` int(11) DEFAULT NULL,
  `temperature_enc_id` int(11) DEFAULT NULL,
  `bmi_enc_id` int(11) DEFAULT NULL,
  `systolic_blood_pressure_enc_id` int(11) DEFAULT NULL,
  `diastolic_blood_pressure_enc_id` int(11) DEFAULT NULL,
  `weight_for_height_enc_id` int(11) DEFAULT NULL,
  `weight_for_age_enc_id` int(11) DEFAULT NULL,
  `height_for_age_enc_id` int(11) DEFAULT NULL,
  `patient_program_enc_id` int(11) DEFAULT NULL,
  `prescribe_arvs_enc_id` int(11) DEFAULT NULL,
  `prescribe_ipt_enc_id` int(11) DEFAULT NULL,
  `continue_existing_regimen_yes_enc_id` int(11) DEFAULT NULL,
  `continue_existing_regimen_no_enc_id` int(11) DEFAULT NULL,
  `regimen_concept_id_art_regimen_enc_id` int(11) DEFAULT NULL,
  `regimen_fomulation_and_dosages_enc_id` int(11) DEFAULT NULL,
  `duration_enc_id` int(11) DEFAULT NULL,
  `cpt_given_enc_id` int(11) DEFAULT NULL,
  `ipt_given_enc_id` int(11) DEFAULT NULL,
  `condoms_given_enc_id` int(11) DEFAULT NULL,
  `allergic_to_sulphur_enc_id` int(11) DEFAULT NULL,
  `refer_to_sulphur_enc_id` int(11) DEFAULT NULL,
  `regimen_category_enc_id` int(11) DEFAULT NULL,
  `regimen_category_treatment_enc_id` int(11) DEFAULT NULL,
  `type_of_ARV_regimen_given_enc_id` int(11) DEFAULT NULL,
  `regimen_category_dispensed_enc_id` int(11) DEFAULT NULL,
  `arv_regimens_received_construct_enc_id` int(11) DEFAULT NULL,
  `drugs_dispensed_enc_id` int(11) DEFAULT NULL,
  `transfer_out_location_enc_id` int(11) DEFAULT NULL,
  `current_state_enc_id` int(11) DEFAULT NULL,
  `initial_start_date_enc_id` int(11) DEFAULT NULL,
  `drug_order_id1_enc_id` int(11) DEFAULT NULL,
  `drug_encounter_id1_enc_id` int(11) DEFAULT NULL,
  `drug_start_date1_enc_id` int(11) DEFAULT NULL,
  `drug_auto_expire_date1_enc_id` int(11) DEFAULT NULL,
  `drug_inventory_id1_enc_id` int(11) DEFAULT NULL,
  `drug_name1_enc_id` int(11) DEFAULT NULL,
  `drug_equivalent_daily_dose1_enc_id` int(11) DEFAULT NULL,
  `drug_dose1_enc_id` int(11) DEFAULT NULL,
  `drug_frequency1_enc_id` int(11) DEFAULT NULL,
  `drug_quantity1_enc_id` int(11) DEFAULT NULL,
  `drug_order_id2_enc_id` int(11) DEFAULT NULL,
  `drug_encounter_id2_enc_id` int(11) DEFAULT NULL,
  `drug_start_date2_enc_id` int(11) DEFAULT NULL,
  `drug_auto_expire_date2_enc_id` int(11) DEFAULT NULL,
  `drug_inventory_id2_enc_id` int(11) DEFAULT NULL,
  `drug_name2_enc_id` int(11) DEFAULT NULL,
  `drug_equivalent_daily_dose2_enc_id` int(11) DEFAULT NULL,
  `drug_dose2_enc_id` int(11) DEFAULT NULL,
  `drug_frequency2_enc_id` int(11) DEFAULT NULL,
  `drug_quantity2_enc_id` int(11) DEFAULT NULL,
  `drug_order_id3_enc_id` int(11) DEFAULT NULL,
  `drug_encounter_id3_enc_id` int(11) DEFAULT NULL,
  `drug_start_date3_enc_id` int(11) DEFAULT NULL,
  `drug_auto_expire_date3_enc_id` int(11) DEFAULT NULL,
  `drug_inventory_id3_enc_id` int(11) DEFAULT NULL,
  `drug_name3_enc_id` int(11) DEFAULT NULL,
  `drug_equivalent_daily_dose3_enc_id` int(11) DEFAULT NULL,
  `drug_dose3_enc_id` int(11) DEFAULT NULL,
  `drug_frequency3_enc_id` int(11) DEFAULT NULL,
  `drug_quantity3_enc_id` int(11) DEFAULT NULL,
  `drug_order_id4_enc_id` int(11) DEFAULT NULL,
  `drug_encounter_id4_enc_id` int(11) DEFAULT NULL,
  `drug_start_date4_enc_id` int(11) DEFAULT NULL,
  `drug_auto_expire_date4_enc_id` int(11) DEFAULT NULL,
  `drug_inventory_id4_enc_id` int(11) DEFAULT NULL,
  `drug_name4_enc_id` int(11) DEFAULT NULL,
  `drug_equivalent_daily_dose4_enc_id` int(11) DEFAULT NULL,
  `drug_dose4_enc_id` int(11) DEFAULT NULL,
  `drug_frequency4_enc_id` int(11) DEFAULT NULL,
  `drug_quantity4_enc_id` int(11) DEFAULT NULL,
  `drug_order_id5_enc_id` int(11) DEFAULT NULL,
  `drug_encounter_id5_enc_id` int(11) DEFAULT NULL,
  `drug_start_date5_enc_id` int(11) DEFAULT NULL,
  `drug_auto_expire_date5_enc_id` int(11) DEFAULT NULL,
  `drug_inventory_id5_enc_id` int(11) DEFAULT NULL,
  `drug_name5_enc_id` int(11) DEFAULT NULL,
  `drug_equivalent_daily_dose5_enc_id` int(11) DEFAULT NULL,
  `drug_dose5_enc_id` int(11) DEFAULT NULL,
  `drug_frequency5_enc_id` int(11) DEFAULT NULL,
  `drug_quantity5_enc_id` int(11) DEFAULT NULL,
  `amount_of_drug1_brought_to_clinic_enc_id` int(11) DEFAULT NULL,
  `amount_of_drug1_remaining_at_home_enc_id` int(11) DEFAULT NULL,
  `what_was_the_patient_adherence_for_this_drug1_enc_id` int(11) DEFAULT NULL,
  `missed_hiv_drug_construct1_enc_id` int(11) DEFAULT NULL,
  `amount_of_drug2_brought_to_clinic_enc_id` int(11) DEFAULT NULL,
  `amount_of_drug2_remaining_at_home_enc_id` int(11) DEFAULT NULL,
  `what_was_the_patient_adherence_for_this_drug2_enc_id` int(11) DEFAULT NULL,
  `missed_hiv_drug_construct2_enc_id` int(11) DEFAULT NULL,
  `amount_of_drug3_brought_to_clinic_enc_id` int(11) DEFAULT NULL,
  `amount_of_drug3_remaining_at_home_enc_id` int(11) DEFAULT NULL,
  `what_was_the_patient_adherence_for_this_drug3_enc_id` int(11) DEFAULT NULL,
  `missed_hiv_drug_construct3_enc_id` int(11) DEFAULT NULL,
  `amount_of_drug4_brought_to_clinic_enc_id` int(11) DEFAULT NULL,
  `amount_of_drug4_remaining_at_home_enc_id` int(11) DEFAULT NULL,
  `what_was_the_patient_adherence_for_this_drug4_enc_id` int(11) DEFAULT NULL,
  `missed_hiv_drug_construct4_enc_id` int(11) DEFAULT NULL,
  `amount_of_drug5_brought_to_clinic_enc_id` int(11) DEFAULT NULL,
  `amount_of_drug5_remaining_at_home_enc_id` int(11) DEFAULT NULL,
  `what_was_the_patient_adherence_for_this_drug5_enc_id` int(11) DEFAULT NULL,
  `missed_hiv_drug_construct5_enc_id` int(11) DEFAULT NULL,
  `current_hiv_program_state_enc_id` int(11) DEFAULT NULL,
  `current_hiv_program_start_date_enc_id` int(11) DEFAULT NULL,
  `current_hiv_program_end_date_enc_id` int(11) DEFAULT NULL,
  `patient_present_enc_id` int(11) DEFAULT NULL,
  `appointment_date_enc_id` int(11) DEFAULT NULL,
  `transfer_within_responsibility_no_enc_id` int(11) DEFAULT NULL,
  `transfer_within_responsibility_yes_enc_id` int(11) DEFAULT NULL,
  `guardian_present_enc_id` int(11) DEFAULT NULL,
  `arv_regimen_type_unknown_enc_id` int(11) DEFAULT NULL,
  `arv_regimen_type_d4T_3TC_NVP_enc_id` int(11) DEFAULT NULL,
  `arv_regimen_type_triomune_enc_id` int(11) DEFAULT NULL,
  `arv_regimen_type_triomune_30_enc_id` int(11) DEFAULT NULL,
  `arv_regimen_type_triomune_40_enc_id` int(11) DEFAULT NULL,
  `arv_regimen_type_AZT_3TC_NVP_enc_id` int(11) DEFAULT NULL,
  `arv_regimen_type_AZT_3TC_LPV_r_enc_id` int(11) DEFAULT NULL,
  `arv_regimen_type_AZT_3TC_EFV_enc_id` int(11) DEFAULT NULL,
  `arv_regimen_type_d4T_3TC_EFV_enc_id` int(11) DEFAULT NULL,
  `arv_regimen_type_TDF_3TC_NVP_enc_id` int(11) DEFAULT NULL,
  `arv_regimen_type_TDF_3TC_EFV_enc_id` int(11) DEFAULT NULL,
  `arv_regimen_type_ABC_3TC_LPV_r_enc_id` int(11) DEFAULT NULL,
  `arv_regimen_type_TDF_3TC_LPV_r_enc_id` int(11) DEFAULT NULL,
  `arv_regimen_type_d4T_3TC_d4T_3TC_NVP_enc_id` int(11) DEFAULT NULL,
  `arv_regimen_type_AZT_3TC_AZT_3TC_NVP_enc_id` int(11) DEFAULT NULL,
  `symptom_present_abdominal_pain_v_date` DATE DEFAULT NULL,
  `symptom_present_anemia_v_date` DATE DEFAULT NULL,
  `symptom_present_anorexia_v_date` DATE DEFAULT NULL,
  `symptom_present_blurry_vision_v_date` DATE DEFAULT NULL,
  `symptom_present_cough_v_date` DATE DEFAULT NULL,
  `symptom_present_diarrhea_v_date` DATE DEFAULT NULL,
  `symptom_present_diziness_v_date` DATE DEFAULT NULL,
  `symptom_present_fever_v_date` DATE DEFAULT NULL,
  `symptom_present_gynaecomastia_v_date` DATE DEFAULT NULL,
  `symptom_present_hepatitis_v_date` DATE DEFAULT NULL,
  `symptom_present_jaundice_v_date` DATE DEFAULT NULL,
  `symptom_present_kidney_failure_v_date` DATE DEFAULT NULL,
  `symptom_present_lactic_acidosis_v_date` DATE DEFAULT NULL,
  `symptom_present_leg_pain_numbness_v_date` DATE DEFAULT NULL,
  `symptom_present_lipodystrophy_v_date` DATE DEFAULT NULL,
  `symptom_present_no_v_date` DATE DEFAULT NULL,
  `symptom_present_other_v_date` DATE DEFAULT NULL,
  `symptom_present_peripheral_neuropathy_v_date` DATE DEFAULT NULL,
  `symptom_present_psychosis_v_date` DATE DEFAULT NULL,
  `symptom_present_renal_failure_v_date` DATE DEFAULT NULL,
  `symptom_present_skin_rash_v_date` DATE DEFAULT NULL,
  `symptom_present_vomiting_v_date` DATE DEFAULT NULL,
  `sysmptom_present_renal_failure_v_date` DATE DEFAULt NULL,
  `side_effects_abdominal_pain_v_date` DATE DEFAULT NULL,
  `side_effects_anemia_v_date` DATE DEFAULT NULL,
  `side_effects_anorexia_v_date` DATE DEFAULT NULL,
  `side_effects_blurry_vision_v_date` DATE DEFAULT NULL,
  `side_effects_cough_v_date` DATE DEFAULT NULL,
  `side_effects_diarrhea_v_date` DATE DEFAULT NULL,
  `side_effects_diziness_v_date` DATE DEFAULT NULL,
  `side_effects_fever_v_date` DATE DEFAULT NULL,
  `side_effects_hepatitis_v_date` DATE DEFAULT NULL,
  `side_effects_jaundice_v_date` DATE DEFAULT NULL,
  `side_effects_kidney_failure_v_date` DATE DEFAULT NULL,
  `side_effects_lactic_acidosis_v_date` DATE DEFAULT NULL,
  `side_effects_leg_pain_numbness_v_date` DATE DEFAULT NULL,
  `side_effects_lipodystrophy_v_date` DATE DEFAULT NULL,
  `side_effects_no_v_date` DATE DEFAULT NULL,
  `side_effects_other_v_date` DATE DEFAULT NULL,
  `side_effects_peripheral_neuropathy_v_date` DATE DEFAULT NULL,
  `side_effects_psychosis_v_date` DATE DEFAULT NULL,
  `side_effects_renal_failure_v_date` DATE DEFAULT NULL,
  `side_effects_skin_rash_v_date` DATE DEFAULT NULL,
  `side_effects_vomiting_v_date` DATE DEFAULT NULL,
  `side_effects_gynaecomastia_v_date` DATE DEFAULT NULL,
  `side_effects_nightmares_v_date` DATE DEFAULT NULL,
  `drug_induced_abdominal_pain_v_date` DATE DEFAULT NULL,
  `drug_induced_anemia_v_date` DATE DEFAULT NULL,
  `drug_induced_anorexia_v_date` DATE DEFAULT NULL,
  `drug_induced_blurry_vision_v_date` DATE DEFAULT NULL,
  `drug_induced_cough_v_date` DATE DEFAULT NULL,
  `drug_induced_diarrhea_v_date` DATE DEFAULT NULL,
  `drug_induced_diziness_v_date` DATE DEFAULT NULL,
  `drug_induced_fever_v_date` DATE DEFAULT NULL,
  `drug_induced_gynaecomastia_v_date` DATE DEFAULT NULL,
  `drug_induced_hepatitis_v_date` DATE DEFAULT NULL,
  `drug_induced_jaundice_v_date` DATE DEFAULT NULL,
  `drug_induced_kidney_failure_v_date` DATE DEFAULT NULL,
  `drug_induced_lactic_acidosis_v_date` DATE DEFAULT NULL,
  `drug_induced_leg_pain_numbness_v_date` DATE DEFAULT NULL,
  `drug_induced_lipodystrophy_v_date` DATE DEFAULT NULL,
  `drug_induced_no_v_date` DATE DEFAULT NULL,
  `drug_induced_other_v_date` DATE DEFAULT NULL,
  `drug_induced_peripheral_neuropathy_v_date` DATE DEFAULT NULL,
  `drug_induced_psychosis_v_date` DATE DEFAULT NULL,
  `drug_induced_renal_failure_v_date` DATE DEFAULT NULL,
  `drug_induced_skin_rash_v_date` DATE DEFAULT NULL,
  `drug_induced_vomiting_v_date` DATE DEFAULT NULL,
  `prescribe_arvs_v_date` DATE DEFAULT NULL,
  `prescribe_ipt_v_date` DATE DEFAULT NULL,
  `allergic_to_sulphur_v_date` DATE DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`patient_id`, `visit_date`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-02-01 16:54:00
