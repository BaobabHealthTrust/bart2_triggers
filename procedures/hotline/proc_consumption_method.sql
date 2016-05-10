DELIMITER $$

DROP PROCEDURE IF EXISTS `proc_food_type`$$

CREATE PROCEDURE `proc_food_type`(
    IN in_patient_id INT,
    IN in_visit_date DATE,
    IN in_field_concept INT,
    IN in_field_value_coded INT,
    IN in_field_value_coded_name_id INT,
    IN in_field_text VARCHAR(255),
    IN in_field_value_numeric INT,
    IN in_field_value_datetime DATE,
    IN in_field_value_complex VARCHAR(255),
    IN in_visit_id INT,
    IN in_field_voided INT,
    IN encounter_id INT
)

BEGIN
  SET @yes = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Yes" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @no = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "No" AND voided = 0 AND retired = 0 LIMIT 1);

  CASE in_field_value_coded
    WHEN @yes THEN
      IF in_visit_id = 0 THEN
        INSERT INTO patient_visits(patient_id, visit_date, consumption_method, consumption_method_enc_id)
        VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
      ELSE
        IF in_field_voided = 0 THEN
          UPDATE patient_visits
          SET consumption_method = 'Yes', consumption_method_enc_id = encounter_id
          WHERE patient_visits.id = in_visit_id;
        END IF;
      END IF;

    WHEN @no THEN
      IF in_visit_id = 0 THEN
        INSERT INTO patient_visits(patient_id, visit_date, consumption_method, consumption_method_enc_id)
        VALUES(in_patient_id, visit_date, 'No', encounter_id);
      ELSE
        IF in_field_voided = 0 THEN
          UPDATE patient_visits
          SET consumption_method = 'No', consumption_method_enc_id = encounter_id
          WHERE patient_visits.id = in_visit_id;
        END IF;
      END IF;
    ELSE
    SET @enc_id = (encounter_id);
  END CASE;
END$$

DELIMITER ;
