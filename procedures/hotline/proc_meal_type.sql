DELIMITER $$

DROP PROCEDURE IF EXISTS `proc_meal_type`$$

CREATE PROCEDURE `proc_meal_type`(
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

  CASE in_field_text
    WHEN 'Breakfast' THEN
      IF in_visit_id = 0 THEN
        INSERT INTO patient_visits(patient_id, visit_date, breakfast, breakfast_enc_id)
        VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
      ELSE
        IF in_field_voided = 0 THEN
          UPDATE patient_visits
          SET breakfast = 'Yes', breakfast_enc_id = encounter_id
          WHERE patient_visits.id = in_visit_id;
        END IF;
      END IF;

    WHEN 'Lunch' THEN
      IF in_visit_id = 0 THEN
        INSERT INTO patient_visits(patient_id, visit_date, lunch, lunch_enc_id)
        VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
      ELSE
        IF in_field_voided = 0 THEN
          UPDATE patient_visits
          SET lunch = 'Yes', lunch_enc_id = encounter_id
          WHERE patient_visits.id = in_visit_id;
        END IF;
      END IF;

    WHEN 'Supper' THEN
      IF in_visit_id = 0 THEN
        INSERT INTO patient_visits(patient_id, visit_date, supper, supper_enc_id)
        VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
      ELSE
        IF in_field_voided = 0 THEN
          UPDATE patient_visits
          SET supper = 'Yes', supper_enc_id = encounter_id
          WHERE patient_visits.id = in_visit_id;
        END IF;
      END IF;

    WHEN 'Snack' THEN
      IF in_visit_id = 0 THEN
        INSERT INTO patient_visits(patient_id, visit_date, snack, snack_enc_id)
        VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
      ELSE
        IF in_field_voided = 0 THEN
          UPDATE patient_visits
          SET snack = 'Yes', snack_enc_id = encounter_id
          WHERE patient_visits.id = in_visit_id;
        END IF;
      END IF;
  ELSE
    SET @enc_id = (encounter_id);
  END CASE;
END$$

DELIMITER ;
