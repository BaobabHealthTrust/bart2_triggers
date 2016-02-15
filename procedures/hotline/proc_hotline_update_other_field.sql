DELIMITER $$

DROP PROCEDURE IF EXISTS `proc_hotline_update_other_field`$$

CREATE PROCEDURE `proc_hotline_update_other_field`(
  IN in_patient_id INT,
  IN in_visit_date DATE,
  IN in_field_concept INT,
  IN in_field_text VARCHAR(255),
  IN in_field_value_coded INT,
  IN in_field_value_coded_name_id INT,
  IN in_field_value_numeric INT,
  IN in_field_value_datetime DATE,
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

	CASE in_field_concept
    WHEN @call_id THEN
      UPDATE patient_visits SET call_id = NULL, call_id_enc_id = NULL WHERE patient_visits.patient_id = in_patient_id;

    WHEN @pregnancy_status THEN
        UPDATE patient_visits SET pregnancy_status = NULL, pregnancy_status_enc_id = NULL WHERE patient_visits.patient_id = in_patient_id;
	ELSE
		SET @new = in_patient_id;
  END CASE;

END$$

DELIMITER ;
