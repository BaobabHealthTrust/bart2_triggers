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

    SET @maternal_Hsymptoms = COALESCE((SELECT encounter_type FROM encounter WHERE encounter_id = encounter_id
                               AND encounter_type = (SELECT encounter_type_id FROM encounter_type WHERE name = 'MATERNAL HEALTH INFORMATION')), 0);

    IF (@maternal_Hsymptoms = 0) THEN
      SET @concept_id_id = in_field_concept;
    ELSE
      SET @ds_concept_id = (
              SELECT in_field_concept IN ((SELECT concept_id FROM concept_set WHERE concept_set = (SELECT concept_name.concept_id FROM concept_name concept_name
                LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
              WHERE name = 'Danger sign' AND voided = 0 AND retired = 0
              LIMIT 1))));

      IF @ds_concept_id THEN
        SET @danger_sign_concept_id = (in_field_concept);
      END IF;

      SET @hs_concept_id = (
              SELECT in_field_concept IN ((SELECT concept_id FROM concept_set WHERE concept_set = (SELECT concept_name.concept_id FROM concept_name concept_name
                LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
              WHERE name = 'Health symptom' AND voided = 0 AND retired = 0
              LIMIT 1))));

      IF @hs_concept_id THEN
        SET @health_symptom_concept_id = (in_field_concept);
      END IF;

      SET @hinf_concept_id = (
              SELECT in_field_concept IN ((SELECT concept_id FROM concept_set WHERE concept_set = (SELECT concept_name.concept_id FROM concept_name concept_name
                LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
              WHERE name = 'Health information' AND voided = 0 AND retired = 0
              LIMIT 1))));

      IF @hinf_concept_id THEN
        SET @health_information_concept_id = (in_field_concept);
      END IF;
    END IF;

    IF (in_field_voided = 0) THEN
      CASE in_field_concept

          WHEN @danger_sign_concept_id THEN
            SET @danger_sign1 = (SELECT COALESCE(danger_sign1, '') FROM patient_visits WHERE ID = in_visit_id);
            SET @danger_sign2 = (SELECT COALESCE(danger_sign2, '') FROM patient_visits WHERE ID = in_visit_id);
            SET @danger_sign3 = (SELECT COALESCE(danger_sign3, '') FROM patient_visits WHERE ID = in_visit_id);
            SET @danger_sign4 = (SELECT COALESCE(danger_sign4, '') FROM patient_visits WHERE ID = in_visit_id);
            SET @danger_sign5 = (SELECT COALESCE(danger_sign5, '') FROM patient_visits WHERE ID = in_visit_id);
            SET @danger_sign6 = (SELECT COALESCE(danger_sign6, '') FROM patient_visits WHERE ID = in_visit_id);

            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);

            IF in_visit_id = 0 THEN
              CASE
                WHEN @danger_sign1 = "" THEN
                  INSERT INTO patient_visits (patient_id, visit_date, danger_sign1, danger_sign_enc_id1)
                  VALUES (in_patient_id, in_visit_date, @value, encounter_id);

                WHEN @danger_sign2 = "" THEN
                  INSERT INTO patient_visits (patient_id, visit_date, danger_sign2, danger_sign_enc_id2)
                  VALUES (in_patient_id, in_visit_date, @value, encounter_id);

                WHEN @danger_sign3 = "" THEN
                  INSERT INTO patient_visits (patient_id, visit_date, danger_sign3, danger_sign_enc_id3)
                  VALUES (in_patient_id, in_visit_date, @value, encounter_id);

                WHEN @danger_sign4 = "" THEN
                  INSERT INTO patient_visits (patient_id, visit_date, danger_sign4, danger_sign_enc_id4)
                  VALUES (in_patient_id, in_visit_date, @value, encounter_id);

                WHEN @danger_sign5 = "" THEN
                  INSERT INTO patient_visits (patient_id, visit_date, danger_sign5, danger_sign_enc_id5)
                  VALUES (in_patient_id, in_visit_date, @value, encounter_id);

                WHEN @danger_sign6 = "" THEN
                  INSERT INTO patient_visits (patient_id, visit_date, danger_sign6, danger_sign_enc_id6)
                  VALUES (in_patient_id, in_visit_date, @value, encounter_id);
              ELSE
                SET @enc_id = encounter_id;
              END CASE;
            ELSE
              CASE
                WHEN @danger_sign1 = "" THEN
                  IF in_field_voided = 0 THEN
                    UPDATE patient_visits SET danger_sign1 = @value, danger_sign_enc_id1 = encounter_id
                    WHERE patient_visits.id = in_visit_id;
                  ELSE
                    UPDATE patient_visits SET danger_sign1 = NULL, danger_sign_enc_id1 = NULL
                    WHERE patient_visits.id = in_visit_id;
                  END IF;

                WHEN @danger_sign2 = "" THEN
                  IF in_field_voided = 0 THEN
                    UPDATE patient_visits SET danger_sign2 = @value, danger_sign_enc_id2 = encounter_id
                    WHERE patient_visits.id = in_visit_id;
                  ELSE
                    UPDATE patient_visits SET danger_sign2 = NULL, danger_sign_enc_id2 = NULL
                    WHERE patient_visits.id = in_visit_id;
                  END IF;

                WHEN @danger_sign3 = "" THEN
                  IF in_field_voided = 0 THEN
                    UPDATE patient_visits SET danger_sign3 = @value, danger_sign_enc_id3 = encounter_id
                    WHERE patient_visits.id = in_visit_id;
                  ELSE
                    UPDATE patient_visits SET danger_sign3 = NULL, danger_sign_enc_id3 = NULL
                    WHERE patient_visits.id = in_visit_id;
                  END IF;

                WHEN @danger_sign4 = "" THEN
                  IF in_field_voided = 0 THEN
                    UPDATE patient_visits SET danger_sign4 = @value, danger_sign_enc_id4 = encounter_id
                    WHERE patient_visits.id = in_visit_id;
                  ELSE
                    UPDATE patient_visits SET danger_sign4 = NULL, danger_sign_enc_id4 = NULL
                    WHERE patient_visits.id = in_visit_id;
                  END IF;

                WHEN @danger_sign5 = "" THEN
                  IF in_field_voided = 0 THEN
                    UPDATE patient_visits SET danger_sign5 = @value, danger_sign_enc_id5 = encounter_id
                    WHERE patient_visits.id = in_visit_id;
                  ELSE
                    UPDATE patient_visits SET danger_sign5 = NULL, danger_sign_enc_id5 = NULL
                    WHERE patient_visits.id = in_visit_id;
                  END IF;

                WHEN @danger_sign6 = "" THEN
                  IF in_field_voided = 0 THEN
                    UPDATE patient_visits SET danger_sign6 = @value, danger_sign_enc_id6 = encounter_id
                    WHERE patient_visits.id = in_visit_id;
                  ELSE
                    UPDATE patient_visits SET danger_sign6 = NULL, danger_sign_enc_id6 = NULL
                    WHERE patient_visits.id = in_visit_id;
                  END IF;
              ELSE
                SET @enc_id = encounter_id;
              END CASE;
           END IF;
          #######################################################################################################################################

          WHEN @health_symptom_concept_id THEN
            SET @health_symptom1 = (SELECT COALESCE(health_symptom1, '') FROM patient_visits WHERE ID = in_visit_id);
            SET @health_symptom2 = (SELECT COALESCE(health_symptom2, '') FROM patient_visits WHERE ID = in_visit_id);
            SET @health_symptom3 = (SELECT COALESCE(health_symptom3, '') FROM patient_visits WHERE ID = in_visit_id);
            SET @health_symptom4 = (SELECT COALESCE(health_symptom4, '') FROM patient_visits WHERE ID = in_visit_id);
            SET @health_symptom5 = (SELECT COALESCE(health_symptom5, '') FROM patient_visits WHERE ID = in_visit_id);
            SET @health_symptom6 = (SELECT COALESCE(health_symptom6, '') FROM patient_visits WHERE ID = in_visit_id);

            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);

            IF in_visit_id = 0 THEN
              CASE
                WHEN @health_symptom1 = "" THEN
                  INSERT INTO patient_visits (patient_id, visit_date, health_symptom1, health_symptom_enc_id1)
                  VALUES (in_patient_id, in_visit_date, @value, encounter_id);

                WHEN @health_symptom2 = "" THEN
                  INSERT INTO patient_visits (patient_id, visit_date, health_symptom2, health_symptom_enc_id2)
                  VALUES (in_patient_id, in_visit_date, @value, encounter_id);

                WHEN @health_symptom3 = "" THEN
                  INSERT INTO patient_visits (patient_id, visit_date, health_symptom3, health_symptom_enc_id3)
                  VALUES (in_patient_id, in_visit_date, @value, encounter_id);

                WHEN @health_symptom4 = "" THEN
                  INSERT INTO patient_visits (patient_id, visit_date, health_symptom4, health_symptom_enc_id4)
                  VALUES (in_patient_id, in_visit_date, @value, encounter_id);

                WHEN @health_symptom5 = "" THEN
                  INSERT INTO patient_visits (patient_id, visit_date, health_symptom5, health_symptom_enc_id5)
                  VALUES (in_patient_id, in_visit_date, @value, encounter_id);

                WHEN @health_symptom6 = "" THEN
                  INSERT INTO patient_visits (patient_id, visit_date, health_symptom6, health_symptom_enc_id6)
                  VALUES (in_patient_id, in_visit_date, @value, encounter_id);
              ELSE
                SET @enc_id = encounter_id;
              END CASE;
            ELSE
              CASE
                WHEN @health_symptom1 = "" THEN
                  IF in_field_voided = 0 THEN
                    UPDATE patient_visits SET health_symptom1 = @value, health_symptom_enc_id1 = encounter_id
                    WHERE patient_visits.id = in_visit_id;
                  ELSE
                    UPDATE patient_visits SET health_symptom1 = NULL, health_symptom_enc_id1 = NULL
                    WHERE patient_visits.id = in_visit_id;
                  END IF;

                WHEN @health_symptom2 = "" THEN
                  IF in_field_voided = 0 THEN
                    UPDATE patient_visits SET health_symptom2 = @value, health_symptom_enc_id2 = encounter_id
                    WHERE patient_visits.id = in_visit_id;
                  ELSE
                    UPDATE patient_visits SET health_symptom2 = NULL, health_symptom_enc_id2 = NULL
                    WHERE patient_visits.id = in_visit_id;
                  END IF;

                WHEN @health_symptom3 = "" THEN
                  IF in_field_voided = 0 THEN
                    UPDATE patient_visits SET health_symptom3 = @value, health_symptom_enc_id3 = encounter_id
                    WHERE patient_visits.id = in_visit_id;
                  ELSE
                    UPDATE patient_visits SET health_symptom3 = NULL, health_symptom_enc_id3 = NULL
                    WHERE patient_visits.id = in_visit_id;
                  END IF;

                WHEN @health_symptom4 = "" THEN
                  IF in_field_voided = 0 THEN
                    UPDATE patient_visits SET health_symptom4 = @value, health_symptom_enc_id4 = encounter_id
                    WHERE patient_visits.id = in_visit_id;
                  ELSE
                    UPDATE patient_visits SET health_symptom4 = NULL, health_symptom_enc_id4 = NULL
                    WHERE patient_visits.id = in_visit_id;
                  END IF;

                WHEN @health_symptom5 = "" THEN
                  IF in_field_voided = 0 THEN
                    UPDATE patient_visits SET health_symptom5 = @value, health_symptom_enc_id5 = encounter_id
                    WHERE patient_visits.id = in_visit_id;
                  ELSE
                    UPDATE patient_visits SET health_symptom5 = NULL, health_symptom_enc_id5 = NULL
                    WHERE patient_visits.id = in_visit_id;
                  END IF;

                WHEN @health_symptom6 = "" THEN
                  IF in_field_voided = 0 THEN
                    UPDATE patient_visits SET health_symptom6 = @value, health_symptom_enc_id6 = encounter_id
                    WHERE patient_visits.id = in_visit_id;
                  ELSE
                    UPDATE patient_visits SET health_symptom6 = NULL, health_symptom_enc_id6 = NULL
                    WHERE patient_visits.id = in_visit_id;
                  END IF;
              ELSE
                SET @enc_id = encounter_id;
              END CASE;
           END IF;
          #######################################################################################################################################

          WHEN @health_information_concept_id THEN
            SET @health_information1 = (SELECT COALESCE(health_information1, '') FROM patient_visits WHERE ID = in_visit_id);
            SET @health_information2 = (SELECT COALESCE(health_information2, '') FROM patient_visits WHERE ID = in_visit_id);
            SET @health_information3 = (SELECT COALESCE(health_information3, '') FROM patient_visits WHERE ID = in_visit_id);
            SET @health_information4 = (SELECT COALESCE(health_information4, '') FROM patient_visits WHERE ID = in_visit_id);
            SET @health_information5 = (SELECT COALESCE(health_information5, '') FROM patient_visits WHERE ID = in_visit_id);
            SET @health_information6 = (SELECT COALESCE(health_information6, '') FROM patient_visits WHERE ID = in_visit_id);

            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);

            IF in_visit_id = 0 THEN
              CASE
                WHEN @health_information1 = "" THEN
                  INSERT INTO patient_visits (patient_id, visit_date, health_information1, health_information_enc_id1)
                  VALUES (in_patient_id, in_visit_date, @value, encounter_id);

                WHEN @health_information2 = "" THEN
                  INSERT INTO patient_visits (patient_id, visit_date, health_information2, health_information_enc_id2)
                  VALUES (in_patient_id, in_visit_date, @value, encounter_id);

                WHEN @health_information3 = "" THEN
                  INSERT INTO patient_visits (patient_id, visit_date, health_information3, health_information_enc_id3)
                  VALUES (in_patient_id, in_visit_date, @value, encounter_id);

                WHEN @health_information4 = "" THEN
                  INSERT INTO patient_visits (patient_id, visit_date, health_information4, health_information_enc_id4)
                  VALUES (in_patient_id, in_visit_date, @value, encounter_id);

                WHEN @health_information5 = "" THEN
                  INSERT INTO patient_visits (patient_id, visit_date, health_information5, health_information_enc_id5)
                  VALUES (in_patient_id, in_visit_date, @value, encounter_id);

                WHEN @health_information6 = "" THEN
                  INSERT INTO patient_visits (patient_id, visit_date, health_information6, health_information_enc_id6)
                  VALUES (in_patient_id, in_visit_date, @value, encounter_id);
              ELSE
                SET @enc_id = encounter_id;
              END CASE;
            ELSE
              CASE
                WHEN @health_information1 = "" THEN
                  IF in_field_voided = 0 THEN
                    UPDATE patient_visits SET health_information1 = @value, health_information_enc_id1 = encounter_id
                    WHERE patient_visits.id = in_visit_id;
                  ELSE
                    UPDATE patient_visits SET health_information1 = NULL, health_information_enc_id1 = NULL
                    WHERE patient_visits.id = in_visit_id;
                  END IF;

                WHEN @health_information2 = "" THEN
                  IF in_field_voided = 0 THEN
                    UPDATE patient_visits SET health_information2 = @value, health_information_enc_id2 = encounter_id
                    WHERE patient_visits.id = in_visit_id;
                  ELSE
                    UPDATE patient_visits SET health_information2 = NULL, health_information_enc_id2 = NULL
                    WHERE patient_visits.id = in_visit_id;
                  END IF;

                WHEN @health_information3 = "" THEN
                  IF in_field_voided = 0 THEN
                    UPDATE patient_visits SET health_information3 = @value, health_information_enc_id3 = encounter_id
                    WHERE patient_visits.id = in_visit_id;
                  ELSE
                    UPDATE patient_visits SET health_information3 = NULL, health_information_enc_id3 = NULL
                    WHERE patient_visits.id = in_visit_id;
                  END IF;

                WHEN @health_information4 = "" THEN
                  IF in_field_voided = 0 THEN
                    UPDATE patient_visits SET health_information4 = @value, health_information_enc_id4 = encounter_id
                    WHERE patient_visits.id = in_visit_id;
                  ELSE
                    UPDATE patient_visits SET health_information4 = NULL, health_information_enc_id4 = NULL
                    WHERE patient_visits.id = in_visit_id;
                  END IF;

                WHEN @health_information5 = "" THEN
                  IF in_field_voided = 0 THEN
                    UPDATE patient_visits SET health_information5 = @value, health_information_enc_id5 = encounter_id
                    WHERE patient_visits.id = in_visit_id;
                  ELSE
                    UPDATE patient_visits SET health_information5 = NULL, health_information_enc_id5 = NULL
                    WHERE patient_visits.id = in_visit_id;
                  END IF;

                WHEN @health_information6 = "" THEN
                  IF in_field_voided = 0 THEN
                    UPDATE patient_visits SET health_information6 = @value, health_information_enc_id6 = encounter_id
                    WHERE patient_visits.id = in_visit_id;
                  ELSE
                    UPDATE patient_visits SET health_information6 = NULL, health_information_enc_id6 = NULL
                    WHERE patient_visits.id = in_visit_id;
                  END IF;
              ELSE
                SET @enc_id = encounter_id;
              END CASE;
           END IF;
          #######################################################################################################################################

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
                      WHEN @call_id1 = "" = "" THEN
                        IF in_field_voided = 0 THEN
                          UPDATE patient_visits SET call_id = in_field_value_text, call_id_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
                        ELSE
                          UPDATE patient_visits SET call_id = NULL, call_id_enc_id = NULL WHERE patient_visits.id = in_visit_id;
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
                        INSERT INTO patient_visits (patient_id, visit_date, pregnancy_status, pregnancy_status_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                      ELSE
                        SET @enc_id = encounter_id;
                  END CASE;
              ELSE
                  CASE
                      WHEN @pregnancy_status1 = "" = "" THEN
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
                      WHEN @estimated_date_of_delivery1 = "" = "" THEN
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
                        INSERT INTO patient_visits (patient_id, visit_date, pregnancy_status, pregnancy_status_delivery_date_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                      ELSE
                        SET @enc_id = encounter_id;
                  END CASE;
              ELSE
                  CASE
                      WHEN @pregnancy_status_delivery_date1 = "" = "" THEN
                        IF in_field_voided = 0 THEN
                          UPDATE patient_visits SET pregnancy_status_delivery_date = in_field_value_text, pregnancy_status_delivery_date_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
                        ELSE
                          UPDATE patient_visits SET pregnancy_status_delivery_date = NULL, pregnancy_status_delivery_date_enc_id = NULL WHERE patient_visits.id = in_visit_id;
                        END IF;
                      ELSE
                          SET @enc_id = encounter_id;
                  END CASE;
              END IF;

          WHEN @danger_signs THEN

            SET @danger_signs1 = (SELECT COALESCE(danger_signs, '') FROM patient_visits WHERE ID = in_visit_id);

            IF in_visit_id = 0 THEN
                      CASE
                          WHEN @danger_signs1 = "" THEN
                            INSERT INTO patient_visits (patient_id, visit_date, pregnancy_status, danger_signs_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                          ELSE
                            SET @enc_id = encounter_id;
                      END CASE;
                  ELSE
                      CASE
                          WHEN @danger_signs1 = "" = "" THEN
                            IF in_field_voided = 0 THEN
                              UPDATE patient_visits SET danger_signs = in_field_value_text, danger_signs_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
                            ELSE
                              UPDATE patient_visits SET danger_signs = NULL, danger_signs_enc_id = NULL WHERE patient_visits.id = in_visit_id;
                            END IF;
                          ELSE
                              SET @enc_id = encounter_id;
                      END CASE;
                  END IF;

          WHEN @health_symptoms THEN

                      SET @health_symptoms1 = (SELECT COALESCE(health_symptoms, '') FROM patient_visits WHERE ID = in_visit_id);

                      IF in_visit_id = 0 THEN
                          CASE
                              WHEN @health_symptoms1 = "" THEN
                                INSERT INTO patient_visits (patient_id, visit_date, pregnancy_status, health_symptoms_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                              ELSE
                                SET @enc_id = encounter_id;
                          END CASE;
                      ELSE
                          CASE
                              WHEN @health_symptoms1 = "" = "" THEN
                                IF in_field_voided = 0 THEN
                                  UPDATE patient_visits SET health_symptoms = in_field_value_text, health_symptoms_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
                                ELSE
                                  UPDATE patient_visits SET health_symptoms = NULL, health_symptoms_enc_id = NULL WHERE patient_visits.id = in_visit_id;
                                END IF;
                              ELSE
                                  SET @enc_id = encounter_id;
                          END CASE;
                      END IF;

          WHEN @health_information THEN

                          SET @health_information1 = (SELECT COALESCE(health_information, '') FROM patient_visits WHERE ID = in_visit_id);

                          IF in_visit_id = 0 THEN
                              CASE
                                  WHEN @health_information1 = "" THEN
                                    INSERT INTO patient_visits (patient_id, visit_date, pregnancy_status, health_information_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                                  ELSE
                                    SET @enc_id = encounter_id;
                              END CASE;
                          ELSE
                              CASE
                                  WHEN @health_information1 = "" = "" THEN
                                    IF in_field_voided = 0 THEN
                                      UPDATE patient_visits SET health_information = in_field_value_text, health_information_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
                                    ELSE
                                      UPDATE patient_visits SET health_information = NULL, health_information_enc_id = NULL WHERE patient_visits.id = in_visit_id;
                                    END IF;
                                  ELSE
                                      SET @enc_id = encounter_id;
                              END CASE;
                          END IF;

          WHEN @outcome THEN

                              SET @outcome1 = (SELECT COALESCE(outcome, '') FROM patient_visits WHERE ID = in_visit_id);

                              IF in_visit_id = 0 THEN
                                  CASE
                                      WHEN @outcome1 = "" THEN
                                        INSERT INTO patient_visits (patient_id, visit_date, pregnancy_status, outcome_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                                      ELSE
                                        SET @enc_id = encounter_id;
                                  END CASE;
                              ELSE
                                  CASE
                                      WHEN @outcome1 = "" = "" THEN
                                        IF in_field_voided = 0 THEN
                                          UPDATE patient_visits SET outcome = in_field_value_text, outcome_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
                                        ELSE
                                          UPDATE patient_visits SET outcome = NULL, outcome_enc_id = NULL WHERE patient_visits.id = in_visit_id;
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
                                            INSERT INTO patient_visits (patient_id, visit_date, pregnancy_status, healthy_facility_name_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                                          ELSE
                                            SET @enc_id = encounter_id;
                                      END CASE;
                                  ELSE
                                      CASE
                                          WHEN @healthy_facility_name1 = "" = "" THEN
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
                                                INSERT INTO patient_visits (patient_id, visit_date, pregnancy_status, reason_for_referral_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                                              ELSE
                                                SET @enc_id = encounter_id;
                                          END CASE;
                                      ELSE
                                          CASE
                                              WHEN @reason_for_referral1 = "" = "" THEN
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
                                                    INSERT INTO patient_visits (patient_id, visit_date, pregnancy_status, secondary_outcome_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                                                  ELSE
                                                    SET @enc_id = encounter_id;
                                              END CASE;
                                          ELSE
                                              CASE
                                                  WHEN @secondary_outcome1 = "" = "" THEN
                                                    IF in_field_voided = 0 THEN
                                                      UPDATE patient_visits SET secondary_outcome = in_field_value_text, secondary_outcome_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
                                                    ELSE
                                                      UPDATE patient_visits SET secondary_outcome = NULL, secondary_outcome_enc_id = NULL WHERE patient_visits.id = in_visit_id;
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
                                                        INSERT INTO patient_visits (patient_id, visit_date, pregnancy_status, tips_telephone_number_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                                                      ELSE
                                                        SET @enc_id = encounter_id;
                                                  END CASE;
                                              ELSE
                                                  CASE
                                                      WHEN @tips_telephone_number1 = "" = "" THEN
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
                                                          INSERT INTO patient_visits (patient_id, visit_date, pregnancy_status, tips_telephone_number_type_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                                                        ELSE
                                                          SET @enc_id = encounter_id;
                                                    END CASE;
                                                ELSE
                                                    CASE
                                                        WHEN @tips_telephone_number_type1 = "" = "" THEN
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
                                                              INSERT INTO patient_visits (patient_id, visit_date, pregnancy_status, on_tips_and_reminders_program_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                                                            ELSE
                                                              SET @enc_id = encounter_id;
                                                        END CASE;
                                                    ELSE
                                                        CASE
                                                            WHEN @on_tips_and_reminders_program1 = "" = "" THEN
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
                        INSERT INTO patient_visits (patient_id, visit_date, pregnancy_status, tips_language_preference_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                      ELSE
                        SET @enc_id = encounter_id;
                  END CASE;
              ELSE
                  CASE
                      WHEN @tips_language_preference1 = "" = "" THEN
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
                        INSERT INTO patient_visits (patient_id, visit_date, pregnancy_status, tips_type_of_message_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                      ELSE
                        SET @enc_id = encounter_id;
                  END CASE;
              ELSE
                  CASE
                      WHEN @tips_type_of_message1 = "" = "" THEN
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
                        INSERT INTO patient_visits (patient_id, visit_date, pregnancy_status, tips_type_of_message_content_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                      ELSE
                        SET @enc_id = encounter_id;
                  END CASE;
              ELSE
                  CASE
                      WHEN @tips_type_of_message_content1 = "" = "" THEN
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
                        INSERT INTO patient_visits (patient_id, visit_date, pregnancy_status, birth_plan_delivery_location_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                      ELSE
                        SET @enc_id = encounter_id;
                  END CASE;
              ELSE
                  CASE
                      WHEN @birth_plan_delivery_location1 = "" = "" THEN
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
                        INSERT INTO patient_visits (patient_id, visit_date, pregnancy_status, birth_plan_go_to_hospital_date_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                      ELSE
                        SET @enc_id = encounter_id;
                  END CASE;
              ELSE
                  CASE
                      WHEN @birth_plan_go_to_hospital_date1 = "" = "" THEN
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
                        INSERT INTO patient_visits (patient_id, visit_date, pregnancy_status, birth_plan_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                      ELSE
                        SET @enc_id = encounter_id;
                  END CASE;
              ELSE
                  CASE
                      WHEN @birth_plan1 = "" = "" THEN
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
                        INSERT INTO patient_visits (patient_id, visit_date, pregnancy_status, antenatal_clinic_patient_appointment_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                      ELSE
                        SET @enc_id = encounter_id;
                  END CASE;
              ELSE
                  CASE
                      WHEN @antenatal_clinic_patient_appointment1 = "" = "" THEN
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
                        INSERT INTO patient_visits (patient_id, visit_date, pregnancy_status, last_ANC_visit_date_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                      ELSE
                        SET @enc_id = encounter_id;
                  END CASE;
              ELSE
                  CASE
                      WHEN @last_ANC_visit_date1 = "" = "" THEN
                        IF in_field_voided = 0 THEN
                          UPDATE patient_visits SET last_ANC_visit_date = in_field_value_text, last_ANC_visit_date_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
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
                        INSERT INTO patient_visits (patient_id, visit_date, pregnancy_status, next_ANC_visit_date_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                      ELSE
                        SET @enc_id = encounter_id;
                  END CASE;
              ELSE
                  CASE
                      WHEN @next_ANC_visit_date1 = "" = "" THEN
                        IF in_field_voided = 0 THEN
                          UPDATE patient_visits SET next_ANC_visit_date = in_field_value_text, next_ANC_visit_date_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
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
                      WHEN @baby_delivered1 = "" = "" THEN
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
                      WHEN @baby_delivered_health_facility_name1 = "" = "" THEN
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
                        INSERT INTO patient_visits (patient_id, visit_date, pregnancy_status, baby_delivered_delivery_date_enc_id) VALUES (in_patient_id, in_visit_date, in_field_value_text, encounter_id);
                      ELSE
                        SET @enc_id = encounter_id;
                  END CASE;
              ELSE
                  CASE
                      WHEN @baby_delivered_delivery_date1 = "" = "" THEN
                        IF in_field_voided = 0 THEN
                          UPDATE patient_visits SET baby_delivered_delivery_date = in_field_value_text, baby_delivered_delivery_date_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
                        ELSE
                          UPDATE patient_visits SET baby_delivered_delivery_date = NULL, baby_delivered_delivery_date_enc_id = NULL WHERE patient_visits.id = in_visit_id;
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
                      WHEN @baby_delivered_delivery_location1 = "" = "" THEN
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
