DELIMITER $$

DROP PROCEDURE IF EXISTS `proc_danger_signs`$$

CREATE PROCEDURE `proc_danger_signs`(
    IN in_patient_id INT,
    IN in_visit_date DATE,
    IN in_field_concept INT,
    IN in_field_value_coded INT,
    IN in_field_value_coded_name_id INT,
    IN in_field_text VARCHAR(255),
    IN in_field_value_numeric INT,
    IN in_field_value_datetime DATE,
    IN in_visit_id INT,
    IN in_field_voided INT,
    IN encounter_id INT
)

BEGIN
  SET @already_exist = COALESCE((SELECT patient_id FROM patient_visits WHERE patient_visits.patient_id = in_patient_id), 0);

  IF @already_exist = 0 THEN

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
  END IF;

END$$

DELIMITER ;
