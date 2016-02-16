DELIMITER $$

DROP PROCEDURE IF EXISTS `proc_insert_observations1`$$

CREATE PROCEDURE `proc_insert_observations1`(
    IN patient_id INT,
    IN value_date DATE,
    IN field_concept INT,
    IN field_value_coded INT,
    IN field_value_coded_name_id INT,
    IN field_text VARCHAR(255),
    IN field_value_numeric DOUBLE,
    IN field_value_datetime DATETIME,
    IN field_value_modifier VARCHAR(255),
    IN visit_id INT,
    IN field_voided INT,
    IN encounter_id INT
)
BEGIN

    SET @call_id = (SELECT concept_name.concept_id FROM concept_name
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
    CASE field_concept

        WHEN @call_id THEN
            CALL proc_insert_call_id(
                patient_id,
                value_date,
                field_concept,
                field_value_coded,
                field_value_coded_name_id,
                field_text,
                field_value_numeric,
                field_value_datetime,
                visit_id,
                field_voided,
                encounter_id
              );

     WHEN @pregnancy_status THEN
         CALL proc_insert_pregnancy_status(
             patient_id,
             value_date,
             field_concept,
             field_value_coded,
             field_value_coded_name_id,
             field_text,
             field_value_numeric,
             field_value_datetime,
             visit_id,
             field_voided,
             encounter_id
         );

      WHEN @estimated_date_of_delivery THEN
        CALL proc_estimated_date_of_delivery(
          patient_id,
          value_date,
          field_concept,
          field_value_coded,
          field_value_coded_name_id,
          field_text,
          field_value_numeric,
          field_value_datetime,
          visit_id,
          field_voided,
          encounter_id
        );

      WHEN @pregnancy_status_delivery_date THEN
              CALL pregnancy_status_delivery_date(
                patient_id,
                value_date,
                field_concept,
                field_value_coded,
                field_value_coded_name_id,
                field_text,
                field_value_numeric,
                field_value_datetime,
                visit_id,
                field_voided,
                encounter_id
              );

      WHEN @danger_signs THEN
              CALL danger_signs(
                patient_id,
                value_date,
                field_concept,
                field_value_coded,
                field_value_coded_name_id,
                field_text,
                field_value_numeric,
                field_value_datetime,
                visit_id,
                field_voided,
                encounter_id
              );

      WHEN @health_symptoms THEN
              CALL proc_health_symptoms(
                patient_id,
                value_date,
                field_concept,
                field_value_coded,
                field_value_coded_name_id,
                field_text,
                field_value_numeric,
                field_value_datetime,
                visit_id,
                field_voided,
                encounter_id
              );

      WHEN @health_information THEN
              CALL proc_health_information(
                patient_id,
                value_date,
                field_concept,
                field_value_coded,
                field_value_coded_name_id,
                field_text,
                field_value_numeric,
                field_value_datetime,
                visit_id,
                field_voided,
                encounter_id
              );

      WHEN @outcome THEN
              CALL proc_outcome(
                patient_id,
                value_date,
                field_concept,
                field_value_coded,
                field_value_coded_name_id,
                field_text,
                field_value_numeric,
                field_value_datetime,
                visit_id,
                field_voided,
                encounter_id
              );

      WHEN @healthy_facility_name THEN
              CALL proc_healthy_facility_name(
                patient_id,
                value_date,
                field_concept,
                field_value_coded,
                field_value_coded_name_id,
                field_text,
                field_value_numeric,
                field_value_datetime,
                visit_id,
                field_voided,
                encounter_id
              );

      WHEN @reason_for_referral THEN
              CALL proc_reason_for_referral(
                patient_id,
                value_date,
                field_concept,
                field_value_coded,
                field_value_coded_name_id,
                field_text,
                field_value_numeric,
                field_value_datetime,
                visit_id,
                field_voided,
                encounter_id
              );

      WHEN @secondary_outcome THEN
              CALL proc_secondary_outcome(
                patient_id,
                value_date,
                field_concept,
                field_value_coded,
                field_value_coded_name_id,
                field_text,
                field_value_numeric,
                field_value_datetime,
                visit_id,
                field_voided,
                encounter_id
              );

      WHEN @tips_telephone_number THEN
              CALL proc_tips_telephone_number(
                patient_id,
                value_date,
                field_concept,
                field_value_coded,
                field_value_coded_name_id,
                field_text,
                field_value_numeric,
                field_value_datetime,
                visit_id,
                field_voided,
                encounter_id
              );

      WHEN @tips_telephone_number_type THEN
              CALL proc_tips_telephone_number_type(
                patient_id,
                value_date,
                field_concept,
                field_value_coded,
                field_value_coded_name_id,
                field_text,
                field_value_numeric,
                field_value_datetime,
                visit_id,
                field_voided,
                encounter_id
              );

      WHEN @on_tips_and_reminders_program THEN
              CALL proc_on_tips_and_reminders_program(
                patient_id,
                value_date,
                field_concept,
                field_value_coded,
                field_value_coded_name_id,
                field_text,
                field_value_numeric,
                field_value_datetime,
                visit_id,
                field_voided,
                encounter_id
              );

      WHEN @tips_language_preference THEN
              CALL proc_tips_language_preference(
                patient_id,
                value_date,
                field_concept,
                field_value_coded,
                field_value_coded_name_id,
                field_text,
                field_value_numeric,
                field_value_datetime,
                visit_id,
                field_voided,
                encounter_id
              );

      WHEN @tips_type_of_message THEN
              CALL proc_tips_type_of_message(
                patient_id,
                value_date,
                field_concept,
                field_value_coded,
                field_value_coded_name_id,
                field_text,
                field_value_numeric,
                field_value_datetime,
                visit_id,
                field_voided,
                encounter_id
              );

      WHEN @tips_type_of_message_content THEN
              CALL proc_tips_type_of_message_content(
                patient_id,
                value_date,
                field_concept,
                field_value_coded,
                field_value_coded_name_id,
                field_text,
                field_value_numeric,
                field_value_datetime,
                visit_id,
                field_voided,
                encounter_id
              );

      WHEN @birth_plan_delivery_location THEN
              CALL proc_birth_plan_delivery_location(
                patient_id,
                value_date,
                field_concept,
                field_value_coded,
                field_value_coded_name_id,
                field_text,
                field_value_numeric,
                field_value_datetime,
                visit_id,
                field_voided,
                encounter_id
              );

      WHEN @birth_plan_go_to_hospital_date THEN
              CALL proc_birth_plan_go_to_hospital_date(
                patient_id,
                value_date,
                field_concept,
                field_value_coded,
                field_value_coded_name_id,
                field_text,
                field_value_numeric,
                field_value_datetime,
                visit_id,
                field_voided,
                encounter_id
              );

      WHEN @birth_plan THEN
              CALL proc_birth_plan(
                patient_id,
                value_date,
                field_concept,
                field_value_coded,
                field_value_coded_name_id,
                field_text,
                field_value_numeric,
                field_value_datetime,
                visit_id,
                field_voided,
                encounter_id
              );

      WHEN @antenatal_clinic_patient_appointment THEN
              CALL proc_antenatal_clinic_patient_appointment(
                patient_id,
                value_date,
                field_concept,
                field_value_coded,
                field_value_coded_name_id,
                field_text,
                field_value_numeric,
                field_value_datetime,
                visit_id,
                field_voided,
                encounter_id
              );

      WHEN @last_ANC_visit_date THEN
              CALL proc_last_ANC_visit_date(
                patient_id,
                value_date,
                field_concept,
                field_value_coded,
                field_value_coded_name_id,
                field_text,
                field_value_numeric,
                field_value_datetime,
                visit_id,
                field_voided,
                encounter_id
              );

      WHEN @next_ANC_visit_date THEN
              CALL proc_next_ANC_visit_date(
                patient_id,
                value_date,
                field_concept,
                field_value_coded,
                field_value_coded_name_id,
                field_text,
                field_value_numeric,
                field_value_datetime,
                visit_id,
                field_voided,
                encounter_id
              );

      WHEN @baby_delivered THEN
              CALL proc_baby_delivered(
                patient_id,
                value_date,
                field_concept,
                field_value_coded,
                field_value_coded_name_id,
                field_text,
                field_value_numeric,
                field_value_datetime,
                visit_id,
                field_voided,
                encounter_id
              );

      WHEN @baby_delivered_health_facility_name THEN
              CALL proc_baby_delivered_health_facility_name(
                patient_id,
                value_date,
                field_concept,
                field_value_coded,
                field_value_coded_name_id,
                field_text,
                field_value_numeric,
                field_value_datetime,
                visit_id,
                field_voided,
                encounter_id
              );

      WHEN @baby_delivered_delivery_date THEN
              CALL proc_baby_delivered_delivery_date(
                patient_id,
                value_date,
                field_concept,
                field_value_coded,
                field_value_coded_name_id,
                field_text,
                field_value_numeric,
                field_value_datetime,
                visit_id,
                field_voided,
                encounter_id
              );

      WHEN @baby_delivered_delivery_location THEN
              CALL proc_baby_delivered_delivery_location(
                patient_id,
                value_date,
                field_concept,
                field_value_coded,
                field_value_coded_name_id,
                field_text,
                field_value_numeric,
                field_value_datetime,
                visit_id,
                field_voided,
                encounter_id
              );


    ELSE

            CALL proc_insert_other_hotline_field(
                patient_id,
                value_date,
                field_concept,
                field_value_coded,
                field_value_coded_name_id,
                field_text,
                field_value_numeric,
                field_value_datetime,
                visit_id,
                field_voided,
                encounter_id
            );

    END CASE;

END$$

DELIMITER ;
