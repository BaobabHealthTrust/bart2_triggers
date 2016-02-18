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
  `estimated_date_of_delivery` varchar(255) DEFAULT NULL,
  `pregnancy_status_delivery_date` varchar(255) DEFAULT NULL,
  `danger_sign1` varchar(255) DEFAULT NULL,
  `danger_sign2` varchar(255) DEFAULT NULL,
  `danger_sign3` varchar(255) DEFAULT NULL,
  `danger_sign4` varchar(255) DEFAULT NULL,
  `danger_sign5` varchar(255) DEFAULT NULL,
  `danger_sign6` varchar(255) DEFAULT NULL,
  `health_symptom1` varchar(255) DEFAULT NULL,
  `health_symptom2` varchar(255) DEFAULT NULL,
  `health_symptom3` varchar(255) DEFAULT NULL,
  `health_symptom4` varchar(255) DEFAULT NULL,
  `health_symptom5` varchar(255) DEFAULT NULL,
  `health_symptom6` varchar(255) DEFAULT NULL,
  `health_information1` varchar(255) DEFAULT NULL,
  `health_information2` varchar(255) DEFAULT NULL,
  `health_information3` varchar(255) DEFAULT NULL,
  `health_information4` varchar(255) DEFAULT NULL,
  `health_information5` varchar(255) DEFAULT NULL,
  `health_information6` varchar(255) DEFAULT NULL,
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
  `call_id_enc_id` int(11) DEFAULT NULL,
  `pregnancy_status_enc_id` int(11) DEFAULT NULL,
  `estimated_date_of_delivery_enc_id` int(11) DEFAULT NULL,
  `danger_sign_enc_id1` int(11) DEFAULT NULL,
  `danger_sign_enc_id2` int(11) DEFAULT NULL,
  `danger_sign_enc_id3` int(11) DEFAULT NULL,
  `danger_sign_enc_id4` int(11) DEFAULT NULL,
  `danger_sign_enc_id5` int(11) DEFAULT NULL,
  `danger_sign_enc_id6` int(11) DEFAULT NULL,
  `health_symptoms_enc_id1` int(11) DEFAULT NULL,
  `health_symptoms_enc_id2` int(11) DEFAULT NULL,
  `health_symptoms_enc_id3` int(11) DEFAULT NULL,
  `health_symptoms_enc_id4` int(11) DEFAULT NULL,
  `health_symptoms_enc_id5` int(11) DEFAULT NULL,
  `health_symptoms_enc_id6` int(11) DEFAULT NULL,
  `health_information_enc_id1` int(11) DEFAULT NULL,
  `health_information_enc_id2` int(11) DEFAULT NULL,
  `health_information_enc_id3` int(11) DEFAULT NULL,
  `health_information_enc_id4` int(11) DEFAULT NULL,
  `health_information_enc_id5` int(11) DEFAULT NULL,
  `health_information_enc_id6` int(11) DEFAULT NULL,
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
