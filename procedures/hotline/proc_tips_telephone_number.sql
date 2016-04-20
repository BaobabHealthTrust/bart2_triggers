DELIMITER $$

DROP PROCEDURE IF EXISTS `proc_tips_telephone_number`$$

CREATE PROCEDURE `proc_tips_telephone_number`(
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
  IF ISNULL(in_field_value_numeric) THEN
    SET @value = in_field_text;
  ELSE
    SET @value = in_field_value_numeric;
  END IF;

  IF @already_exist = 0 THEN
    IF in_visit_id = 0 THEN
      INSERT INTO patient_visits(patient_id, visit_date, tips_telephone_number, tips_telephone_number_enc_id)
      VALUES( in_patient_id, visit_date, @value, encounter_id);
    ELSE
      IF in_field_voided = 0 THEN
        UPDATE patient_visits SET tips_telephone_number = @value, tips_telephone_number_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
      END IF;
    END IF;
  ELSE
    IF in_visit_id = 0 THEN
      UPDATE patient_visits SET visit_date = in_visit_date, tips_telephone_number = @value, tips_telephone_number_enc_id = encounter_id
      WHERE patient_id = in_patient_id;
    ELSE
      IF in_field_voided = 0 THEN
        UPDATE patient_visits SET visit_date = in_visit_date, tips_telephone_number = @value, tips_telephone_number_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
      END IF;
    END IF;
  END IF;

END$$

DELIMITER ;
