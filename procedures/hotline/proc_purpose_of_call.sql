DELIMITER $$

DROP PROCEDURE IF EXISTS `proc_purpose_of_call`$$

CREATE PROCEDURE `proc_purpose_of_call`(
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
  SET @value = COALESCE((SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id AND voided = 0), in_field_text);

  IF in_visit_id = 0 THEN
    INSERT INTO patient_visits(patient_id, visit_date, purpose_of_call, purpose_of_call_enc_id)
    VALUES(in_patient_id, in_visit_date, @value, encounter_id);
  ELSE
    IF in_field_voided = 0 THEN
      UPDATE patient_visits SET purpose_of_call= @value, purpose_of_call_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
    END IF;
  END IF;
END$$

DELIMITER ;
