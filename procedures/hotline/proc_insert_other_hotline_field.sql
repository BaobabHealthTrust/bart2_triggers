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

    IF (in_field_voided = 0) THEN
      CASE in_field_concept

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
            ELSE

              SET @enc_id = encounter_id;

      END CASE;
    END IF;
END$$

DELIMITER ;
