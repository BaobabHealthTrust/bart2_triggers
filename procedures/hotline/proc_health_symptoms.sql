DELIMITER $$

DROP PROCEDURE IF EXISTS `proc_health_symptoms`$$

CREATE PROCEDURE `proc_health_symptoms`(
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
  END IF;

END$$

DELIMITER ;
