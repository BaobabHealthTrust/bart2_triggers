DELIMITER $$

DROP PROCEDURE IF EXISTS `proc_insert_call_id`$$

CREATE PROCEDURE `proc_insert_call_id`(
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
  SET @value = COALESCE((SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id), in_field_text);

  IF in_visit_id = 0 THEN
    INSERT INTO patient_visits(patient_id, visit_date, call_id, call_id_enc_id)
    VALUES( in_patient_id, visit_date, in_field_text, encounter_id);
  ELSE
    IF in_field_voided = 0 THEN
      UPDATE patient_visits SET call_id = in_field_text, call_id_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
    END IF;
  END IF;

END$$

DELIMITER ;
