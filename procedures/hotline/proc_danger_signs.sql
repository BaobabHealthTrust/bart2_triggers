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
    IF in_visit_id = 0 THEN
      INSERT INTO patient_visits(patient_id, visit_date, danger_signs, danger_signs_enc_id)
      VALUES( in_patient_id, visit_date, in_field_text, encounter_id);
    ELSE
      IF in_field_voided = 0 THEN
        UPDATE patient_visits SET danger_signs = in_field_text, danger_signs_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
      END IF;
    END IF;
  ELSE
    IF in_visit_id = 0 THEN
      UPDATE patient_visits SET visit_date = in_visit_date, danger_signs = in_field_text, danger_signs_enc_id = encounter_id
      WHERE patient_id = in_patient_id;
    ELSE
      IF in_field_voided = 0 THEN
        UPDATE patient_visits SET visit_date = in_visit_date, danger_signs = in_field_text, danger_signs_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
      END IF;
    END IF;
  END IF;

END$$

DELIMITER ;
