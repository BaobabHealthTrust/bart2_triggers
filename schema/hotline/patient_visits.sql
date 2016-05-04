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
  `purpose_of_call` varchar(255) DEFAULT NULL,
  `pregnancy_status` varchar(255) DEFAULT NULL,
  `pregnancy_due_date` varchar(255) DEFAULT NULL,
  `last_menstrual_period_date` date DEFAULT NULL,
  `estimated_date_of_delivery` varchar(255) DEFAULT NULL,
  `pregnancy_status_delivery_date` varchar(255) DEFAULT NULL,
  `baby_delivered` varchar(255) DEFAULT NULL,
  `baby_delivered_health_facility_name` varchar(255) DEFAULT NULL,
  `baby_delivered_delivery_date` date DEFAULT NULL,
  `baby_delivered_delivery_location` varchar(255) DEFAULT NULL,
  `abdominal_pain_symptom` varchar(10) DEFAULT NULL,
  `fever_during_pregnancy_symptom` varchar(10) DEFAULT NULL,
  `fits_or_convulsions_symptom` varchar(10) DEFAULT NULL,
  `frequent_miscarriages_symptom` varchar(10) DEFAULT NULL,
  `headaches_symptom` varchar(10) DEFAULT NULL,
  `infertility_symptom` varchar(10) DEFAULT NULL,
  `no_fetal_movements_symptom` varchar(10) DEFAULT NULL,
  `paleness_of_the_skin_and_tiredness_symptom` varchar(10) DEFAULT NULL,
  `postnatal_bleeding_symptom` varchar(10) DEFAULT NULL,
  `postnatal_discharge_bad_smell_symptom` varchar(10) DEFAULT NULL,
  `postnatal_fever_symptom` varchar(10) DEFAULT NULL,
  `problems_with_family_planning_method_symptom` varchar(10) DEFAULT NULL,
  `problems_with_monthly_periods_symptom` varchar(10) DEFAULT NULL,
  `swollen_hands_or_feet_symptom` varchar(10) DEFAULT NULL,
  `vaginal_bleeding_during_pregnancy_symptom` varchar(10) DEFAULT NULL,
  `vaginal_bleeding_not_during_pregnancy_symptom` varchar(10) DEFAULT NULL,
  `vaginal_discharge_symptom` varchar(10) DEFAULT NULL,
  `vaginal_itching_symptom` varchar(10) DEFAULT NULL,
  `water_breaks_symptom` varchar(10) DEFAULT NULL,
  `babys_growth` varchar(10) DEFAULT NULL,
  `birth_planning_female` varchar(10) DEFAULT NULL,
  `birth_planning_male` varchar(10) DEFAULT NULL,
  `beliefs` varchar(10) DEFAULT NULL,
  `body_changes` varchar(10) DEFAULT NULL,
  `concerns` varchar(10) DEFAULT NULL,
  `discomfort` varchar(10) DEFAULT NULL,
  `emotions` varchar(10) DEFAULT NULL,
  `family_planning` varchar(10) DEFAULT NULL,
  `healthcare_visits` varchar(10) DEFAULT NULL,
  `milestones` varchar(10) DEFAULT NULL,
  `nutrition` varchar(10) DEFAULT NULL,
  `prevention` varchar(10) DEFAULT NULL,
  `routines` varchar(10) DEFAULT NULL,
  `warning_signs` varchar(10) DEFAULT NULL,
  `anemia_sign` varchar(255) DEFAULT NULL,
  `antenatal_care_sign` varchar(255) DEFAULT NULL,
  `excessive_postnatal_bleeding` varchar(10) DEFAULT NULL,
  `fever_during_pregnancy_sign` varchar(10) DEFAULT NULL,
  `fits_or_convulsions_sign` varchar(10) DEFAULT NULL,
  `heavy_vaginal_bleeding_during_pregnancy` varchar(10) DEFAULT NULL,
  `malaria_sign` varchar(255) DEFAULT NULL,
  `no_fetal_movements_sign` varchar(10) DEFAULT NULL,
  `paleness_of_the_skin_and_tiredness_sign` varchar(10) DEFAULT NULL,
  `postnatal_fever_sign` varchar(10) DEFAULT NULL,
  `severe_abdominal_pain_sign` varchar(255) DEFAULT NULL,
  `severe_headache` varchar(10) DEFAULT NULL,
  `swollen_hands_feet_and_face_sign` varchar(10) DEFAULT NULL,
  `water_breaks_sign` varchar(10) DEFAULT NULL,
  `general_outcome` varchar(255) DEFAULT NULL,
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
  `call_id_enc_id` INT(11) DEFAULT NULL,
  `pregnancy_status_enc_id` INT(11) DEFAULT NULL,
  `pregnancy_due_date_enc_id` INT(11) DEFAULT NULL,
  `estimated_date_of_delivery_enc_id` INT(11) DEFAULT NULL,
  `pregnancy_status_delivery_date_enc_id` INT(11) DEFAULT NULL,
  `abdominal_pain_symptom_enc_id` INT(11) DEFAULT NULL,
  `fever_during_pregnancy_symptom_enc_id` INT(11) DEFAULT NULL,
  `fits_or_convulsions_symptom_enc_id` INT(11) DEFAULT NULL,
  `frequent_miscarriages_symptom_enc_id` INT(11) DEFAULT NULL,
  `headaches_symptom_enc_id` INT(11) DEFAULT NULL,
  `infertility_symptom_enc_id` INT(11) DEFAULT NULL,
  `no_fetal_movements_symptom_enc_id` INT(11) DEFAULT NULL,
  `paleness_of_the_skin_and_tiredness_symptom_enc_id` INT(11) DEFAULT NULL,
  `postnatal_bleeding_symptom_enc_id` INT(11) DEFAULT NULL,
  `postnatal_discharge_bad_smell_symptom_enc_id` INT(11) DEFAULT NULL,
  `postnatal_fever_symptom_enc_id` INT(11) DEFAULT NULL,
  `problems_with_family_planning_method_symptom_enc_id` INT(11) DEFAULT NULL,
  `problems_with_monthly_periods_symptom_enc_id` INT(11) DEFAULT NULL,
  `swollen_hands_or_feet_symptom_enc_id` INT(11) DEFAULT NULL,
  `vaginal_bleeding_during_pregnancy_symptom_enc_id` INT(11) DEFAULT NULL,
  `vaginal_bleeding_not_during_pregnancy_symptom_enc_id` INT(11) DEFAULT NULL,
  `vaginal_discharge_symptom_enc_id` INT(11) DEFAULT NULL,
  `vaginal_itching_symptom_enc_id` INT(11) DEFAULT NULL,
  `water_breaks_symptom_enc_id` INT(11) DEFAULT NULL,
  `babys_growth_enc_id` INT(11) DEFAULT NULL,
  `birth_planning_female_enc_id` INT(11) DEFAULT NULL,
  `birth_planning_male_enc_id` INT(11) DEFAULT NULL,
  `beliefs_enc_id` INT(11) DEFAULT NULL,
  `body_changes_enc_id` INT(11) DEFAULT NULL,
  `concerns_enc_id` INT(11) DEFAULT NULL,
  `discomfort_enc_id` INT(11) DEFAULT NULL,
  `emotions_enc_id` INT(11) DEFAULT NULL,
  `family_planning_enc_id` INT(11) DEFAULT NULL,
  `healthcare_visits_enc_id` INT(11) DEFAULT NULL,
  `milestones_enc_id` INT(11) DEFAULT NULL,
  `nutrition_enc_id` INT(11) DEFAULT NULL,
  `prevention_enc_id` INT(11) DEFAULT NULL,
  `routines_enc_id` INT(11) DEFAULT NULL,
  `warning_signs_enc_id` INT(11) DEFAULT NULL,
  `anemia_sign_enc_id` INT(11) DEFAULT NULL,
  `antenatal_care_sign_enc_id` INT(11) DEFAULT NULL,
  `excessive_postnatal_bleeding_enc_id` INT(11) DEFAULT NULL,
  `fever_during_pregnancy_sign_enc_id` INT(11) DEFAULT NULL,
  `fits_or_convulsions_sign_enc_id` INT(11) DEFAULT NULL,
  `heavy_vaginal_bleeding_during_pregnancy_enc_id` INT(11) DEFAULT NULL,
  `malaria_sign_enc_id` INT(11) DEFAULT NULL,
  `no_fetal_movements_sign_enc_id` INT(11) DEFAULT NULL,
  `paleness_of_the_skin_and_tiredness_sign_enc_id` INT(11) DEFAULT NULL,
  `postnatal_fever_sign_enc_id` INT(11) DEFAULT NULL,
  `severe_abdominal_pain_sign_enc_id` INT(11) DEFAULT NULL,
  `severe_headache_enc_id` INT(11) DEFAULT NULL,
  `swollen_hands_feet_and_face_sign_enc_id` INT(11) DEFAULT NULL,
  `water_breaks_sign_enc_id` INT(11) DEFAULT NULL,
  `general_outcome_enc_id` INT(11) DEFAULT NULL,
  `healthy_facility_name_enc_id` INT(11) DEFAULT NULL,
  `reason_for_referral_enc_id` INT(11) DEFAULT NULL,
  `secondary_outcome_enc_id` INT(11) DEFAULT NULL,
  `tips_telephone_number_enc_id` INT(11) DEFAULT NULL,
  `tips_telephone_number_type_enc_id` INT(11) DEFAULT NULL,
  `on_tips_and_reminders_program_enc_id` INT(11) DEFAULT NULL,
  `tips_language_preference_enc_id` INT(11) DEFAULT NULL,
  `tips_type_of_message_enc_id` INT(11) DEFAULT NULL,
  `tips_type_of_message_content_enc_id` INT(11) DEFAULT NULL,
  `birth_plan_delivery_location_enc_id` INT(11) DEFAULT NULL,
  `birth_plan_go_to_hospital_date_enc_id` INT(11) DEFAULT NULL,
  `birth_plan_enc_id` INT(11) DEFAULT NULL,
  `antenatal_clinic_patient_appointment_enc_id` INT(11) DEFAULT NULL,
  `last_ANC_visit_date_enc_id` INT(11) DEFAULT NULL,
  `next_ANC_visit_date_enc_id` INT(11) DEFAULT NULL,
  `baby_delivered_enc_id` INT(11) DEFAULT NULL,
  `baby_delivered_health_facility_name_enc_id` INT(11) DEFAULT NULL,
  `baby_delivered_delivery_date_enc_id` INT(11) DEFAULT NULL,
  `baby_delivered_delivery_location_enc_id` INT(11) DEFAULT NULL,
  `last_menstrual_period_date_enc_id` INT(11) DEFAULT NULL,
  `purpose_of_call_enc_id` INT(11) DEFAULT NULL,
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
