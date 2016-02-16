DELIMITER $$

DROP PROCEDURE IF EXISTS `proc_hotline_update_other_field`$$

CREATE PROCEDURE `proc_hotline_update_other_field`(
  IN in_patient_id INT,
  IN in_visit_date DATE,
  IN in_field_concept INT,
  IN in_field_text VARCHAR(255),
  IN in_field_value_coded INT,
  IN in_field_value_coded_name_id INT,
  IN in_field_value_numeric INT,
  IN in_field_value_datetime DATE,
  IN in_visit_id INT,
  IN in_field_voided INT,
  IN encounter_id INT
)

BEGIN

  SET @call_id = (SELECT concept_name.concept_id FROM concept_name concept_name
                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                     WHERE name = "Call Id" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @pregnancy_status = (SELECT concept_name.concept_id FROM concept_name
                   LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                  WHERE name = "Pregnancy Status" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @estimated_date_of_delivery = (SELECT concept_name.concept_id FROM concept_name
                   LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                WHERE name = "Expected due date" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @pregnancy_due_date = (SELECT concept_name.concept_id FROM concept_name
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                  WHERE name = "Pregnancy due date" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @danger_signs = (SELECT concept_name.concept_id FROM concept_name concept_name
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                        WHERE name = "Danger sign" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @health_symptoms = (SELECT concept_name.concept_id FROM concept_name concept_name
                            LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                          WHERE name = "Health symptom" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @health_information = (SELECT concept_name.concept_id FROM concept_name concept_name
                              LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                             WHERE name = "Health information" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @outcome = (SELECT concept_name.concept_id FROM concept_name concept_name
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                  WHERE name = "Outcome" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @healthy_facility_name = (SELECT concept_name.concept_id FROM concept_name concept_name
                                  LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                WHERE name = "Health facility name" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @reason_for_referral = (SELECT concept_name.concept_id FROM concept_name concept_name
                                LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                              WHERE name = "Reason for referral" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @secondary_outcome = (SELECT concept_name.concept_id FROM concept_name concept_name
                              LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                            WHERE name = "Secondary Outcome" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @tips_telephone_number = (SELECT concept_name.concept_id FROM concept_name concept_name
                                  LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                WHERE name = "Telephone number" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @tips_telephone_number_type = (SELECT concept_name.concept_id FROM concept_name concept_name
                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                    WHERE name = "Telephone number type" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @on_tips_and_reminders_program = (SELECT concept_name.concept_id FROM concept_name concept_name
                                          LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                        WHERE name = "On tips and reminders program" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @tips_language_preference = (SELECT concept_name.concept_id FROM concept_name concept_name
                                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                   WHERE name = "Language preference" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @tips_type_of_message = (SELECT concept_name.concept_id FROM concept_name concept_name
                                LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                               WHERE name = "Type of message" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @tips_type_of_message_content = (SELECT concept_name.concept_id FROM concept_name concept_name
                                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                       WHERE name = "Type of message content" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @birth_plan_go_to_hospital_date = (SELECT concept_name.concept_id FROM concept_name concept_name
                                          LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                        WHERE name = "Go to hospital datem" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @birth_plan = (SELECT concept_name.concept_id FROM concept_name concept_name
                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                     WHERE name = "Birth plan" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @antenatal_clinic_patient_appointment = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                              WHERE name = "Antenatal clinic patient appointment" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @last_ANC_visit_date = (SELECT concept_name.concept_id FROM concept_name concept_name
                                LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                              WHERE name = "Last ANC Visit Date" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @next_ANC_visit_date = (SELECT concept_name.concept_id FROM concept_name concept_name
                                LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                              WHERE name = "Last ANC Visit Date" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @baby_delivered = (SELECT concept_name.concept_id FROM concept_name concept_name
                          LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                        WHERE name = "Delivered" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @baby_delivered_health_facility_name = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                              WHERE name = "Health facility name" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @baby_delivered_delivery_date = (SELECT concept_name.concept_id FROM concept_name concept_name
                                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                      WHERE name = "Delivery date" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @baby_delivered_delivery_location = (SELECT concept_name.concept_id FROM concept_name concept_name
                                            LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                           WHERE name = "Delivery location" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @birth_plan_delivery_location = (SELECT concept_name.concept_id FROM concept_name concept_name
                                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                      WHERE name = "Delivery location" AND voided = 0 AND retired = 0 LIMIT 1);

	CASE in_field_concept
    WHEN @call_id THEN
      UPDATE patient_visits SET call_id = NULL, call_id_enc_id = NULL WHERE patient_visits.patient_id = in_patient_id;

    WHEN @pregnancy_status THEN
      UPDATE patient_visits SET pregnancy_status = NULL, pregnancy_status_enc_id = NULL WHERE patient_visits.patient_id = in_patient_id;

    WHEN @pregnancy_status THEN
        UPDATE patient_visits SET estimated_date_of_delivery = NULL, estimated_date_of_delivery_enc_id = NULL WHERE patient_visits.patient_id = in_patient_id;

    WHEN @pregnancy_status_delivery_date THEN
      UPDATE patient_visits SET pregnancy_status_delivery_date = NULL, pregnancy_status_delivery_date_enc_id = NULL
      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.pregnancy_status_delivery_date_enc_id = OLD.encounter_id;

    WHEN @danger_signs THEN
      UPDATE patient_visits SET danger_signs = NULL, danger_signs_enc_id = NULL
      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.danger_signs_enc_id = OLD.encounter_id;

    WHEN @health_symptoms THEN
      UPDATE patient_visits SET health_symptoms = NULL, health_symptoms_enc_id = NULL
      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.health_symptoms_enc_id = OLD.encounter_id;

    WHEN @health_information THEN
      UPDATE patient_visits SET health_information = NULL, health_information_enc_id = NULL
      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.health_information_enc_id = OLD.encounter_id;

    WHEN @outcome THEN
      UPDATE patient_visits SET outcome = NULL, outcome_enc_id = NULL
      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.outcome_enc_id = OLD.encounter_id;

    WHEN @healthy_facility_name THEN
      UPDATE patient_visits SET healthy_facility_name = NULL, healthy_facility_name_enc_id = NULL
      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.healthy_facility_name_enc_id = OLD.encounter_id;

    WHEN @reason_for_referral THEN
      UPDATE patient_visits SET reason_for_referral = NULL, reason_for_referral_enc_id = NULL
      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.reason_for_referral_enc_id = OLD.encounter_id;

    WHEN @secondary_outcome THEN
      UPDATE patient_visits SET secondary_outcome = NULL, secondary_outcome_enc_id = NULL
      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.secondary_outcome_enc_id = OLD.encounter_id;

    WHEN @tips_telephone_number THEN
      UPDATE patient_visits SET tips_telephone_number = NULL, tips_telephone_number_enc_id = NULL
      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.tips_telephone_number_enc_id = OLD.encounter_id;

    WHEN @tips_telephone_number_type THEN
      UPDATE patient_visits SET tips_telephone_number_type = NULL, tips_telephone_number_type_enc_id = NULL
      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.tips_telephone_number_type_enc_id = OLD.encounter_id;

    WHEN @on_tips_and_reminders_program THEN
      UPDATE patient_visits SET on_tips_and_reminders_program = NULL, on_tips_and_reminders_program_enc_id = NULL
      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.on_tips_and_reminders_program_enc_id = OLD.encounter_id;

    WHEN @tips_language_preference THEN
      UPDATE patient_visits SET tips_language_preference = NULL, tips_language_preference_enc_id = NULL
      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.tips_language_preference_enc_id = OLD.encounter_id;

    WHEN @tips_type_of_message THEN
      UPDATE patient_visits SET tips_type_of_message = NULL, tips_type_of_message_enc_id = NULL
      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.tips_type_of_message_enc_id = OLD.encounter_id;

    WHEN @tips_type_of_message_content THEN
      UPDATE patient_visits SET tips_type_of_message_content = NULL, tips_type_of_message_content_enc_id = NULL
      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.tips_type_of_message_content_enc_id = OLD.encounter_id;

    WHEN @birth_plan_delivery_location THEN
      UPDATE patient_visits SET birth_plan_delivery_location = NULL, pregnancy_status_delivery_date_enc_id = NULL
      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.birth_plan_delivery_location_enc_id = OLD.encounter_id;

    WHEN @birth_plan_go_to_hospital_date THEN
      UPDATE patient_visits SET birth_plan_go_to_hospital_date = NULL, birth_plan_go_to_hospital_date_enc_id = NULL
      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.birth_plan_go_to_hospital_date_enc_id = OLD.encounter_id;

    WHEN @birth_plan THEN
      UPDATE patient_visits SET birth_plan = NULL, birth_plan_enc_id = NULL
      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.birth_plan_enc_id = OLD.encounter_id;

    WHEN @antenatal_clinic_patient_appointment THEN
      UPDATE patient_visits SET antenatal_clinic_patient_appointment = NULL, antenatal_clinic_patient_appointment_enc_id = NULL
      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.antenatal_clinic_patient_appointment_enc_id = OLD.encounter_id;

    WHEN @last_ANC_visit_date THEN
      UPDATE patient_visits SET last_ANC_visit_date = NULL, pregnancy_status_delivery_date_enc_id = NULL
      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.last_ANC_visit_date_enc_id = OLD.encounter_id;

    WHEN @next_ANC_visit_date THEN
      UPDATE patient_visits SET next_ANC_visit_date = NULL, next_ANC_visit_date_enc_id = NULL
      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.next_ANC_visit_date_enc_id = OLD.encounter_id;

    WHEN @baby_delivered THEN
      UPDATE patient_visits SET baby_delivered = NULL, baby_delivered_enc_id = NULL
      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.baby_delivered_enc_id = OLD.encounter_id;

    WHEN @baby_delivered_health_facility_name THEN
      UPDATE patient_visits SET baby_delivered_health_facility_name = NULL, baby_delivered_health_facility_name_enc_id = NULL
      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.baby_delivered_health_facility_name_enc_id = OLD.encounter_id;

    WHEN @baby_delivered_delivery_date THEN
      UPDATE patient_visits SET baby_delivered_delivery_date = NULL, baby_delivered_delivery_date_enc_id = NULL
      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.baby_delivered_delivery_date_enc_id = OLD.encounter_id;

    WHEN @baby_delivered_delivery_location THEN
      UPDATE patient_visits SET baby_delivered_delivery_location = NULL, baby_delivered_delivery_location_enc_id = NULL
      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.baby_delivered_delivery_location_enc_id = OLD.encounter_id;

	ELSE
		SET @new = in_patient_id;
  END CASE;

END$$

DELIMITER ;
