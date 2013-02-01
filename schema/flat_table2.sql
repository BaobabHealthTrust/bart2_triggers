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
  `pregnant_yes` varchar(255) DEFAULT NULL,
  `pregnant_no` varchar(255) DEFAULT NULL,
  `breastfeeding_yes` varchar(255) DEFAULT NULL,
  `breastfeeding_no` varchar(255) DEFAULT NULL,
  `currently_using_family_planning_method_yes` varchar(255) DEFAULT NULL,
  `currently_using_family_planning_method_no` varchar(255) DEFAULT NULL,
  `family_planning_method_oral_contraceptive_pills` varchar(255) DEFAULT NULL,
  `family_planning_method_depo_provera` varchar(255) DEFAULT NULL,
  `family_planning_method_intrauterine_contraception` varchar(255) DEFAULT NULL,
  `family_planning_method_contraceptive_implant` varchar(255) DEFAULT NULL,
  `family_planning_method_male_condoms` varchar(255) DEFAULT NULL,
  `family_planning_method_female_condoms` varchar(255) DEFAULT NULL,
  `family_planning_method__rythm_method` varchar(255) DEFAULT NULL,
  `family_planning_method_withdrawal` varchar(255) DEFAULT NULL,
  `family_planning_method_absitenence` varchar(255) DEFAULT NULL,
  `family_planning_method_tubal_ligation` varchar(255) DEFAULT NULL,
  `family_planning_method_vasecotomy` varchar(255) DEFAULT NULL,
  `family_planning_method_emergency__contraception` varchar(255) DEFAULT NULL,
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
  `side_effects_peripheral_neuropathy` varchar(255) DEFAULT NULL,
  `side_effects_hepatitis` varchar(255) DEFAULT NULL,
  `side_effects_skin_rash` varchar(255) DEFAULT NULL,
  `side_effects_lipodystrophy` varchar(255) DEFAULT NULL,
  `side_effects_other` varchar(255) DEFAULT NULL,
  `drug_induced_abdominal_pain` varchar(255) DEFAULT NULL,
  `drug_induced_anorexia` varchar(255) DEFAULT NULL,
  `drug_induced_diarrhea` varchar(255) DEFAULT NULL,
  `drug_induced_jaundice` varchar(255) DEFAULT NULL,
  `drug_induced_leg_pain_numbness` varchar(255) DEFAULT NULL,
  `drug_induced_vomiting` varchar(255) DEFAULT NULL,
  `drug_induced_peripheral_neuropathy` varchar(255) DEFAULT NULL,
  `drug_induced_hepatitis` varchar(255) DEFAULT NULL,
  `drug_induced_anemia` varchar(255) DEFAULT NULL,
  `drug_induced_lactic_acidosis` varchar(255) DEFAULT NULL,
  `drug_induced_lipodystrophy` varchar(255) DEFAULT NULL,
  `drug_induced_skin_rash` varchar(255) DEFAULT NULL,
  `drug_induced_other_symptom` varchar(255) DEFAULT NULL,
  `drug_induced_fever` varchar(255) DEFAULT NULL,
  `drug_induced_cough` varchar(255) DEFAULT NULL,
  `routine_tb_screening_fever` varchar(255) DEFAULT NULL,
  `routine_tb_screening_night_sweats` varchar(255) DEFAULT NULL,
  `routine_tb_screening_cough_of_any_duration` varchar(255) DEFAULT NULL,
  `routine_tb_screening_weight_loss_failure_to_thrive_malnutrition` varchar(255) DEFAULT NULL,
  `tb_status_tb_not_suspected` varchar(255) DEFAULT NULL,
  `tb_status_tb_suspected` varchar(255) DEFAULT NULL,
  `tb_status_confirmed_tb_not_on_treatment` varchar(255) DEFAULT NULL,
  `tb_status_confirmed_tb_on_treatment` varchar(255) DEFAULT NULL,
  `tb_status_unknown` varchar(255) DEFAULT NULL,
  `allergic_to_sulphur_yes` varchar(255) DEFAULT NULL,
  `allergic_to_sulphur_no` varchar(255) DEFAULT NULL,
  `Weight` varchar(255) DEFAULT NULL,
  `Height` varchar(255) DEFAULT NULL,
  `Temperature` varchar(255) DEFAULT NULL,
  `BMI` varchar(255) DEFAULT NULL,
  `systolic_blood_pressure` varchar(255) DEFAULT NULL,
  `diastolic_blood_pressure` varchar(255) DEFAULT NULL,
  `weight_for_height` varchar(255) DEFAULT NULL,
  `weight_for_age` varchar(255) DEFAULT NULL,
  `height_for_age` varchar(255) DEFAULT NULL,
  `patient_program` varchar(255) DEFAULT NULL,
  `prescribe_arvs` varchar(255) DEFAULT NULL,
  `continue_existing_regimen?` varchar(255) DEFAULT NULL,
  `regimen_concept_id__art_regimen` varchar(255) DEFAULT NULL,
  `regimen_fomulation_and_dosages_` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `cpt_given` varchar(255) DEFAULT NULL,
  `ipt_given` varchar(255) DEFAULT NULL,
  `allergic_to_sulphur` varchar(255) DEFAULT NULL,
  `refer_to_sulphur` varchar(255) DEFAULT NULL,
  `transfer_out_location` varchar(255) DEFAULT NULL,
  `transfer_within_responsibility` varchar(255) DEFAULT NULL,
  `current_state` varchar(255) DEFAULT NULL,
  `initial_start_date` varchar(255) DEFAULT NULL,
  `condoms` varchar(255) DEFAULT NULL,
  `drug_name_other1` varchar(255) DEFAULT NULL,
  `drug_formulation_other1` varchar(255) DEFAULT NULL,
  `drug_duration_other1` varchar(255) DEFAULT NULL,
  `drug_name_other2` varchar(255) DEFAULT NULL,
  `drug_formulation_other2` varchar(255) DEFAULT NULL,
  `drug_duration_other2` varchar(255) DEFAULT NULL,
  `drug_name1` varchar(255) DEFAULT NULL,
  `dispensed_quantity1` varchar(255) DEFAULT NULL,
  `drug_name2` varchar(255) DEFAULT NULL,
  `dispensed_quantity2` varchar(255) DEFAULT NULL,
  `drug_name3` varchar(255) DEFAULT NULL,
  `dispensed_quantity3` varchar(255) DEFAULT NULL,
  `drug_name4` varchar(255) DEFAULT NULL,
  `dispensed_quantity4` varchar(255) DEFAULT NULL,
  `drug_name5` varchar(255) DEFAULT NULL,
  `dispensed_quantity` varchar(255) DEFAULT NULL,
  `amount_of_drug1_brought_to_clinic` varchar(255) DEFAULT NULL,
  `amount_of_drug1_remaining_at_home` varchar(255) DEFAULT NULL,
  `what_was_the_patient_adherence_for_this_drug1` varchar(255) DEFAULT NULL,
  `missed_hiv_drug_construct1` varchar(255) DEFAULT NULL,
  `amount_of_drug2_brought_to_clinic` varchar(255) DEFAULT NULL,
  `amount_of_drug2_remaining_at_home` varchar(255) DEFAULT NULL,
  `what_was_the_patient_adherence_for_this_drug2` varchar(255) DEFAULT NULL,
  `missed_hiv_drug_construct2` varchar(255) DEFAULT NULL,
  `amount_of_drug3_brought_to_clinic` varchar(255) DEFAULT NULL,
  `amount_of_drug3_left_at_home` varchar(255) DEFAULT NULL,
  `what_was_the_patient_adherence_for_this_drug3` varchar(255) DEFAULT NULL,
  `missed_hiv_drug_construct3` varchar(255) DEFAULT NULL,
  `amount_of_drug4_brought_to_clinic` varchar(255) DEFAULT NULL,
  `amount_of_drug4_remaining_at_home` varchar(255) DEFAULT NULL,
  `what_was_the_patient_adherence_for_this_drug4` varchar(255) DEFAULT NULL,
  `missed_hiv_drug_construct4` varchar(255) DEFAULT NULL,
  `current_program1` varchar(255) DEFAULT NULL,
  `current_program1_initial_state` varchar(255) DEFAULT NULL,
  `current_program1_location` varchar(255) DEFAULT NULL,
  `current_program1_initial_start_date` varchar(255) DEFAULT NULL,
  `current_program1_workflow` varchar(255) DEFAULT NULL,
  `guardian_present` varchar(255) DEFAULT NULL,
  `guardian_patient_id` varchar(255) DEFAULT NULL,
  `guardian_first_name` varchar(255) DEFAULT NULL,
  `guardian_last_name` varchar(255) DEFAULT NULL,
  `guardian_gender` varchar(255) DEFAULT NULL,
  `patient_present` varchar(255) DEFAULT NULL,
  `appointment_date` varchar(255) DEFAULT NULL,
  `voided` varchar(255) DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `date_voided` varchar(255) DEFAULT NULL,
  `voided_by` varchar(255) DEFAULT NULL,
  `date_created` varchar(255) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
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
