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
    IN field_value_complex VARCHAR(255),
    IN visit_id INT,
    IN field_voided INT,
    IN encounter_id INT
)
BEGIN
    SET @food_type = (SELECT concept_name.concept_id FROM concept_name
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                        WHERE name = "Food type" AND voided = 0 AND retired = 0 LIMIT 1);

    SET @meal_type = (SELECT concept_name.concept_id FROM concept_name
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                        WHERE name = "Meal type" AND voided = 0 AND retired = 0 LIMIT 1);

    SET @consumption_method = (SELECT concept_name.concept_id FROM concept_name
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                        WHERE name = "Consumption method" AND voided = 0 AND retired = 0 LIMIT 1);

    SET @call_id = (SELECT concept_name.concept_id FROM concept_name
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                        WHERE name = "Call Id" AND voided = 0 AND retired = 0 LIMIT 1);

    SET @current_complaints_or_symptoms = (SELECT concept_name.concept_id FROM concept_name concept_name
                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                       WHERE name = "Current complaints or symptoms" AND voided = 0 AND retired = 0 LIMIT 1);

    SET @pregnancy_status = (SELECT concept_name.concept_id FROM concept_name
                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                      WHERE name = "Pregnancy Status" AND voided = 0 AND retired = 0 LIMIT 1);

    SET @estimated_date_of_delivery = (SELECT concept_name.concept_id FROM concept_name
                      	LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                      WHERE name = "Expected due date" AND voided = 0 AND retired = 0 LIMIT 1);

    SET @danger_signs = (SELECT concept_name.concept_id FROM concept_name concept_name
                          LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                          WHERE name = "Danger signs" AND voided = 0 AND retired = 0 LIMIT 1);

    SET @health_symptoms = (SELECT concept_name.concept_id FROM concept_name concept_name
                              LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                            WHERE name = "Health symptom" AND voided = 0 AND retired = 0 LIMIT 1);

    SET @health_information = (SELECT concept_name.concept_id FROM concept_name concept_name
                                LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                               WHERE name = "Maternal health info" AND voided = 0 AND retired = 0 LIMIT 1);

    SET @general_outcome = (SELECT concept_name.concept_id FROM concept_name concept_name
                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                    WHERE name = "General outcome" AND voided = 0 AND retired = 0 LIMIT 1);

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
                                      WHERE name = "Phone type" AND voided = 0 AND retired = 0 LIMIT 1);

    SET @on_tips_and_reminders_program = (SELECT concept_name.concept_id FROM concept_name concept_name
                                            LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                          WHERE name = "On tips and reminders program" AND voided = 0 AND retired = 0 LIMIT 1);

    SET @tips_language_preference = (SELECT concept_name.concept_id FROM concept_name concept_name
                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                     WHERE name = "Language preference" AND voided = 0 AND retired = 0 LIMIT 1);

    SET @tips_type_of_message = (SELECT concept_name.concept_id FROM concept_name concept_name
                                  LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                 WHERE name = "Message type" AND voided = 0 AND retired = 0 LIMIT 1);

    SET @tips_type_of_message_content = (SELECT concept_name.concept_id FROM concept_name concept_name
                                          LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                         WHERE name = "Type of message content" AND voided = 0 AND retired = 0 LIMIT 1);

    SET @birth_plan_go_to_hospital_date = (SELECT concept_name.concept_id FROM concept_name concept_name
                                            LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                          WHERE name = "Go to hospital date" AND voided = 0 AND retired = 0 LIMIT 1);

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
                                WHERE name = "Next ANC Visit Date" AND voided = 0 AND retired = 0 LIMIT 1);

    SET @clinic = (SELECT concept_name.concept_id FROM concept_name concept_name
                                  LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                WHERE name = "clinic" AND voided = 0 AND retired = 0 LIMIT 1);

    SET @nearest_health_facility = (SELECT concept_name.concept_id FROM concept_name concept_name
                                  LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                WHERE name = "Nearest health facility" AND voided = 0 AND retired = 0 LIMIT 1);

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

    SET @nearest_health_facility = (SELECT concept_name.concept_id FROM concept_name concept_name
                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                    WHERE name = "Nearest health facility" AND voided = 0 AND retired = 0 LIMIT 1);

    SET @purpose_of_call = (SELECT concept_name.concept_id FROM concept_name concept_name
                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                    WHERE name = "Purpose of call" AND voided = 0 AND retired = 0 LIMIT 1);

    SET @maternal_Hsymptoms = (SELECT concept_name.concept_id FROM concept_name concept_name
                                          LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                        WHERE name = "Maternal health symptoms" AND voided = 0 AND retired = 0 LIMIT 1);

    SET @last_menstrual_period_date = (SELECT concept_name.concept_id FROM concept_name concept_name
                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                    WHERE name = "Last menstrual period" AND voided = 0 AND retired = 0 LIMIT 1);

    SET @pregnancy_due_date = (SELECT concept_name.concept_id FROM concept_name concept_name
                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                    WHERE name = "Pregnancy due date" AND voided = 0 AND retired = 0 LIMIT 1);

    SET  @fever_of_7_days_or_more = (SELECT concept_name.concept_id FROM concept_name concept_name
                                       LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                     WHERE name = "Fever of 7 days or more" AND voided = 0 AND retired = 0 LIMIT 1);

    SET  @diarrhea_for_14_days_or_more = (SELECT concept_name.concept_id FROM concept_name concept_name
                                            LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                          WHERE name = "Diarrhea for 14 days or more" AND voided = 0 AND retired = 0 LIMIT 1);

    SET  @blood_in_stool = (SELECT concept_name.concept_id FROM concept_name concept_name
                              LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                            WHERE name = "Blood in stool" AND voided = 0 AND retired = 0 LIMIT 1);

    SET  @cough_for_21_days_or_more = (SELECT concept_name.concept_id FROM concept_name concept_name
                                          LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                       WHERE name = "Cough for 21 days or more" AND voided = 0 AND retired = 0 LIMIT 1);

    SET  @not_eating_or_drinking_anything = (SELECT concept_name.concept_id FROM concept_name concept_name
                                              LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                              WHERE name = "Not eating or drinking anything" AND voided = 0 AND retired = 0 LIMIT 1);

    SET  @red_eye_for_4_days_or_more_with_visual_problems = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                              LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                             WHERE name = "Red eye for 4 days or more with visual problems" AND voided = 0 AND retired = 0 LIMIT 1);

    SET  @very_sleepy_or_unconscious = (SELECT concept_name.concept_id FROM concept_name concept_name
                                         LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                        WHERE name = "Very sleepy or unconscious" AND voided = 0 AND retired = 0 LIMIT 1);

    SET  @convulsions_sign = (SELECT concept_name.concept_id FROM concept_name concept_name
                                LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                              WHERE name = "Convulsions sign" AND voided = 0 AND retired = 0 LIMIT 1);

    SET  @vomiting_everything = (SELECT concept_name.concept_id FROM concept_name concept_name
                                  LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                 WHERE name = "Vomiting everything" AND voided = 0 AND retired = 0 LIMIT 1);

    SET  @visual_problems = (SELECT concept_name.concept_id FROM concept_name concept_name
                              LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                             WHERE name = "Visual problems" AND voided = 0 AND retired = 0 LIMIT 1);

    SET  @cough = (SELECT concept_name.concept_id FROM concept_name concept_name
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                   WHERE name = "Cough" AND voided = 0 AND retired = 0 LIMIT 1);

    SET  @not_eating = (SELECT concept_name.concept_id FROM concept_name concept_name
                LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                WHERE name = "Not eating" AND voided = 0 AND retired = 0 LIMIT 1);

    SET  @unconscious = (SELECT concept_name.concept_id FROM concept_name concept_name
                          LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                         WHERE name = "Unconscious" AND voided = 0 AND retired = 0 LIMIT 1);

    SET  @gained_or_lost_weight = (SELECT concept_name.concept_id FROM concept_name concept_name
                                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                   WHERE name = "Gained or lost weight" AND voided = 0 AND retired = 0 LIMIT 1);

    SET  @severity_of_cough = (SELECT concept_name.concept_id FROM concept_name concept_name
                                LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                               WHERE name = "Severity of cough" AND voided = 0 AND retired = 0 LIMIT 1);

    SET  @severity_of_diarrhea = (SELECT concept_name.concept_id FROM concept_name concept_name
                                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                  WHERE name = "Severity of diarrhea" AND voided = 0 AND retired = 0 LIMIT 1);

    SET  @severity_of_fever = (SELECT concept_name.concept_id FROM concept_name concept_name
                                LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                               WHERE name = "Severity of fever" AND voided = 0 AND retired = 0 LIMIT 1);

    SET  @severity_of_red_eye = (SELECT concept_name.concept_id FROM concept_name concept_name
                                  LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                 WHERE name = "Severity of red eye" AND voided = 0 AND retired = 0 LIMIT 1);

    SET  @red_eye = (SELECT concept_name.concept_id FROM concept_name concept_name
                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                     WHERE name = "Red eye" AND voided = 0 AND retired = 0 LIMIT 1);

    SET  @flaky_skin = (SELECT concept_name.concept_id FROM concept_name concept_name
                          LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                        WHERE name = "Flaky skin" AND voided = 0 AND retired = 0 LIMIT 1);

    CASE field_concept
      WHEN @food_type THEN
        CALL proc_food_type(
          patient_id,
          value_date,
          field_concept,
          field_value_coded,
          field_value_coded_name_id,
          field_text,
          field_value_numeric,
          field_value_datetime,
          field_value_complex,
          visit_id,
          field_voided,
          encounter_id
        );

      WHEN @meal_type THEN
        CALL proc_meal_type(
          patient_id,
          value_date,
          field_concept,
          field_value_coded,
          field_value_coded_name_id,
          field_text,
          field_value_numeric,
          field_value_datetime,
          field_value_complex,
          visit_id,
          field_voided,
          encounter_id
        );

      WHEN @consumption_method THEN
        CALL proc_consumption_method(
          patient_id,
          value_date,
          field_concept,
          field_value_coded,
          field_value_coded_name_id,
          field_text,
          field_value_numeric,
          field_value_datetime,
          field_value_complex,
          visit_id,
          field_voided,
          encounter_id
        );

      WHEN @current_complaints_or_symptoms THEN
        CALL proc_current_complaints_or_symptoms(
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

      WHEN @pregnancy_due_date THEN
        CALL proc_pregnancy_due_date(
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

      WHEN @last_menstrual_period_date THEN
        CALL proc_last_menstrual_period_date(
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

      WHEN @purpose_of_call THEN
        CALL proc_purpose_of_call(
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

    WHEN @maternal_Hsymptoms THEN
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

    WHEN @danger_signs THEN
          CALL proc_danger_signs(
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
              CALL proc_pregnancy_status_delivery_date(
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

      WHEN @danger_sign_concept_id THEN
              CALL proc_danger_signs(
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

      WHEN @health_symptom_concept_id THEN
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

      WHEN @general_outcome THEN
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

      WHEN @nearest_health_facility  THEN
        SET @already_exist = COALESCE((SELECT patient_id FROM patient_visits WHERE patient_visits.patient_id = patient_id), 0);

        IF @already_exist = 0 THEN
          IF visit_id = 0 THEN
            INSERT INTO patient_visits(patient_id, visit_date, nearest_health_facility, nearest_health_facility_enc_id)
            VALUES( patient_id, value_date, field_text, encounter_id);
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET nearest_health_facility = field_text, nearest_health_facility_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        ELSE
          IF visit_id = 0 THEN
            UPDATE patient_visits
            SET visit_date = value_date, nearest_health_facility = field_text, nearest_health_facility_enc_id = encounter_id
            WHERE patient_id = patient_id;
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET visit_date = value_date, nearest_health_facility = field_text, nearest_health_facility_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        END IF;

      WHEN @clinic  THEN
        SET @already_exist = COALESCE((SELECT patient_id FROM patient_visits WHERE patient_visits.patient_id = patient_id), 0);

        IF @already_exist = 0 THEN
          IF visit_id = 0 THEN
            INSERT INTO patient_visits(patient_id, visit_date, clinic, clinic_enc_id)
            VALUES( patient_id, value_date, field_text, encounter_id);
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET clinic = field_text, clinic_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        ELSE
          IF visit_id = 0 THEN
            UPDATE patient_visits
            SET visit_date = value_date, clinic = field_text, clinic_enc_id = encounter_id
            WHERE patient_id = patient_id;
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET visit_date = value_date, clinic = field_text, clinic_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        END IF;


      WHEN @fever_of_7_days_or_more  THEN
        SET @already_exist = COALESCE((SELECT patient_id FROM patient_visits WHERE patient_visits.patient_id = patient_id), 0);
        SET @value = COALESCE((SELECT name FROM concept_name WHERE concept_name_id = field_value_coded_name_id AND voided = 0), field_text);

        IF @already_exist = 0 THEN
          IF visit_id = 0 THEN
            INSERT INTO patient_visits(patient_id, visit_date, fever_of_7_days_or_more, fever_of_7_days_or_more_enc_id)
            VALUES( patient_id, value_date, @value, encounter_id);
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET fever_of_7_days_or_more = @value, fever_of_7_days_or_more_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        ELSE
          IF visit_id = 0 THEN
            UPDATE patient_visits
            SET visit_date = value_date, fever_of_7_days_or_more = @value, fever_of_7_days_or_more_enc_id = encounter_id
            WHERE patient_id = patient_id;
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET visit_date = value_date, fever_of_7_days_or_more = @value, fever_of_7_days_or_more_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        END IF;

      WHEN @diarrhea_for_14_days_or_more  THEN
        SET @already_exist = COALESCE((SELECT patient_id FROM patient_visits WHERE patient_visits.patient_id = patient_id), 0);
        SET @value = COALESCE((SELECT name FROM concept_name WHERE concept_name_id = field_value_coded_name_id AND voided = 0), field_text);

        IF @already_exist = 0 THEN
          IF visit_id = 0 THEN
            INSERT INTO patient_visits(patient_id, visit_date, diarrhea_for_14_days_or_more, diarrhea_for_14_days_or_more_enc_id)
            VALUES( patient_id, value_date, @value, encounter_id);
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET diarrhea_for_14_days_or_more = @value, diarrhea_for_14_days_or_more_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        ELSE
          IF visit_id = 0 THEN
            UPDATE patient_visits
            SET visit_date = value_date, diarrhea_for_14_days_or_more = @value, diarrhea_for_14_days_or_more_enc_id = encounter_id
            WHERE patient_id = patient_id;
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET visit_date = value_date, diarrhea_for_14_days_or_more = @value, diarrhea_for_14_days_or_more_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        END IF;

      WHEN @blood_in_stool  THEN
        SET @already_exist = COALESCE((SELECT patient_id FROM patient_visits WHERE patient_visits.patient_id = patient_id), 0);
        SET @value = COALESCE((SELECT name FROM concept_name WHERE concept_name_id = field_value_coded_name_id AND voided = 0), field_text);

        IF @already_exist = 0 THEN
          IF visit_id = 0 THEN
            INSERT INTO patient_visits(patient_id, visit_date, blood_in_stool, blood_in_stool_enc_id)
            VALUES( patient_id, value_date, @value, encounter_id);
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET blood_in_stool = @value, blood_in_stool_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        ELSE
          IF visit_id = 0 THEN
            UPDATE patient_visits
            SET visit_date = value_date, blood_in_stool = @value, blood_in_stool_enc_id = encounter_id
            WHERE patient_id = patient_id;
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET visit_date = value_date, blood_in_stool = @value, blood_in_stool_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        END IF;

      WHEN @cough_for_21_days_or_more  THEN
        SET @already_exist = COALESCE((SELECT patient_id FROM patient_visits WHERE patient_visits.patient_id = patient_id), 0);
        SET @value = COALESCE((SELECT name FROM concept_name WHERE concept_name_id = field_value_coded_name_id AND voided = 0), field_text);

        IF @already_exist = 0 THEN
          IF visit_id = 0 THEN
            INSERT INTO patient_visits(patient_id, visit_date, cough_for_21_days_or_more, cough_for_21_days_or_more_enc_id)
            VALUES( patient_id, value_date, @value, encounter_id);
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET cough_for_21_days_or_more = @value, cough_for_21_days_or_more_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        ELSE
          IF visit_id = 0 THEN
            UPDATE patient_visits
            SET visit_date = value_date, cough_for_21_days_or_more = @value, cough_for_21_days_or_more_enc_id = encounter_id
            WHERE patient_id = patient_id;
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET visit_date = value_date, cough_for_21_days_or_more = @value, cough_for_21_days_or_more_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        END IF;

      WHEN @not_eating_or_drinking_anything  THEN
        SET @already_exist = COALESCE((SELECT patient_id FROM patient_visits WHERE patient_visits.patient_id = patient_id), 0);
        SET @value = COALESCE((SELECT name FROM concept_name WHERE concept_name_id = field_value_coded_name_id AND voided = 0), field_text);

        IF @already_exist = 0 THEN
          IF visit_id = 0 THEN
            INSERT INTO patient_visits(patient_id, visit_date, not_eating_or_drinking_anything, not_eating_or_drinking_anything_enc_id)
            VALUES( patient_id, value_date, @value, encounter_id);
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET not_eating_or_drinking_anything = @value, not_eating_or_drinking_anything_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        ELSE
          IF visit_id = 0 THEN
            UPDATE patient_visits
            SET visit_date = value_date, not_eating_or_drinking_anything = @value, not_eating_or_drinking_anything_enc_id = encounter_id
            WHERE patient_id = patient_id;
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET visit_date = value_date, not_eating_or_drinking_anything = @value, not_eating_or_drinking_anything_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        END IF;

      WHEN @red_eye_for_4_days_or_more_with_visual_problems  THEN
        SET @already_exist = COALESCE((SELECT patient_id FROM patient_visits WHERE patient_visits.patient_id = patient_id), 0);
        SET @value = COALESCE((SELECT name FROM concept_name WHERE concept_name_id = field_value_coded_name_id AND voided = 0), field_text);

        IF @already_exist = 0 THEN
          IF visit_id = 0 THEN
            INSERT INTO patient_visits(patient_id, visit_date, red_eye_for_4_days_or_more_with_visual_problems, red_eye_for_4_days_or_more_with_visual_problems_enc_id)
            VALUES( patient_id, value_date, @value, encounter_id);
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET red_eye_for_4_days_or_more_with_visual_problems = @value, red_eye_for_4_days_or_more_with_visual_problems_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        ELSE
          IF visit_id = 0 THEN
            UPDATE patient_visits
            SET visit_date = value_date, red_eye_for_4_days_or_more_with_visual_problems = @value, red_eye_for_4_days_or_more_with_visual_problems_enc_id = encounter_id
            WHERE patient_id = patient_id;
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET visit_date = value_date, red_eye_for_4_days_or_more_with_visual_problems = @value, red_eye_for_4_days_or_more_with_visual_problems_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        END IF;

      WHEN @very_sleepy_or_unconscious  THEN
        SET @already_exist = COALESCE((SELECT patient_id FROM patient_visits WHERE patient_visits.patient_id = patient_id), 0);
        SET @value = COALESCE((SELECT name FROM concept_name WHERE concept_name_id = field_value_coded_name_id AND voided = 0), field_text);

        IF @already_exist = 0 THEN
          IF visit_id = 0 THEN
            INSERT INTO patient_visits(patient_id, visit_date, very_sleepy_or_unconscious, very_sleepy_or_unconscious_enc_id)
            VALUES( patient_id, value_date, @value, encounter_id);
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET very_sleepy_or_unconscious = @value, very_sleepy_or_unconscious_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        ELSE
          IF visit_id = 0 THEN
            UPDATE patient_visits
            SET visit_date = value_date, very_sleepy_or_unconscious = @value, very_sleepy_or_unconscious_enc_id = encounter_id
            WHERE patient_id = patient_id;
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET visit_date = value_date, very_sleepy_or_unconscious = @value, very_sleepy_or_unconscious_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        END IF;

      WHEN @convulsions_sign  THEN
        SET @already_exist = COALESCE((SELECT patient_id FROM patient_visits WHERE patient_visits.patient_id = patient_id), 0);
        SET @value = COALESCE((SELECT name FROM concept_name WHERE concept_name_id = field_value_coded_name_id AND voided = 0), field_text);

        IF @already_exist = 0 THEN
          IF visit_id = 0 THEN
            INSERT INTO patient_visits(patient_id, visit_date, convulsions_sign, convulsions_sign_enc_id)
            VALUES( patient_id, value_date, @value, encounter_id);
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET convulsions_sign = @value, convulsions_sign_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        ELSE
          IF visit_id = 0 THEN
            UPDATE patient_visits
            SET visit_date = value_date, convulsions_sign = @value, convulsions_sign_enc_id = encounter_id
            WHERE patient_id = patient_id;
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET visit_date = value_date, convulsions_sign = @value, convulsions_sign_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        END IF;

      WHEN @vomiting_everything  THEN
        SET @already_exist = COALESCE((SELECT patient_id FROM patient_visits WHERE patient_visits.patient_id = patient_id), 0);
        SET @value = COALESCE((SELECT name FROM concept_name WHERE concept_name_id = field_value_coded_name_id AND voided = 0), field_text);

        IF @already_exist = 0 THEN
          IF visit_id = 0 THEN
            INSERT INTO patient_visits(patient_id, visit_date, vomiting_everything, vomiting_everything_enc_id)
            VALUES( patient_id, value_date, @value, encounter_id);
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET vomiting_everything = @value, vomiting_everything_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        ELSE
          IF visit_id = 0 THEN
            UPDATE patient_visits
            SET visit_date = value_date, vomiting_everything = @value, vomiting_everything_enc_id = encounter_id
            WHERE patient_id = patient_id;
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET visit_date = value_date, vomiting_everything = @value, vomiting_everything_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        END IF;

      WHEN @visual_problems  THEN
        SET @already_exist = COALESCE((SELECT patient_id FROM patient_visits WHERE patient_visits.patient_id = patient_id), 0);
        SET @value = COALESCE((SELECT name FROM concept_name WHERE concept_name_id = field_value_coded_name_id AND voided = 0), field_text);

        IF @already_exist = 0 THEN
          IF visit_id = 0 THEN
            INSERT INTO patient_visits(patient_id, visit_date, visual_problems, visual_problems_enc_id)
            VALUES( patient_id, value_date, @value, encounter_id);
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET visual_problems = @value, visual_problems_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        ELSE
          IF visit_id = 0 THEN
            UPDATE patient_visits
            SET visit_date = value_date, visual_problems = @value, visual_problems_enc_id = encounter_id
            WHERE patient_id = patient_id;
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET visit_date = value_date, visual_problems = @value, visual_problems_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        END IF;

      WHEN @cough  THEN
        SET @already_exist = COALESCE((SELECT patient_id FROM patient_visits WHERE patient_visits.patient_id = patient_id), 0);
        SET @value = COALESCE((SELECT name FROM concept_name WHERE concept_name_id = field_value_coded_name_id AND voided = 0), field_text);

        IF @already_exist = 0 THEN
          IF visit_id = 0 THEN
            INSERT INTO patient_visits(patient_id, visit_date, cough, cough_enc_id)
            VALUES( patient_id, value_date, @value, encounter_id);
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET cough = @value, cough_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        ELSE
          IF visit_id = 0 THEN
            UPDATE patient_visits
            SET visit_date = value_date, cough = @value, cough_enc_id = encounter_id
            WHERE patient_id = patient_id;
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET visit_date = value_date, cough = @value, cough_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        END IF;

      WHEN @not_eating  THEN
        SET @already_exist = COALESCE((SELECT patient_id FROM patient_visits WHERE patient_visits.patient_id = patient_id), 0);
        SET @value = COALESCE((SELECT name FROM concept_name WHERE concept_name_id = field_value_coded_name_id AND voided = 0), field_text);

        IF @already_exist = 0 THEN
          IF visit_id = 0 THEN
            INSERT INTO patient_visits(patient_id, visit_date, not_eating, not_eating_enc_id)
            VALUES( patient_id, value_date, @value, encounter_id);
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET not_eating = @value, not_eating_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        ELSE
          IF visit_id = 0 THEN
            UPDATE patient_visits
            SET visit_date = value_date, not_eating = @value, not_eating_enc_id = encounter_id
            WHERE patient_id = patient_id;
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET visit_date = value_date, not_eating = @value, not_eating_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        END IF;

      WHEN @unconscious  THEN
        SET @already_exist = COALESCE((SELECT patient_id FROM patient_visits WHERE patient_visits.patient_id = patient_id), 0);
        SET @value = COALESCE((SELECT name FROM concept_name WHERE concept_name_id = field_value_coded_name_id AND voided = 0), field_text);

        IF @already_exist = 0 THEN
          IF visit_id = 0 THEN
            INSERT INTO patient_visits(patient_id, visit_date, unconscious, unconscious_enc_id)
            VALUES( patient_id, value_date, @value, encounter_id);
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET unconscious = @value, unconscious_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        ELSE
          IF visit_id = 0 THEN
            UPDATE patient_visits
            SET visit_date = value_date, unconscious = @value, unconscious_enc_id = encounter_id
            WHERE patient_id = patient_id;
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET visit_date = value_date, unconscious = @value, unconscious_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        END IF;

      WHEN @gained_or_lost_weight  THEN
        SET @already_exist = COALESCE((SELECT patient_id FROM patient_visits WHERE patient_visits.patient_id = patient_id), 0);
        SET @value = COALESCE((SELECT name FROM concept_name WHERE concept_name_id = field_value_coded_name_id AND voided = 0), field_text);

        IF @already_exist = 0 THEN
          IF visit_id = 0 THEN
            INSERT INTO patient_visits(patient_id, visit_date, gained_or_lost_weight, gained_or_lost_weight_enc_id)
            VALUES( patient_id, value_date, @value, encounter_id);
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET gained_or_lost_weight = @value, gained_or_lost_weight_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        ELSE
          IF visit_id = 0 THEN
            UPDATE patient_visits
            SET visit_date = value_date, gained_or_lost_weight = @value, gained_or_lost_weight_enc_id = encounter_id
            WHERE patient_id = patient_id;
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET visit_date = value_date, gained_or_lost_weight = @value, gained_or_lost_weight_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        END IF;

      WHEN @severity_of_cough  THEN
        SET @already_exist = COALESCE((SELECT patient_id FROM patient_visits WHERE patient_visits.patient_id = patient_id), 0);
        SET @value = COALESCE((SELECT name FROM concept_name WHERE concept_name_id = field_value_coded_name_id AND voided = 0), field_text);

        IF @already_exist = 0 THEN
          IF visit_id = 0 THEN
            INSERT INTO patient_visits(patient_id, visit_date, severity_of_cough, severity_of_cough_enc_id)
            VALUES( patient_id, value_date, field_value_numeric, encounter_id);
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET severity_of_cough = field_value_numeric, severity_of_cough_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        ELSE
          IF visit_id = 0 THEN
            UPDATE patient_visits
            SET visit_date = value_date, severity_of_cough = field_value_numeric, severity_of_cough_enc_id = encounter_id
            WHERE patient_id = patient_id;
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET visit_date = value_date, severity_of_cough = field_value_numeric, severity_of_cough_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        END IF;

      WHEN @severity_of_diarrhea  THEN
        SET @already_exist = COALESCE((SELECT patient_id FROM patient_visits WHERE patient_visits.patient_id = patient_id), 0);
        SET @value = COALESCE((SELECT name FROM concept_name WHERE concept_name_id = field_value_coded_name_id AND voided = 0), field_text);

        IF @already_exist = 0 THEN
          IF visit_id = 0 THEN
            INSERT INTO patient_visits(patient_id, visit_date, severity_of_diarrhea, severity_of_diarrhea_enc_id)
            VALUES( patient_id, value_date, field_value_numeric, encounter_id);
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET severity_of_diarrhea = field_value_numeric, severity_of_diarrhea_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        ELSE
          IF visit_id = 0 THEN
            UPDATE patient_visits
            SET visit_date = value_date, severity_of_diarrhea = field_value_numeric, severity_of_diarrhea_enc_id = encounter_id
            WHERE patient_id = patient_id;
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET visit_date = value_date, severity_of_diarrhea = field_value_numeric, severity_of_diarrhea_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        END IF;

      WHEN @severity_of_fever  THEN
        SET @already_exist = COALESCE((SELECT patient_id FROM patient_visits WHERE patient_visits.patient_id = patient_id), 0);
        SET @value = COALESCE((SELECT name FROM concept_name WHERE concept_name_id = field_value_coded_name_id AND voided = 0), field_text);

        IF @already_exist = 0 THEN
          IF visit_id = 0 THEN
            INSERT INTO patient_visits(patient_id, visit_date, severity_of_fever, severity_of_fever_enc_id)
            VALUES( patient_id, value_date, field_value_numeric, encounter_id);
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET severity_of_fever = field_value_numeric, severity_of_fever_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        ELSE
          IF visit_id = 0 THEN
            UPDATE patient_visits
            SET visit_date = value_date, severity_of_fever = field_value_numeric, severity_of_fever_enc_id = encounter_id
            WHERE patient_id = patient_id;
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET visit_date = value_date, severity_of_fever = field_value_numeric, severity_of_fever_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        END IF;

      WHEN @severity_of_fever  THEN
        SET @already_exist = COALESCE((SELECT patient_id FROM patient_visits WHERE patient_visits.patient_id = patient_id), 0);
        SET @value = COALESCE((SELECT name FROM concept_name WHERE concept_name_id = field_value_coded_name_id AND voided = 0), field_text);

        IF @already_exist = 0 THEN
          IF visit_id = 0 THEN
            INSERT INTO patient_visits(patient_id, visit_date, severity_of_fever, severity_of_fever_enc_id)
            VALUES( patient_id, value_date, field_value_numeric, encounter_id);
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET severity_of_fever = field_value_numeric, severity_of_fever_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        ELSE
          IF visit_id = 0 THEN
            UPDATE patient_visits
            SET visit_date = value_date, severity_of_fever = field_value_numeric, severity_of_fever_enc_id = encounter_id
            WHERE patient_id = patient_id;
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET visit_date = value_date, severity_of_fever = field_value_numeric, severity_of_fever_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        END IF;

      WHEN @severity_of_red_eye  THEN
        SET @already_exist = COALESCE((SELECT patient_id FROM patient_visits WHERE patient_visits.patient_id = patient_id), 0);
        SET @value = COALESCE((SELECT name FROM concept_name WHERE concept_name_id = field_value_coded_name_id AND voided = 0), field_text);

        IF @already_exist = 0 THEN
          IF visit_id = 0 THEN
            INSERT INTO patient_visits(patient_id, visit_date, severity_of_red_eye, severity_of_red_eye_enc_id)
            VALUES( patient_id, value_date, field_value_numeric, encounter_id);
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET severity_of_red_eye = field_value_numeric, severity_of_red_eye_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        ELSE
          IF visit_id = 0 THEN
            UPDATE patient_visits
            SET visit_date = value_date, severity_of_red_eye = field_value_numeric, severity_of_red_eye_enc_id = encounter_id
            WHERE patient_id = patient_id;
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET visit_date = value_date, severity_of_red_eye = field_value_numeric, severity_of_red_eye_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        END IF;

      WHEN @red_eye  THEN
        SET @already_exist = COALESCE((SELECT patient_id FROM patient_visits WHERE patient_visits.patient_id = patient_id), 0);
        SET @value = COALESCE((SELECT name FROM concept_name WHERE concept_name_id = field_value_coded_name_id AND voided = 0), field_text);

        IF @already_exist = 0 THEN
          IF visit_id = 0 THEN
            INSERT INTO patient_visits(patient_id, visit_date, red_eye, red_eye_enc_id)
            VALUES( patient_id, value_date, @value, encounter_id);
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET red_eye = @value, red_eye_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        ELSE
          IF visit_id = 0 THEN
            UPDATE patient_visits
            SET visit_date = value_date, red_eye = @value, red_eye_enc_id = encounter_id
            WHERE patient_id = patient_id;
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET visit_date = value_date, red_eye = @value, red_eye_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        END IF;

      WHEN @flaky_skin  THEN
        SET @already_exist = COALESCE((SELECT patient_id FROM patient_visits WHERE patient_visits.patient_id = patient_id), 0);
        SET @value = COALESCE((SELECT name FROM concept_name WHERE concept_name_id = field_value_coded_name_id AND voided = 0), field_text);

        IF @already_exist = 0 THEN
          IF visit_id = 0 THEN
            INSERT INTO patient_visits(patient_id, visit_date, flaky_skin, flaky_skin_enc_id)
            VALUES( patient_id, value_date, @value, encounter_id);
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET flaky_skin = @value, flaky_skin_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        ELSE
          IF visit_id = 0 THEN
            UPDATE patient_visits
            SET visit_date = value_date, flaky_skin = @value, flaky_skin_enc_id = encounter_id
            WHERE patient_id = patient_id;
          ELSE
            IF field_voided = 0 THEN
              UPDATE patient_visits
              SET visit_date = value_date, flaky_skin = @value, flaky_skin_enc_id = encounter_id
              WHERE patient_visits.id = visit_id;
            END IF;
          END IF;
        END IF;

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
