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
  CASE in_field_text
    WHEN 'Breastmilk' THEN
      IF in_visit_id = 0 THEN
        INSERT INTO patient_visits(patient_id, visit_date, breastmilk, breastmilk_enc_id)
        VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
      ELSE
        IF in_field_voided = 0 THEN
          UPDATE patient_visits
          SET breastmilk = 'Yes', breastmilk_enc_id = encounter_id
          WHERE patient_visits.id = in_visit_id;
        END IF;
      END IF;

    WHEN 'Foods' THEN
      IF in_visit_id = 0 THEN
        INSERT INTO patient_visits(patient_id, visit_date, foods, foods_enc_id)
        VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
      ELSE
        IF in_field_voided = 0 THEN
          UPDATE patient_visits
          SET foods = 'Yes', foods_enc_id = encounter_id
          WHERE patient_visits.id = in_visit_id;
        END IF;
      END IF;

    WHEN 'Other Liquids' THEN
      IF in_visit_id = 0 THEN
        INSERT INTO patient_visits(patient_id, visit_date, other_liquids, other_liquids_enc_id)
        VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
      ELSE
        IF in_field_voided = 0 THEN
          UPDATE patient_visits
          SET other_liquids = 'Yes', other_liquids_enc_id = encounter_id
          WHERE patient_visits.id = in_visit_id;
        END IF;
      END IF;

      WHEN 'Staples' THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, staples, staples_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET staples = 'Yes', staples_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;

      WHEN 'Legumes & Nuts' THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, legumes_and_nuts, legumes_and_nuts_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET legumes_and_nuts = 'Yes', legumes_and_nuts_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;

      WHEN 'Animal Foods' THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, animal_foods, animal_foods_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET animal_foods = 'Yes', animal_foods_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;

      WHEN 'Fruits' THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, fruits, fruits_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET fruits = 'Yes', fruits_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;

    WHEN 'Vegetables' THEN
      IF in_visit_id = 0 THEN
        INSERT INTO patient_visits(patient_id, visit_date, vegetables, vegetables_enc_id)
        VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
      ELSE
        IF in_field_voided = 0 THEN
          UPDATE patient_visits
          SET vegetables = 'Yes', vegetables_enc_id = encounter_id
          WHERE patient_visits.id = in_visit_id;
        END IF;
      END IF;

    WHEN 'Fats' THEN
      IF in_visit_id = 0 THEN
        INSERT INTO patient_visits(patient_id, visit_date, fats, fats_enc_id)
        VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
      ELSE
        IF in_field_voided = 0 THEN
          UPDATE patient_visits
          SET fats = 'Yes', fats_enc_id = encounter_id
          WHERE patient_visits.id = in_visit_id;
        END IF;
      END IF;
  ELSE
    SET @enc_id = (encounter_id);
  END CASE;
END$$

DELIMITER ;
