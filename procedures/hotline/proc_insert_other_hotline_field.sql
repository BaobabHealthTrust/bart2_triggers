DELIMITER $$

DROP PROCEDURE IF EXISTS `proc_insert_other_hotline_field`$$

CREATE PROCEDURE `proc_insert_other_hotline_field`(
    IN in_patient_id INT,
    IN in_field_concept INT,
    IN in_visit_date DATE,
    IN in_field_value_coded INT,
    IN in_field_value_coded_name_id INT,
    IN in_field_value_text VARCHAR(255),
    IN in_field_value_numeric DOUBLE,
    iN in_field_value_datetime DATETIME,
    IN in_visit_id INT,
    IN in_field_voided INT,
    IN encounter_id INT
)

BEGIN
    SET @nearest_health_facility = (SELECT concept_name.concept_id FROM concept_name concept_name
                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                    WHERE name = "Nearest health facility" AND voided = 0 AND retired = 0 LIMIT 1);

    SET @phone_type = (SELECT concept_name.concept_id FROM concept_name concept_name
                         LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                        WHERE name = "Phone type" AND voided = 0 AND retired = 0 LIMIT 1);

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
                                      WHERE name = "Telephone number type" AND voided = 0 AND retired = 0 LIMIT 1);

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

    SET @purpose_of_call = (SELECT concept_name.concept_id FROM concept_name concept_name
                                  LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                WHERE name = "Purpose of call" AND voided = 0 AND retired = 0 LIMIT 1);

    SET @last_menstrual_period_date = (SELECT concept_name.concept_id FROM concept_name concept_name
                          LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                        WHERE name = "Last menstrual period" AND voided = 0 AND retired = 0 LIMIT 1);


    IF (in_field_voided = 0) THEN
      CASE in_field_concept
      WHEN @nearest_health_facility THEN

          SET @nearest_health_facility1 = (SELECT COALESCE(nearest_health_facility, '')
                                           FROM patient_demographics
                                           WHERE patient_demographics.patient_id = in_patient_id);

          IF in_visit_id = 0 THEN
              CASE
                  WHEN @nearest_health_facility1 = "" THEN
                    INSERT INTO patient_demographics (patient_id, nearest_health_facility) VALUES (in_patient_id, in_field_value_text);
                  ELSE
                    SET @enc_id = encounter_id;
              END CASE;
          ELSE
              CASE
                  WHEN @nearest_health_facility1  = "" THEN
                    IF in_field_voided = 0 THEN
                      UPDATE patient_demographics SET nearest_health_facility = in_field_value_text WHERE patient_demographics.id = in_visit_id;
                    ELSE
                      UPDATE patient_demographics SET nearest_health_facility = NULL WHERE patient_demographics.patient_id = in_patient_id;
                    END IF;
                  ELSE
                      SET @enc_id = encounter_id;
              END CASE;
          END IF;

        WHEN @last_menstrual_period_date THEN
              SET @last_menstrual_period_date1 = (SELECT COALESCE(last_menstrual_period_date, '') FROM patient_visits WHERE ID = in_visit_id);
              IF in_visit_id = 0 THEN
                  CASE

                      WHEN @last_menstrual_period_date1 = "" THEN
                        INSERT INTO patient_visits (patient_id, visit_date, last_menstrual_period_date, last_menstrual_period_date_enc_id)
                        VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                      ELSE
                        SET @enc_id = encounter_id;
                  END CASE;
              ELSE
                  CASE
                      WHEN @last_menstrual_period_date1  = "" THEN
                        IF in_field_voided = 0 THEN
                          UPDATE patient_visits SET last_menstrual_period_date = in_field_value_text, last_menstrual_period_date_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
                        ELSE
                          UPDATE patient_visits SET last_menstrual_period_date = NULL, last_menstrual_period_date_enc_id = NULL WHERE patient_visits.id = in_visit_id;
                        END IF;
                      ELSE
                          SET @enc_id = encounter_id;
                  END CASE;
              END IF;

          WHEN @phone_type THEN
                SET @tips_telephone_number_type1 = (SELECT COALESCE(tips_telephone_number_type, '') FROM patient_visits WHERE ID = in_visit_id);
                IF in_visit_id = 0 THEN
                    CASE

                        WHEN @tips_telephone_number_type1 = "" THEN
                          INSERT INTO patient_visits (patient_id, visit_date, tips_telephone_number_type, tips_telephone_number_type_enc_id)
                          VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                        ELSE
                          SET @enc_id = encounter_id;
                    END CASE;
                ELSE
                    CASE
                        WHEN @tips_telephone_number_type1  = "" THEN
                          IF in_field_voided = 0 THEN
                            UPDATE patient_visits SET tips_telephone_number_type = in_field_value_text, tips_telephone_number_type_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
                          ELSE
                            UPDATE patient_visits SET tips_telephone_number_type = NULL, tips_telephone_number_type_enc_id = NULL WHERE patient_visits.id = in_visit_id;
                          END IF;
                        ELSE
                            SET @enc_id = encounter_id;
                    END CASE;
                END IF;

        WHEN @call_id THEN

              SET @call_id1 = (SELECT COALESCE(call_id, '') FROM patient_visits WHERE ID = in_visit_id);

              IF in_visit_id = 0 THEN
                  CASE

                      WHEN @call_id1 = "" THEN
                        INSERT INTO patient_visits (patient_id, visit_date, call_id, call_id_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                      ELSE
                        SET @enc_id = encounter_id;
                  END CASE;
              ELSE
                  CASE
                      WHEN @call_id1  = "" THEN
                        IF in_field_voided = 0 THEN
                          UPDATE patient_visits SET call_id = in_field_value_text, call_id_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
                        ELSE
                          UPDATE patient_visits SET call_id = NULL, call_id_enc_id = NULL WHERE patient_visits.id = in_visit_id;
                        END IF;
                      ELSE
                          SET @enc_id = encounter_id;
                  END CASE;

              END IF;

      WHEN @purpose_of_call THEN

            SET @purpose_of_call1 = (SELECT COALESCE(purpose_of_call, '') FROM patient_visits WHERE ID = in_visit_id);

            IF in_visit_id = 0 THEN
                CASE

                    WHEN @purpose_of_call1 = "" THEN
                      INSERT INTO patient_visits (patient_id, visit_date, purpose_of_call, purpose_of_call_enc_id)
                      VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                    ELSE
                      SET @enc_id = encounter_id;
                END CASE;
            ELSE
                CASE
                    WHEN @purpose_of_call1  = "" THEN
                      IF in_field_voided = 0 THEN
                        UPDATE patient_visits SET purpose_of_call = in_field_value_text, purpose_of_call_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
                      ELSE
                        UPDATE patient_visits SET purpose_of_call = NULL, purpose_of_call_enc_id = NULL WHERE patient_visits.id = in_visit_id;
                      END IF;
                    ELSE
                        SET @enc_id = encounter_id;
                END CASE;
            END IF;

          WHEN @pregnancy_status THEN

              SET @pregnancy_status1 = (SELECT COALESCE(pregnancy_status, '') FROM patient_visits WHERE ID = in_visit_id);

              IF in_visit_id = 0 THEN
                  CASE
                      WHEN @pregnancy_status1 = "" THEN
                        INSERT INTO patient_visits (patient_id, visit_date, pregnancy_status, pregnancy_status_enc_id)
                        VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                      ELSE
                        SET @enc_id = encounter_id;
                  END CASE;
              ELSE
                  CASE
                      WHEN @pregnancy_status1  = "" THEN
                        IF in_field_voided = 0 THEN
                          UPDATE patient_visits SET pregnancy_status = in_field_value_text, pregnancy_status_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
                        ELSE
                          UPDATE patient_visits SET pregnancy_status = NULL, pregnancy_status_enc_id = NULL WHERE patient_visits.id = in_visit_id;
                        END IF;
                      ELSE
                          SET @enc_id = encounter_id;
                  END CASE;

              END IF;

          WHEN @estimated_date_of_delivery THEN

              SET @estimated_date_of_delivery1 = (SELECT COALESCE(estimated_date_of_delivery, '') FROM patient_visits WHERE ID = in_visit_id);

              IF in_visit_id = 0 THEN
                  CASE
                      WHEN @estimated_date_of_delivery1 = "" THEN
                        INSERT INTO patient_visits (patient_id, visit_date, estimated_date_of_delivery, estimated_date_of_delivery_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                      ELSE
                        SET @enc_id = encounter_id;
                  END CASE;
              ELSE
                  CASE
                      WHEN @estimated_date_of_delivery1  = "" THEN
                        IF in_field_voided = 0 THEN
                          UPDATE patient_visits SET estimated_date_of_delivery = in_field_value_text, estimated_date_of_delivery_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
                        ELSE
                          UPDATE patient_visits SET estimated_date_of_delivery = NULL, estimated_date_of_delivery_enc_id = NULL WHERE patient_visits.id = in_visit_id;
                        END IF;
                      ELSE
                          SET @enc_id = encounter_id;
                  END CASE;
              END IF;

          WHEN @pregnancy_status_delivery_date THEN

              SET @pregnancy_status_delivery_date1 = (SELECT COALESCE(pregnancy_status_delivery_date, '') FROM patient_visits WHERE ID = in_visit_id);

              IF in_visit_id = 0 THEN
                  CASE
                      WHEN @pregnancy_status_delivery_date1 = "" THEN
                        INSERT INTO patient_visits (patient_id, visit_date, pregnancy_status_delivery_date, pregnancy_status_delivery_date_enc_id)
                        VALUES (in_patient_id, in_visit_date, in_field_value_datetime, encounter_id);
                      ELSE
                        SET @enc_id = encounter_id;
                  END CASE;
              ELSE
                  CASE
                      WHEN @pregnancy_status_delivery_date1  = "" THEN
                        IF in_field_voided = 0 THEN
                          UPDATE patient_visits SET pregnancy_status_delivery_date = in_field_value_text, pregnancy_status_delivery_date_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
                        ELSE
                          UPDATE patient_visits SET pregnancy_status_delivery_date = NULL, pregnancy_status_delivery_date_enc_id = NULL WHERE patient_visits.id = in_visit_id;
                        END IF;
                      ELSE
                          SET @enc_id = encounter_id;
                  END CASE;
              END IF;

          WHEN @general_outcome THEN
            SET @general_outcome1 = (SELECT COALESCE(general_outcome, '') FROM patient_visits WHERE ID = in_visit_id);
              IF in_visit_id = 0 THEN
                                  CASE
                                      WHEN @general_outcome1 = "" THEN
                                        INSERT INTO patient_visits (patient_id, visit_date, general_outcome, general_outcome_enc_id)
                                        VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                                      ELSE
                                        SET @enc_id = encounter_id;
                                  END CASE;
                              ELSE
                                  CASE
                                      WHEN @general_outcome1  = "" THEN
                                        IF in_field_voided = 0 THEN
                                          UPDATE patient_visits
                                          SET general_outcome = in_field_value_text, general_outcome_enc_id = encounter_id
                                          WHERE patient_visits.id = in_visit_id;
                                        ELSE
                                          UPDATE patient_visits
                                          SET general_outcome = NULL, general_outcome_enc_id = NULL
                                          WHERE patient_visits.id = in_visit_id;
                                        END IF;
                                      ELSE
                                          SET @enc_id = encounter_id;
                                  END CASE;
                              END IF;

          WHEN @healthy_facility_name THEN

                                  SET @healthy_facility_name1 = (SELECT COALESCE(healthy_facility_name, '') FROM patient_visits WHERE ID = in_visit_id);

                                  IF in_visit_id = 0 THEN
                                      CASE
                                          WHEN @healthy_facility_name1 = "" THEN
                                            INSERT INTO patient_visits (patient_id, visit_date, healthy_facility_name, healthy_facility_name_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                                          ELSE
                                            SET @enc_id = encounter_id;
                                      END CASE;
                                  ELSE
                                      CASE
                                          WHEN @healthy_facility_name1  = "" THEN
                                            IF in_field_voided = 0 THEN
                                              UPDATE patient_visits SET healthy_facility_name = in_field_value_text, healthy_facility_name_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
                                            ELSE
                                              UPDATE patient_visits SET healthy_facility_name = NULL, healthy_facility_name_enc_id = NULL WHERE patient_visits.id = in_visit_id;
                                            END IF;
                                          ELSE
                                              SET @enc_id = encounter_id;
                                      END CASE;
                                  END IF;

          WHEN @reason_for_referral THEN

                                      SET @reason_for_referral1 = (SELECT COALESCE(reason_for_referral, '') FROM patient_visits WHERE ID = in_visit_id);

                                      IF in_visit_id = 0 THEN
                                          CASE
                                              WHEN @reason_for_referral1 = "" THEN
                                                INSERT INTO patient_visits (patient_id, visit_date, reason_for_referral, reason_for_referral_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                                              ELSE
                                                SET @enc_id = encounter_id;
                                          END CASE;
                                      ELSE
                                          CASE
                                              WHEN @reason_for_referral1  = "" THEN
                                                IF in_field_voided = 0 THEN
                                                  UPDATE patient_visits SET reason_for_referral = in_field_value_text, reason_for_referral_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
                                                ELSE
                                                  UPDATE patient_visits SET reason_for_referral = NULL, reason_for_referral_enc_id = NULL WHERE patient_visits.id = in_visit_id;
                                                END IF;
                                              ELSE
                                                  SET @enc_id = encounter_id;
                                          END CASE;
                                      END IF;

          WHEN @secondary_outcome THEN
            SET @secondary_outcome1 = (SELECT COALESCE(secondary_outcome, '') FROM patient_visits WHERE ID = in_visit_id);
            IF in_visit_id = 0 THEN
                CASE
                  WHEN @secondary_outcome1 = "" THEN
                    INSERT INTO patient_visits (patient_id, visit_date, secondary_outcome, secondary_outcome_enc_id)
                    VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                ELSE
                  SET @enc_id = encounter_id;
                END CASE;
            ELSE
                CASE
                  WHEN @secondary_outcome1  = "" THEN
                    IF in_field_voided = 0 THEN
                      UPDATE patient_visits
                      SET secondary_outcome = in_field_value_text, secondary_outcome_enc_id = encounter_id
                      WHERE patient_visits.id = in_visit_id;
                    ELSE
                      UPDATE patient_visits
                      SET secondary_outcome = NULL, secondary_outcome_enc_id = NULL
                      WHERE patient_visits.id = in_visit_id;
                    END IF;
                ELSE
                  SET @enc_id = encounter_id;
                END CASE;
            END IF;

          WHEN @tips_telephone_number THEN

                                              SET @tips_telephone_number1 = (SELECT COALESCE(tips_telephone_number, '') FROM patient_visits WHERE ID = in_visit_id);

                                              IF in_visit_id = 0 THEN
                                                  CASE
                                                      WHEN @tips_telephone_number1 = "" THEN
                                                        INSERT INTO patient_visits (patient_id, visit_date, tips_telephone_number, tips_telephone_number_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                                                      ELSE
                                                        SET @enc_id = encounter_id;
                                                  END CASE;
                                              ELSE
                                                  CASE
                                                      WHEN @tips_telephone_number1  = "" THEN
                                                        IF in_field_voided = 0 THEN
                                                          UPDATE patient_visits SET tips_telephone_number = in_field_value_text, tips_telephone_number_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
                                                        ELSE
                                                          UPDATE patient_visits SET tips_telephone_number = NULL, tips_telephone_number_enc_id = NULL WHERE patient_visits.id = in_visit_id;
                                                        END IF;
                                                      ELSE
                                                          SET @enc_id = encounter_id;
                                                  END CASE;
                                              END IF;

          WHEN @tips_telephone_number_type THEN

                                                SET @tips_telephone_number_type1 = (SELECT COALESCE(tips_telephone_number_type, '') FROM patient_visits WHERE ID = in_visit_id);

                                                IF in_visit_id = 0 THEN
                                                    CASE
                                                        WHEN @tips_telephone_number_type1 = "" THEN
                                                          INSERT INTO patient_visits (patient_id, visit_date, tips_telephone_number_type, tips_telephone_number_type_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                                                        ELSE
                                                          SET @enc_id = encounter_id;
                                                    END CASE;
                                                ELSE
                                                    CASE
                                                        WHEN @tips_telephone_number_type1  = "" THEN
                                                          IF in_field_voided = 0 THEN
                                                            UPDATE patient_visits SET tips_telephone_number_type = in_field_value_text, tips_telephone_number_type_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
                                                          ELSE
                                                            UPDATE patient_visits SET tips_telephone_number_type = NULL, tips_telephone_number_type_enc_id = NULL WHERE patient_visits.id = in_visit_id;
                                                          END IF;
                                                        ELSE
                                                            SET @enc_id = encounter_id;
                                                    END CASE;
                                                END IF;

          WHEN @on_tips_and_reminders_program THEN

            SET @on_tips_and_reminders_program1 = (SELECT COALESCE(on_tips_and_reminders_program, '') FROM patient_visits WHERE ID = in_visit_id);

                                                    IF in_visit_id = 0 THEN
                                                        CASE
                                                            WHEN @on_tips_and_reminders_program1 = "" THEN
                                                              INSERT INTO patient_visits (patient_id, visit_date, on_tips_and_reminders_program, on_tips_and_reminders_program_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                                                            ELSE
                                                              SET @enc_id = encounter_id;
                                                        END CASE;
                                                    ELSE
                                                        CASE
                                                            WHEN @on_tips_and_reminders_program1  = "" THEN
                                                              IF in_field_voided = 0 THEN
                                                                UPDATE patient_visits SET on_tips_and_reminders_program = in_field_value_text, on_tips_and_reminders_program_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
                                                              ELSE
                                                                UPDATE patient_visits SET on_tips_and_reminders_program = NULL, on_tips_and_reminders_program_enc_id = NULL WHERE patient_visits.id = in_visit_id;
                                                              END IF;
                                                            ELSE
                                                                SET @enc_id = encounter_id;
                                                        END CASE;
                                                    END IF;

          WHEN @tips_language_preference THEN

              SET @tips_language_preference1 = (SELECT COALESCE(tips_language_preference, '') FROM patient_visits WHERE ID = in_visit_id);

              IF in_visit_id = 0 THEN
                  CASE
                      WHEN @tips_language_preference1 = "" THEN
                        INSERT INTO patient_visits (patient_id, visit_date, tips_language_preference, tips_language_preference_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                      ELSE
                        SET @enc_id = encounter_id;
                  END CASE;
              ELSE
                  CASE
                      WHEN @tips_language_preference1  = "" THEN
                        IF in_field_voided = 0 THEN
                          UPDATE patient_visits SET tips_language_preference = in_field_value_text, tips_language_preference_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
                        ELSE
                          UPDATE patient_visits SET tips_language_preference = NULL, tips_language_preference_enc_id = NULL WHERE patient_visits.id = in_visit_id;
                        END IF;
                      ELSE
                          SET @enc_id = encounter_id;
                  END CASE;
              END IF;

          WHEN @tips_type_of_message THEN

              SET @tips_type_of_message1 = (SELECT COALESCE(tips_type_of_message, '') FROM patient_visits WHERE ID = in_visit_id);

              IF in_visit_id = 0 THEN
                  CASE
                      WHEN @tips_type_of_message1 = "" THEN
                        INSERT INTO patient_visits (patient_id, visit_date, tips_type_of_message, tips_type_of_message_enc_id)
                        VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                      ELSE
                        SET @enc_id = encounter_id;
                  END CASE;
              ELSE
                  CASE
                      WHEN @tips_type_of_message1  = "" THEN
                        IF in_field_voided = 0 THEN
                          UPDATE patient_visits SET tips_type_of_message = in_field_value_text, tips_type_of_message_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
                        ELSE
                          UPDATE patient_visits SET tips_type_of_message = NULL, tips_type_of_message_enc_id = NULL WHERE patient_visits.id = in_visit_id;
                        END IF;
                      ELSE
                          SET @enc_id = encounter_id;
                  END CASE;
              END IF;

          WHEN @tips_type_of_message_content THEN

              SET @tips_type_of_message_content1 = (SELECT COALESCE(tips_type_of_message_content, '') FROM patient_visits WHERE ID = in_visit_id);

              IF in_visit_id = 0 THEN
                  CASE
                      WHEN @tips_type_of_message_content1 = "" THEN
                        INSERT INTO patient_visits (patient_id, visit_date, tips_type_of_message_content, tips_type_of_message_content_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                      ELSE
                        SET @enc_id = encounter_id;
                  END CASE;
              ELSE
                  CASE
                      WHEN @tips_type_of_message_content1  = "" THEN
                        IF in_field_voided = 0 THEN
                          UPDATE patient_visits SET tips_type_of_message_content = in_field_value_text, tips_type_of_message_content_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
                        ELSE
                          UPDATE patient_visits SET tips_type_of_message_content = NULL, tips_type_of_message_content_enc_id = NULL WHERE patient_visits.id = in_visit_id;
                        END IF;
                      ELSE
                          SET @enc_id = encounter_id;
                  END CASE;
              END IF;

          WHEN @birth_plan_delivery_location THEN

              SET @birth_plan_delivery_location1 = (SELECT COALESCE(birth_plan_delivery_location, '') FROM patient_visits WHERE ID = in_visit_id);

              IF in_visit_id = 0 THEN
                  CASE
                      WHEN @birth_plan_delivery_location1 = "" THEN
                        INSERT INTO patient_visits (patient_id, visit_date, birth_plan_delivery_location, birth_plan_delivery_location_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                      ELSE
                        SET @enc_id = encounter_id;
                  END CASE;
              ELSE
                  CASE
                      WHEN @birth_plan_delivery_location1  = "" THEN
                        IF in_field_voided = 0 THEN
                          UPDATE patient_visits SET birth_plan_delivery_location = in_field_value_text, birth_plan_delivery_location_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
                        ELSE
                          UPDATE patient_visits SET birth_plan_delivery_location = NULL, birth_plan_delivery_location_enc_id = NULL WHERE patient_visits.id = in_visit_id;
                        END IF;
                      ELSE
                          SET @enc_id = encounter_id;
                  END CASE;
              END IF;

          WHEN @birth_plan_go_to_hospital_date THEN

              SET @birth_plan_go_to_hospital_date1 = (SELECT COALESCE(birth_plan_go_to_hospital_date, '') FROM patient_visits WHERE ID = in_visit_id);

              IF in_visit_id = 0 THEN
                  CASE
                      WHEN @birth_plan_go_to_hospital_date1 = "" THEN
                        INSERT INTO patient_visits (patient_id, visit_date, birth_plan_go_to_hospital_date, birth_plan_go_to_hospital_date_enc_id)
                        VALUES (in_patient_id, in_visit_date, in_field_value_datetime, encounter_id);
                      ELSE
                        SET @enc_id = encounter_id;
                  END CASE;
              ELSE
                  CASE
                      WHEN @birth_plan_go_to_hospital_date1  = "" THEN
                        IF in_field_voided = 0 THEN
                          UPDATE patient_visits SET birth_plan_go_to_hospital_date = in_field_value_text, birth_plan_go_to_hospital_date_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
                        ELSE
                          UPDATE patient_visits SET birth_plan_go_to_hospital_date = NULL, birth_plan_go_to_hospital_date_enc_id = NULL WHERE patient_visits.id = in_visit_id;
                        END IF;
                      ELSE
                          SET @enc_id = encounter_id;
                  END CASE;
              END IF;

          WHEN @birth_plan THEN

              SET @birth_plan1 = (SELECT COALESCE(birth_plan, '') FROM patient_visits WHERE ID = in_visit_id);

              IF in_visit_id = 0 THEN
                  CASE
                      WHEN @birth_plan1 = "" THEN
                        INSERT INTO patient_visits (patient_id, visit_date, birth_plan, birth_plan_enc_id)
                        VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                      ELSE
                        SET @enc_id = encounter_id;
                  END CASE;
              ELSE
                  CASE
                      WHEN @birth_plan1  = "" THEN
                        IF in_field_voided = 0 THEN
                          UPDATE patient_visits SET birth_plan = in_field_value_text, birth_plan_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
                        ELSE
                          UPDATE patient_visits SET birth_plan = NULL, birth_plan_enc_id = NULL WHERE patient_visits.id = in_visit_id;
                        END IF;
                      ELSE
                          SET @enc_id = encounter_id;
                  END CASE;
              END IF;

          WHEN @antenatal_clinic_patient_appointment THEN

              SET @antenatal_clinic_patient_appointment1 = (SELECT COALESCE(antenatal_clinic_patient_appointment, '') FROM patient_visits WHERE ID = in_visit_id);

              IF in_visit_id = 0 THEN
                  CASE
                      WHEN @antenatal_clinic_patient_appointment1 = "" THEN
                        INSERT INTO patient_visits (patient_id, visit_date, antenatal_clinic_patient_appointment, antenatal_clinic_patient_appointment_enc_id)
                        VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                      ELSE
                        SET @enc_id = encounter_id;
                  END CASE;
              ELSE
                  CASE
                      WHEN @antenatal_clinic_patient_appointment1  = "" THEN
                        IF in_field_voided = 0 THEN
                          UPDATE patient_visits SET antenatal_clinic_patient_appointment = in_field_value_text, antenatal_clinic_patient_appointment_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
                        ELSE
                          UPDATE patient_visits SET antenatal_clinic_patient_appointment = NULL, antenatal_clinic_patient_appointment_enc_id = NULL WHERE patient_visits.id = in_visit_id;
                        END IF;
                      ELSE
                          SET @enc_id = encounter_id;
                  END CASE;
              END IF;

          WHEN @last_ANC_visit_date THEN

              SET @last_ANC_visit_date1 = (SELECT COALESCE(last_ANC_visit_date, '') FROM patient_visits WHERE ID = in_visit_id);

              IF in_visit_id = 0 THEN
                  CASE
                      WHEN @last_ANC_visit_date1 = "" THEN
                        INSERT INTO patient_visits (patient_id, visit_date, last_ANC_visit_date, last_ANC_visit_date_enc_id)
                         VALUES (in_patient_id, in_visit_date, in_field_value_datetime, encounter_id);
                      ELSE
                        SET @enc_id = encounter_id;
                  END CASE;
              ELSE
                  CASE
                      WHEN @last_ANC_visit_date1 = ""  THEN
                        IF in_field_voided = 0 THEN
                          UPDATE patient_visits SET last_ANC_visit_date = in_field_value_datetime, last_ANC_visit_date_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
                        ELSE
                          UPDATE patient_visits SET last_ANC_visit_date = NULL, last_ANC_visit_date_enc_id = NULL WHERE patient_visits.id = in_visit_id;
                        END IF;
                      ELSE
                          SET @enc_id = encounter_id;
                  END CASE;
              END IF;

          WHEN @next_ANC_visit_date THEN

              SET @next_ANC_visit_date1 = (SELECT COALESCE(next_ANC_visit_date, '') FROM patient_visits WHERE ID = in_visit_id);

              IF in_visit_id = 0 THEN
                  CASE
                      WHEN @next_ANC_visit_date1 = "" THEN
                        INSERT INTO patient_visits (patient_id, visit_date, next_ANC_visit_date, next_ANC_visit_date_enc_id)
                        VALUES (in_patient_id, in_visit_date, in_field_value_datetime, encounter_id);
                      ELSE
                        SET @enc_id = encounter_id;
                  END CASE;
              ELSE
                  CASE
                      WHEN @next_ANC_visit_date1 = ""  THEN
                        IF in_field_voided = 0 THEN
                          UPDATE patient_visits SET next_ANC_visit_date = in_field_value_datetime, next_ANC_visit_date_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
                        ELSE
                          UPDATE patient_visits SET next_ANC_visit_date = NULL, next_ANC_visit_date_enc_id = NULL WHERE patient_visits.id = in_visit_id;
                        END IF;
                      ELSE
                          SET @enc_id = encounter_id;
                  END CASE;
              END IF;

          WHEN @baby_delivered THEN

              SET @baby_delivered1 = (SELECT COALESCE(baby_delivered, '') FROM patient_visits WHERE ID = in_visit_id);

              IF in_visit_id = 0 THEN
                  CASE
                      WHEN @baby_delivered1 = "" THEN
                        INSERT INTO patient_visits (patient_id, visit_date, pregnancy_status, baby_delivered_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                      ELSE
                        SET @enc_id = encounter_id;
                  END CASE;
              ELSE
                  CASE
                      WHEN @baby_delivered1 = ""  THEN
                        IF in_field_voided = 0 THEN
                          UPDATE patient_visits SET baby_delivered = in_field_value_text, baby_delivered_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
                        ELSE
                          UPDATE patient_visits SET baby_delivered = NULL, baby_delivered_enc_id = NULL WHERE patient_visits.id = in_visit_id;
                        END IF;
                      ELSE
                          SET @enc_id = encounter_id;
                  END CASE;
              END IF;

          WHEN @baby_delivered_health_facility_name THEN

              SET @baby_delivered_health_facility_name1 = (SELECT COALESCE(baby_delivered_health_facility_name, '') FROM patient_visits WHERE ID = in_visit_id);

              IF in_visit_id = 0 THEN
                  CASE
                      WHEN @baby_delivered_health_facility_name1 = "" THEN
                        INSERT INTO patient_visits (patient_id, visit_date, pregnancy_status, baby_delivered_health_facility_name_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                      ELSE
                        SET @enc_id = encounter_id;
                  END CASE;
              ELSE
                  CASE
                      WHEN @baby_delivered_health_facility_name1 = ""  THEN
                        IF in_field_voided = 0 THEN
                          UPDATE patient_visits SET baby_delivered_health_facility_name = in_field_value_text, baby_delivered_health_facility_name_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
                        ELSE
                          UPDATE patient_visits SET baby_delivered_health_facility_name = NULL, baby_delivered_health_facility_name_enc_id = NULL WHERE patient_visits.id = in_visit_id;
                        END IF;
                      ELSE
                          SET @enc_id = encounter_id;
                  END CASE;
              END IF;

          WHEN @baby_delivered_delivery_date THEN

              SET @baby_delivered_delivery_date1 = (SELECT COALESCE(baby_delivered_delivery_date, '') FROM patient_visits WHERE ID = in_visit_id);

              IF in_visit_id = 0 THEN
                  CASE
                      WHEN @baby_delivered_delivery_date1 = "" THEN
                        INSERT INTO patient_visits (patient_id, visit_date, pregnancy_status, baby_delivered_delivery_date_enc_id)
                         VALUES (in_patient_id, in_visit_date, in_field_value_datetime, encounter_id);
                      ELSE
                        SET @enc_id = encounter_id;
                  END CASE;
              ELSE
                  CASE
                      WHEN @baby_delivered_delivery_date1 = "" THEN
                        IF in_field_voided = 0 THEN
                          UPDATE patient_visits
                          SET baby_delivered_delivery_date = in_field_value_datetime, baby_delivered_delivery_date_enc_id = encounter_id
                          WHERE patient_visits.id = in_visit_id;
                        ELSE
                          UPDATE patient_visits
                          SET baby_delivered_delivery_date = NULL, baby_delivered_delivery_date_enc_id = NULL
                          WHERE patient_visits.id = in_visit_id;
                        END IF;
                      ELSE
                          SET @enc_id = encounter_id;
                  END CASE;
              END IF;

          WHEN @baby_delivered_delivery_location THEN

              SET @baby_delivered_delivery_location1 = (SELECT COALESCE(baby_delivered_delivery_location, '') FROM patient_visits WHERE ID = in_visit_id);

              IF in_visit_id = 0 THEN
                  CASE
                      WHEN @baby_delivered_delivery_location1 = "" THEN
                        INSERT INTO patient_visits (patient_id, visit_date, pregnancy_status, baby_delivered_delivery_location_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                      ELSE
                        SET @enc_id = encounter_id;
                  END CASE;
              ELSE
                  CASE
                      WHEN @baby_delivered_delivery_location1 = ""  THEN
                        IF in_field_voided = 0 THEN
                          UPDATE patient_visits SET baby_delivered_delivery_location = in_field_value_text, baby_delivered_delivery_location_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
                        ELSE
                          UPDATE patient_visits SET baby_delivered_delivery_location = NULL, baby_delivered_delivery_location_enc_id = NULL WHERE patient_visits.id = in_visit_id;
                        END IF;
                      ELSE
                          SET @enc_id = encounter_id;
                  END CASE;
              END IF;
            ELSE

              SET @enc_id = encounter_id;

      END CASE;
    END IF;
END$$

DELIMITER ;
