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
  SET @vaginal_bleeding_during_pregnancy_symptom = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Vaginal bleeding during pregnancy" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @postnatal_bleeding_symptom = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Postnatal bleeding" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @headaches_symptom = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Headaches" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @other_symptom = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Other" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @abdominal_pain_symptom = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Abdominal pain" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @frequent_miscarriages_symptom = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Frequent miscarriages" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @infertility_symptom = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Infertility" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @problems_with_family_planning_method_symptom = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Problems with family planning method" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @problems_with_monthly_periods_symptom = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Problems with monthly periods" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @vaginal_itching_symptom = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Vaginal itching" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @fever_during_pregnancy_symptom = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Fever during pregnancy" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @postnatal_fever_symptom = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Postnatal fever" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @fits_or_convulsions_sign = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Fits or convulsions" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @swollen_hands_or_feet_symptom = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Swollen hands or feet" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @paleness_of_the_skin_and_tiredness_symptom = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Paleness of the skin and tiredness" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @no_fetal_movements_symptom = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "No fetal movements" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @water_breaks_symptom = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Water breaks" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @postnatal_discharge_bad_smell_symptom = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Postnatal discharge - bad smell" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @vaginal_bleeding_not_during_pregnancy_symptom = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Vaginal bleeding (not during pregnancy)" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @vaginal_discharge_symptom = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Vaginal discharge" AND voided = 0 AND retired = 0 LIMIT 1);

  CASE in_field_value_coded
    WHEN @infertility_symptom  THEN
      IF in_visit_id = 0 THEN
        INSERT INTO patient_visits(patient_id, visit_date, infertility_symptom , infertility_symptom_enc_id)
        VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
      ELSE
        IF in_field_voided = 0 THEN
          UPDATE patient_visits
          SET infertility_symptom  = 'Yes', infertility_symptom_enc_id = encounter_id
          WHERE patient_visits.id = in_visit_id;
        END IF;
      END IF;

      WHEN @problems_with_family_planning_method_symptom  THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, problems_with_family_planning_method_symptom , problems_with_family_planning_method_symptom_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET problems_with_family_planning_method_symptom  = 'Yes', problems_with_family_planning_method_symptom_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;

      WHEN @problems_with_monthly_periods_symptom  THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, problems_with_monthly_periods_symptom , problems_with_monthly_periods_symptom_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET problems_with_monthly_periods_symptom  = 'Yes', problems_with_monthly_periods_symptom_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;

      WHEN @vaginal_itching_symptom  THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, vaginal_itching_symptom , vaginal_itching_symptom_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET vaginal_itching_symptom  = 'Yes', vaginal_itching_symptom_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;

      WHEN @fever_during_pregnancy_symptom  THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, fever_during_pregnancy_symptom , fever_during_pregnancy_symptom_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET fever_during_pregnancy_symptom  = 'Yes', fever_during_pregnancy_symptom_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;

      WHEN @postnatal_fever_symptom  THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, postnatal_fever_symptom , postnatal_fever_symptom_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET postnatal_fever_symptom  = 'Yes', postnatal_fever_symptom_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;

      WHEN @fits_or_convulsions_sign  THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, fits_or_convulsions_sign , fits_or_convulsions_sign_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET fits_or_convulsions_sign  = 'Yes', fits_or_convulsions_sign_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;

      WHEN @swollen_hands_or_feet_symptom THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, swollen_hands_or_feet_symptom, swollen_hands_or_feet_symptom_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET swollen_hands_or_feet_symptom = 'Yes', swollen_hands_or_feet_symptom_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;

      WHEN @paleness_of_the_skin_and_tiredness_symptom THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, paleness_of_the_skin_and_tiredness_symptom, paleness_of_the_skin_and_tiredness_symptom_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET paleness_of_the_skin_and_tiredness_symptom = 'Yes', paleness_of_the_skin_and_tiredness_symptom_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;

      WHEN @no_fetal_movements_symptom THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, no_fetal_movements_symptom, no_fetal_movements_symptom_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET no_fetal_movements_symptom = 'Yes', no_fetal_movements_symptom_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;

      WHEN @water_breaks_symptom THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, water_breaks_symptom, water_breaks_symptom_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET water_breaks_symptom = 'Yes', water_breaks_symptom_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;

      WHEN @postnatal_discharge_bad_smell_symptom THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, postnatal_discharge_bad_smell_symptom, postnatal_discharge_bad_smell_symptom_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET postnatal_discharge_bad_smell_symptom = 'Yes', postnatal_discharge_bad_smell_symptom_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;

      WHEN @vaginal_bleeding_not_during_pregnancy_symptom THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, vaginal_bleeding_not_during_pregnancy_symptom, vaginal_bleeding_not_during_pregnancy_symptom_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET vaginal_bleeding_not_during_pregnancy_symptom = 'Yes', vaginal_bleeding_not_during_pregnancy_symptom_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;

      WHEN @abdominal_pain_symptom THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, abdominal_pain_symptom, abdominal_pain_symptom_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET abdominal_pain_symptom = 'Yes', abdominal_pain_symptom_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;

      WHEN @vaginal_bleeding_during_pregnancy_symptom THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, vaginal_bleeding_during_pregnancy_symptom, vaginal_bleeding_during_pregnancy_symptom_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET vaginal_bleeding_during_pregnancy_symptom = 'Yes', vaginal_bleeding_during_pregnancy_symptom_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;

      WHEN @postnatal_bleeding_symptom THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, postnatal_bleeding_symptom, postnatal_bleeding_symptom_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET postnatal_bleeding_symptom = 'Yes', postnatal_bleeding_symptom_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;

      WHEN @headaches_symptom THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, headaches_symptom, headaches_symptom_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET headaches_symptom = 'Yes', headaches_symptom_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;

      WHEN @headaches_symptom THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, headaches_symptom, headaches_symptom_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET headaches_symptom = 'Yes', headaches_symptom_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;

      WHEN @abdominal_pain_symptom THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, abdominal_pain_symptom, abdominal_pain_symptom_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET abdominal_pain_symptom = 'Yes', abdominal_pain_symptom_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;

      WHEN @frequent_miscarriages_symptom THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, frequent_miscarriages_symptom, frequent_miscarriages_symptom_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET frequent_miscarriages_symptom = 'Yes', frequent_miscarriages_symptom_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;

      WHEN @vaginal_discharge_symptom THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, vaginal_discharge_symptom, vaginal_discharge_symptom_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET vaginal_discharge_symptom = 'Yes', vaginal_discharge_symptom_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
    ELSE
      SET @enc_id = (encounter_id);
    END CASE;
END$$

DELIMITER ;
