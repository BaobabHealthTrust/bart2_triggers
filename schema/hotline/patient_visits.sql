-- MySQL dump 10.13  Distrib 5.5.29, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: hotline
-- ------------------------------------------------------
-- Server version	5.5.29-0ubuntu0.12.04.2

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
-- Table structure for table `patient_visits
--

DROP TABLE IF EXISTS `patient_visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_visits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `visit_date` date DEFAULT NULL,
  `call_id` varchar(255) DEFAULT NULL,
  `pregnancy_status` varchar(255) DEFAULT NULL,
  `pregnancy_due_date` varchar(255) DEFAULT NULL,
  `estimated_date_of_delivery` varchar(255) DEFAULT NULL,
  `pregnancy_status_delivery_date` varchar(255) DEFAULT NULL,
  `skin_dryness` varchar(10) DEFAULT NULL,
  `fever_of_7_days_or_more` varchar(10) DEFAULT NULL,
  `diarrhea_for_14_days_or_more` varchar(10) DEFAULT NULL,
  `blood_in_stool` varchar(10) DEFAULT NULL,
  `cough_for_21_days_or_more` varchar(10) DEFAULT NULL,
  `not_eating_or_drinking_anything` varchar(10) DEFAULT NULL,
  `red_eye_for_4_days_or_more_with_visual_problems` varchar(10) DEFAULT NULL,
  `potential_chest_indrawing` varchar(10) DEFAULT NULL,
  `heavy_vaginal_bleeding_during_pregnancy` varchar(10) DEFAULT NULL,
  `excessive_postnatal_bleeding` varchar(10) DEFAULT NULL,
  `severe_headache` varchar(10) DEFAULT NULL,
  `very_sleepy_or_unconscious` varchar(10) DEFAULT NULL,
  `convulsions_sign` varchar(10) DEFAULT NULL,
  `vomiting_everything` varchar(10) DEFAULT NULL,
  `fever_during_pregnancy_sign` varchar(10) DEFAULT NULL,
  `postnatal_fever_sign` varchar(10) DEFAULT NULL,
  `fits_or_convulsions_sign` varchar(10) DEFAULT NULL,
  `swollen_hanor_feet_sign` varchar(10) DEFAULT NULL,
  `paleness_of_the_skin_and_tiredness_sign` varchar(10) DEFAULT NULL,
  `no_fetal_movements_sign` varchar(10) DEFAULT NULL,
  `water_breaks_sign` varchar(10) DEFAULT NULL,
  `visual_problems` varchar(10) DEFAULT NULL,
  `diarrhea` varchar(10) DEFAULT NULL,
  `cough` varchar(10) DEFAULT NULL,
  `tachypnea` varchar(10) DEFAULT NULL,
  `eye_infection` varchar(10) DEFAULT NULL,
  `fever` varchar(10) DEFAULT NULL,
  `vomiting` varchar(10) DEFAULT NULL,
  `vaginal_bleeding_during_pregnancy` varchar(10) DEFAULT NULL,
  `postnatal_bleeding` varchar(10) DEFAULT NULL,
  `Not_eating` varchar(10) DEFAULT NULL,
  `Very sleepy` varchar(10) DEFAULT NULL,
  `unconscious` varchar(10) DEFAULT NULL,
  `convulsions_symptom` varchar(10) DEFAULT NULL,
  `fever_during_pregnancy_symptom` varchar(10) DEFAULT NULL,
  `postnatal_fever_symptom` varchar(10) DEFAULT NULL,
  `headaches` varchar(10) DEFAULT NULL,
  `fits_or_convulsions_symptom` varchar(10) DEFAULT NULL,
  `swollen_hands_or_feet_symptom` varchar(10) DEFAULT NULL,
  `paleness_of_the_skin_and_tiredness_symptom` varchar(10) DEFAULT NULL,
  `no_fetal_movements_symptom` varchar(10) DEFAULT NULL,
  `Water_breaks_symptom` varchar(10) DEFAULT NULL,
  `gained_or_lost_weight` varchar(10) DEFAULT NULL,
  `family_planning` varchar(10) DEFAULT NULL,
  `crying` varchar(10) DEFAULT NULL,
  `sleeping` varchar(10) DEFAULT NULL,
  `feeding_problems` varchar(10) DEFAULT NULL,
  `bowel_movements` varchar(10) DEFAULT NULL,
  `skin_infections` varchar(10) DEFAULT NULL,
  `umbilicus_infection` varchar(10) DEFAULT NULL,
  `growth_milestones` varchar(10) DEFAULT NULL,
  `accessing_healthcare_services` varchar(10) DEFAULT NULL,
  `healthcare_visits` varchar(10) DEFAULT NULL,
  `nutrition` varchar(10) DEFAULT NULL,
  `body_changes` varchar(10) DEFAULT NULL,
  `discomfort` varchar(10) DEFAULT NULL,
  `concerns` varchar(10) DEFAULT NULL,
  `emotions` varchar(10) DEFAULT NULL,
  `warning_signs` varchar(10) DEFAULT NULL,
  `routines` varchar(10) DEFAULT NULL,
  `beliefs` varchar(10) DEFAULT NULL,
  `babys_growth` varchar(10) DEFAULT NULL,
  `milestones` varchar(10) DEFAULT NULL,
  `revention` varchar(10) DEFAULT NULL,
  `skin_rashes` varchar(10) DEFAULT NULL,
  `outcome` varchar(255) DEFAULT NULL,
  `healthy_facility_name` varchar(255) DEFAULT NULL,
  `reason_for_referral` varchar(255) DEFAULT NULL,
  `secondary_outcome` varchar(255) DEFAULT NULL,
  `tips_telephone_number` varchar(255) DEFAULT NULL,
  `tips_telephone_number_type` varchar(255) DEFAULT NULL,
  `on_tips_and_reminders_program` varchar(255) DEFAULT NULL,
  `tips_language_preference` varchar(255) DEFAULT NULL,
  `tips_type_of_message` varchar(255) DEFAULT NULL,
  `tips_type_of_message_content` varchar(255) DEFAULT NULL,
  `birth_plan_delivery_location` varchar(255) DEFAULT NULL,
  `birth_plan_go_to_hospital_date` date DEFAULT NULL,
  `birth_plan` varchar(255) DEFAULT NULL,
  `antenatal_clinic_patient_appointment` varchar(255) DEFAULT NULL,
  `last_ANC_visit_date` date DEFAULT NULL,
  `next_ANC_visit_date` date DEFAULT NULL,
  `baby_delivered` varchar(255) DEFAULT NULL,
  `baby_delivered_health_facility_name` varchar(255) DEFAULT NULL,
  `baby_delivered_delivery_date` date DEFAULT NULL,
  `baby_delivered_delivery_location` varchar(255) DEFAULT NULL,
  `last_menstrual_period_date` date DEFAULT NULL,
  `purpose_of_call` varchar(255) DEFAULT NULL,
  `purpose_of_call_enc_id` int(11) DEFAULT NULL,
  `last_menstrual_period_date_enc_id` int(11) DEFAULT NULL,
  `call_id_enc_id` int(11) DEFAULT NULL,
  `pregnancy_due_date_enc_id` int(11) DEFAULT NULL,
  `pregnancy_status_enc_id` int(11) DEFAULT NULL,
  `estimated_date_of_delivery_enc_id` int(11) DEFAULT NULL,
  `skin_dryness_enc_id` INT(10) DEFAULT NULL,
  `fever_of_7_days_or_more_enc_id` INT(10) DEFAULT NULL,
  `diarrhea_for_14_days_or_more_enc_id` INT(10) DEFAULT NULL,
  `blood_in_stool_enc_id` INT(10) DEFAULT NULL,
  `cough_for_21_days_or_more_enc_id` INT(10) DEFAULT NULL,
  `not_eating_or_drinking_anything_enc_id` INT(10) DEFAULT NULL,
  `red_eye_for_4_days_or_more_with_visual_problems_enc_id` INT(10) DEFAULT NULL,
  `potential_chest_indrawing_enc_id` INT(10) DEFAULT NULL,
  `heavy_vaginal_bleeding_during_pregnancy_enc_id` INT(10) DEFAULT NULL,
  `excessive_postnatal_bleeding_enc_id` INT(10) DEFAULT NULL,
  `severe_headache_enc_id` INT(10) DEFAULT NULL,
  `very_sleepy_or_unconscious_enc_id` INT(10) DEFAULT NULL,
  `convulsions_sign_enc_id` INT(10) DEFAULT NULL,
  `vomiting_everything_enc_id` INT(10) DEFAULT NULL,
  `fever_during_pregnancy_sign_enc_id` INT(10) DEFAULT NULL,
  `postnatal_fever_sign_enc_id` INT(10) DEFAULT NULL,
  `fits_or_convulsions_sign_enc_id` INT(10) DEFAULT NULL,
  `swollen_hanor_feet_sign_enc_id` INT(10) DEFAULT NULL,
  `paleness_of_the_skin_and_tiredness_sign_enc_id` INT(10) DEFAULT NULL,
  `no_fetal_movements_sign_enc_id` INT(10) DEFAULT NULL,
  `water_breaks_sign_enc_id` INT(10) DEFAULT NULL,
  `visual_problems_enc_id` INT(10) DEFAULT NULL,
  `diarrhea_enc_id` INT(10) DEFAULT NULL,
  `cough_enc_id` INT(10) DEFAULT NULL,
  `tachypnea_enc_id` INT(10) DEFAULT NULL,
  `eye_infection_enc_id` INT(10) DEFAULT NULL,
  `fever_enc_id` INT(10) DEFAULT NULL,
  `vomiting_enc_id` INT(10) DEFAULT NULL,
  `vaginal_bleeding_during_pregnancy_enc_id` INT(10) DEFAULT NULL,
  `postnatal_bleeding_enc_id` INT(10) DEFAULT NULL,
  `Not_eating_enc_id` INT(10) DEFAULT NULL,
  `Very sleepy_enc_id` INT(10) DEFAULT NULL,
  `unconscious_enc_id` INT(10) DEFAULT NULL,
  `convulsions_symptom_enc_id` INT(10) DEFAULT NULL,
  `fever_during_pregnancy_symptom_enc_id` INT(10) DEFAULT NULL,
  `postnatal_fever_symptom_enc_id` INT(10) DEFAULT NULL,
  `headaches_enc_id` INT(10) DEFAULT NULL,
  `fits_or_convulsions_symptom_enc_id` INT(10) DEFAULT NULL,
  `swollen_hands_or_feet_symptom_enc_id` INT(10) DEFAULT NULL,
  `paleness_of_the_skin_and_tiredness_symptom_enc_id` INT(10) DEFAULT NULL,
  `no_fetal_movements_symptom_enc_id` INT(10) DEFAULT NULL,
  `Water_breaks_symptom_enc_id` INT(10) DEFAULT NULL,
  `gained_or_lost_weight_enc_id` INT(10) DEFAULT NULL,
  `family_planning_enc_id` INT(10) DEFAULT NULL,
  `crying_enc_id` INT(10) DEFAULT NULL,
  `sleeping_enc_id` INT(10) DEFAULT NULL,
  `feeding_problems_enc_id` INT(10) DEFAULT NULL,
  `bowel_movements_enc_id` INT(10) DEFAULT NULL,
  `skin_infections_enc_id` INT(10) DEFAULT NULL,
  `umbilicus_infection_enc_id` INT(10) DEFAULT NULL,
  `growth_milestones_enc_id` INT(10) DEFAULT NULL,
  `accessing_healthcare_services_enc_id` INT(10) DEFAULT NULL,
  `healthcare_visits_enc_id` INT(10) DEFAULT NULL,
  `nutrition_enc_id` INT(10) DEFAULT NULL,
  `body_changes_enc_id` INT(10) DEFAULT NULL,
  `discomfort_enc_id` INT(10) DEFAULT NULL,
  `concerns_enc_id` INT(10) DEFAULT NULL,
  `emotions_enc_id` INT(10) DEFAULT NULL,
  `warning_signs_enc_id` INT(10) DEFAULT NULL,
  `routines_enc_id` INT(10) DEFAULT NULL,
  `beliefs_enc_id` INT(10) DEFAULT NULL,
  `babys_growth_enc_id` INT(10) DEFAULT NULL,
  `milestones_enc_id` INT(10) DEFAULT NULL,
  `revention_enc_id` INT(10) DEFAULT NULL,
  `skin_rashes_enc_id` INT(10) DEFAULT NULL,
  `outcome_enc_id` int(11) DEFAULT NULL,
  `healthy_facility_name_enc_id` int(11) DEFAULT NULL,
  `reason_for_referral_enc_id` int(11) DEFAULT NULL,
  `secondary_outcome_enc_id` int(11) DEFAULT NULL,
  `tips_telephone_number_enc_id` int(11) DEFAULT NULL,
  `tips_telephone_number_type_enc_id` int(11) DEFAULT NULL,
  `on_tips_and_reminders_program_enc_id` int(11) DEFAULT NULL,
  `tips_language_preference_enc_id` int(11) DEFAULT NULL,
  `tips_type_of_message_enc_id` int(11) DEFAULT NULL,
  `tips_type_of_message_content_enc_id` int(11) DEFAULT NULL,
  `birth_plan_go_to_hospital_date_enc_id` int(11) DEFAULT NULL,
  `birth_plan_enc_id` int(11) DEFAULT NULL,
  `antenatal_clinic_patient_appointment_enc_id` int(11) DEFAULT NULL,
  `last_ANC_visit_date_enc_id` int(11) DEFAULT NULL,
  `next_ANC_visit_date_enc_id` int(11) DEFAULT NULL,
  `baby_delivered_enc_id` int(11) DEFAULT NULL,
  `baby_delivered_health_facility_name_enc_id` int(11) DEFAULT NULL,
  `baby_delivered_delivery_date_enc_id` int(11) DEFAULT NULL,
  `baby_delivered_delivery_location_enc_id` int(11) DEFAULT NULL,
  `birth_plan_delivery_location_enc_id` int(11) DEFAULT NULL,
  `pregnancy_status_delivery_date_enc_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID_UNIQUE` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_visits`
--

LOCK TABLES `patient_visits` WRITE;
/*!40000 ALTER TABLE `patient_visits` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_visits` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-03-26 11:22:11
