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
  SET @heavy_vaginal_bleeding_during_pregnancy = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Heavy vaginal bleeding during pregnancy" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @excessive_postnatal_bleeding = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name =  "Excessive postnatal bleeding" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @severe_headache = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Severe headache" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @fever_during_pregnancy_sign = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Fever during pregnancy" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @postnatal_fever_sign = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Postnatal fever" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @fits_or_convulsions_sign = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Fits or convulsions" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @paleness_of_the_skin_and_tiredness_sign = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Paleness of the skin and tiredness" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @no_fetal_movements_sign = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "No fetal movements" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @water_breaks_sign = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Water breaks" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @swollen_hands_feet_and_face_sign = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Swollen hands, feet, and face" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @severe_abdominal_pain_sign = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Severe abdominal pain" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @malaria_sign = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Malaria" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @anemia_sign = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Anemia" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @antenatal_care_sign = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Antenatal care" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @convulsions = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Convulsions" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @dry_or_flaking_skin_extensive_skin_lesions = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Dry or flaking skin/extensive skin lesions" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @symptoms_of_underweight_or_overweight = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Symptoms of underweight or overweight" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @symptoms_of_wasting_loss_of_muscle_fat_visible_ribs = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Symptoms of wasting (loss of muscle, fat, visible ribs)" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @pallor_of_palms_nails = (SELECT concept.concept_id FROM concept_name concept_name
      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
    WHERE name = "Pallor of palms, nails" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @persistent_fatigue_weakness = (SELECT concept.concept_id FROM concept_name concept_name
        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
      WHERE name = "Persistent fatigue/weakness" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @not_able_to_eat_or_drink = (SELECT concept.concept_id FROM concept_name concept_name
            LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
          WHERE name = "Not able to eat or drink" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @mouth_sores_thrush_or_difficulty_swallowing = (SELECT concept.concept_id FROM concept_name concept_name
          LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
        WHERE name = "Mouth sores, thrush or difficulty swallowing" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @severe_dehydration = (SELECT concept.concept_id FROM concept_name concept_name
        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
      WHERE name = "Severe dehydration" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @difficult_or_rapid_breathing_or_increased_pulse_rate = (SELECT concept.concept_id FROM concept_name concept_name
      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
    WHERE name = "Difficult or rapid breathing or increased pulse rate" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @hypoglycemia_low_blood_sugar = (SELECT concept.concept_id FROM concept_name concept_name
      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
    WHERE name = "Hypoglycemia/Low blood sugar" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @dull_dry_thin_or_discolored_hair = (SELECT concept.concept_id FROM concept_name concept_name
      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
    WHERE name = "Dull, dry, thin or discolored hair" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @already_exist = COALESCE((SELECT patient_id FROM patient_visits WHERE patient_visits.patient_id = in_patient_id), 0);

  CASE in_field_value_coded
    WHEN @heavy_vaginal_bleeding_during_pregnancy THEN
      IF @already_exist = 0 THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, heavy_vaginal_bleeding_during_pregnancy, heavy_vaginal_bleeding_during_pregnancy_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET heavy_vaginal_bleeding_during_pregnancy= 'Yes', heavy_vaginal_bleeding_during_pregnancy_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      ELSE
        IF in_visit_id = 0 THEN
          UPDATE patient_visits SET visit_date = in_visit_date,  heavy_vaginal_bleeding_during_pregnancy = 'Yes', heavy_vaginal_bleeding_during_pregnancy_enc_id = encounter_id
          WHERE patient_id = in_patient_id;
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET visit_date = in_visit_date, heavy_vaginal_bleeding_during_pregnancy = 'Yes', heavy_vaginal_bleeding_during_pregnancy_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      END IF;

      WHEN @excessive_postnatal_bleeding THEN
        IF @already_exist = 0 THEN
          IF in_visit_id = 0 THEN
            INSERT INTO patient_visits(patient_id, visit_date, excessive_postnatal_bleeding, excessive_postnatal_bleeding_enc_id)
            VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
          ELSE
            IF in_field_voided = 0 THEN
              UPDATE patient_visits
              SET excessive_postnatal_bleeding= 'Yes', excessive_postnatal_bleeding_enc_id = encounter_id
              WHERE patient_visits.id = in_visit_id;
            END IF;
          END IF;
        ELSE
          IF in_visit_id = 0 THEN
            UPDATE patient_visits
            SET visit_date = in_visit_date,  excessive_postnatal_bleeding = 'Yes', excessive_postnatal_bleeding_enc_id = encounter_id
            WHERE patient_id = in_patient_id;
          ELSE
            IF in_field_voided = 0 THEN
              UPDATE patient_visits
              SET visit_date = in_visit_date, excessive_postnatal_bleeding = 'Yes', excessive_postnatal_bleeding_enc_id = encounter_id
              WHERE patient_visits.id = in_visit_id;
            END IF;
          END IF;
        END IF;

    WHEN @severe_headache THEN
      IF @already_exist = 0 THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, severe_headache, severe_headache_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET severe_headache = 'Yes', severe_headache_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      ELSE
        IF in_visit_id = 0 THEN
          UPDATE patient_visits
          SET visit_date = in_visit_date,  severe_headache = 'Yes', severe_headache_enc_id = encounter_id
          WHERE patient_id = in_patient_id;
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET visit_date = in_visit_date, severe_headache = 'Yes', severe_headache_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      END IF;

    WHEN @fever_during_pregnancy_sign THEN
      IF @already_exist = 0 THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, fever_during_pregnancy_sign, fever_during_pregnancy_sign_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET fever_during_pregnancy_sign = 'Yes', fever_during_pregnancy_sign_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      ELSE
        IF in_visit_id = 0 THEN
          UPDATE patient_visits
          SET visit_date = in_visit_date,  fever_during_pregnancy_sign = 'Yes', fever_during_pregnancy_sign_enc_id = encounter_id
          WHERE patient_id = in_patient_id;
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET visit_date = in_visit_date, fever_during_pregnancy_sign = 'Yes', fever_during_pregnancy_sign_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      END IF;

    WHEN @postnatal_fever_sign THEN
      IF @already_exist = 0 THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, postnatal_fever_sign, postnatal_fever_sign_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET postnatal_fever_sign = 'Yes', postnatal_fever_sign_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      ELSE
        IF in_visit_id = 0 THEN
          UPDATE patient_visits
          SET visit_date = in_visit_date,  postnatal_fever_sign = 'Yes', postnatal_fever_sign_enc_id = encounter_id
          WHERE patient_id = in_patient_id;
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET visit_date = in_visit_date, postnatal_fever_sign = 'Yes', postnatal_fever_sign_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      END IF;

    WHEN @fits_or_convulsions_sign THEN
      IF @already_exist = 0 THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, fits_or_convulsions_sign, fits_or_convulsions_sign_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET fits_or_convulsions_sign = 'Yes', fits_or_convulsions_sign_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      ELSE
        IF in_visit_id = 0 THEN
          UPDATE patient_visits
          SET visit_date = in_visit_date,  fits_or_convulsions_sign = 'Yes', fits_or_convulsions_sign_enc_id = encounter_id
          WHERE patient_id = in_patient_id;
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET visit_date = in_visit_date, fits_or_convulsions_sign = 'Yes', fits_or_convulsions_sign_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      END IF;

    WHEN @paleness_of_the_skin_and_tiredness_sign THEN
      IF @already_exist = 0 THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, paleness_of_the_skin_and_tiredness_sign, paleness_of_the_skin_and_tiredness_sign_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET paleness_of_the_skin_and_tiredness_sign = 'Yes', paleness_of_the_skin_and_tiredness_sign_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      ELSE
        IF in_visit_id = 0 THEN
          UPDATE patient_visits
          SET visit_date = in_visit_date,  paleness_of_the_skin_and_tiredness_sign = 'Yes', paleness_of_the_skin_and_tiredness_sign_enc_id = encounter_id
          WHERE patient_id = in_patient_id;
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET visit_date = in_visit_date, paleness_of_the_skin_and_tiredness_sign = 'Yes', paleness_of_the_skin_and_tiredness_sign_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      END IF;

    WHEN @no_fetal_movements_sign THEN
      IF @already_exist = 0 THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, no_fetal_movements_sign, no_fetal_movements_sign_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET no_fetal_movements_sign = 'Yes', no_fetal_movements_sign_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      ELSE
        IF in_visit_id = 0 THEN
          UPDATE patient_visits
          SET visit_date = in_visit_date,  no_fetal_movements_sign = 'Yes', no_fetal_movements_sign_enc_id = encounter_id
          WHERE patient_id = in_patient_id;
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET visit_date = in_visit_date, no_fetal_movements_sign = 'Yes', no_fetal_movements_sign_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      END IF;

    WHEN @water_breaks_sign THEN
      IF @already_exist = 0 THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, water_breaks_sign, water_breaks_sign_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET water_breaks_sign = 'Yes', water_breaks_sign_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      ELSE
        IF in_visit_id = 0 THEN
          UPDATE patient_visits
          SET visit_date = in_visit_date,  water_breaks_sign = 'Yes', water_breaks_sign_enc_id = encounter_id
          WHERE patient_id = in_patient_id;
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET visit_date = in_visit_date, water_breaks_sign = 'Yes', water_breaks_sign_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      END IF;

    WHEN @swollen_hands_feet_and_face_sign THEN
      IF @already_exist = 0 THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, swollen_hands_feet_and_face_sign, swollen_hands_feet_and_face_sign_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET swollen_hands_feet_and_face_sign = 'Yes', swollen_hands_feet_and_face_sign_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      ELSE
        IF in_visit_id = 0 THEN
          UPDATE patient_visits
          SET visit_date = in_visit_date,  swollen_hands_feet_and_face_sign = 'Yes', swollen_hands_feet_and_face_sign_enc_id = encounter_id
          WHERE patient_id = in_patient_id;
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET visit_date = in_visit_date, swollen_hands_feet_and_face_sign = 'Yes', swollen_hands_feet_and_face_sign_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      END IF;

    WHEN @severe_abdominal_pain_sign THEN
      IF @already_exist = 0 THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, severe_abdominal_pain_sign, severe_abdominal_pain_sign_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET severe_abdominal_pain_sign = 'Yes', severe_abdominal_pain_sign_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      ELSE
        IF in_visit_id = 0 THEN
          UPDATE patient_visits
          SET visit_date = in_visit_date,  severe_abdominal_pain_sign = 'Yes', severe_abdominal_pain_sign_enc_id = encounter_id
          WHERE patient_id = in_patient_id;
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET visit_date = in_visit_date, severe_abdominal_pain_sign = 'Yes', severe_abdominal_pain_sign_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      END IF;

    WHEN @malaria_sign THEN
      IF @already_exist = 0 THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, malaria_sign, malaria_sign_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET malaria_sign = 'Yes', malaria_sign_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      ELSE
        IF in_visit_id = 0 THEN
          UPDATE patient_visits
          SET visit_date = in_visit_date,  malaria_sign = 'Yes', malaria_sign_enc_id = encounter_id
          WHERE patient_id = in_patient_id;
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET visit_date = in_visit_date, malaria_sign = 'Yes', malaria_sign_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      END IF;

    WHEN @anemia_sign THEN
      IF @already_exist = 0 THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, anemia_sign, anemia_sign_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET anemia_sign = 'Yes', anemia_sign_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      ELSE
        IF in_visit_id = 0 THEN
          UPDATE patient_visits
          SET visit_date = in_visit_date,  anemia_sign = 'Yes', anemia_sign_enc_id = encounter_id
          WHERE patient_id = in_patient_id;
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET visit_date = in_visit_date, anemia_sign = 'Yes', anemia_sign_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      END IF;

    WHEN @antenatal_care_sign THEN
      IF @already_exist = 0 THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, antenatal_care_sign, antenatal_care_sign_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET antenatal_care_sign = 'Yes', antenatal_care_sign_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      ELSE
        IF in_visit_id = 0 THEN
          UPDATE patient_visits
          SET visit_date = in_visit_date,  antenatal_care_sign = 'Yes', antenatal_care_sign_enc_id = encounter_id
          WHERE patient_id = in_patient_id;
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits
            SET visit_date = in_visit_date, antenatal_care_sign = 'Yes', antenatal_care_sign_enc_id = encounter_id
            WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      END IF;

    WHEN @dry_or_flaking_skin_extensive_skin_lesions THEN
      IF @already_exist = 0 THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, dry_or_flaking_skin_extensive_skin_lesions, dry_or_flaking_skin_extensive_skin_lesions_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET dry_or_flaking_skin_extensive_skin_lesions= 'Yes', dry_or_flaking_skin_extensive_skin_lesions_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      ELSE
        IF in_visit_id = 0 THEN
          UPDATE patient_visits SET visit_date = in_visit_date,  dry_or_flaking_skin_extensive_skin_lesions = 'Yes', dry_or_flaking_skin_extensive_skin_lesions_enc_id = encounter_id
          WHERE patient_id = in_patient_id;
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET visit_date = in_visit_date, dry_or_flaking_skin_extensive_skin_lesions = 'Yes', dry_or_flaking_skin_extensive_skin_lesions_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      END IF;

    WHEN @symptoms_of_underweight_or_overweight  THEN
      IF @already_exist = 0 THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, symptoms_of_underweight_or_overweight , symptoms_of_underweight_or_overweight _enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET symptoms_of_underweight_or_overweight = 'Yes', symptoms_of_underweight_or_overweight _enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      ELSE
        IF in_visit_id = 0 THEN
          UPDATE patient_visits SET visit_date = in_visit_date,  symptoms_of_underweight_or_overweight  = 'Yes', symptoms_of_underweight_or_overweight _enc_id = encounter_id
          WHERE patient_id = in_patient_id;
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET visit_date = in_visit_date, symptoms_of_underweight_or_overweight  = 'Yes', symptoms_of_underweight_or_overweight _enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      END IF;

    WHEN @symptoms_of_wasting_loss_of_muscle_fat_visible_ribs  THEN
      IF @already_exist = 0 THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, symptoms_of_wasting_loss_of_muscle_fat_visible_ribs , symptoms_of_wasting_loss_of_muscle_fat_visible_ribs _enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET symptoms_of_wasting_loss_of_muscle_fat_visible_ribs = 'Yes', symptoms_of_wasting_loss_of_muscle_fat_visible_ribs _enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      ELSE
        IF in_visit_id = 0 THEN
          UPDATE patient_visits SET visit_date = in_visit_date,  symptoms_of_wasting_loss_of_muscle_fat_visible_ribs  = 'Yes', symptoms_of_wasting_loss_of_muscle_fat_visible_ribs _enc_id = encounter_id
          WHERE patient_id = in_patient_id;
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET visit_date = in_visit_date, symptoms_of_wasting_loss_of_muscle_fat_visible_ribs  = 'Yes', symptoms_of_wasting_loss_of_muscle_fat_visible_ribs _enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      END IF;

    WHEN @pallor_of_palms_nails THEN
      IF @already_exist = 0 THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, pallor_of_palms_nails, pallor_of_palms_nails_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET pallor_of_palms_nails= 'Yes', pallor_of_palms_nails_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      ELSE
        IF in_visit_id = 0 THEN
          UPDATE patient_visits SET visit_date = in_visit_date,  pallor_of_palms_nails = 'Yes', pallor_of_palms_nails_enc_id = encounter_id
          WHERE patient_id = in_patient_id;
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET visit_date = in_visit_date, pallor_of_palms_nails = 'Yes', pallor_of_palms_nails_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      END IF;

    WHEN @persistent_fatigue_weakness THEN
      IF @already_exist = 0 THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, persistent_fatigue_weakness, persistent_fatigue_weakness_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET persistent_fatigue_weakness= 'Yes', persistent_fatigue_weakness_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      ELSE
        IF in_visit_id = 0 THEN
          UPDATE patient_visits SET visit_date = in_visit_date,  persistent_fatigue_weakness = 'Yes', persistent_fatigue_weakness_enc_id = encounter_id
          WHERE patient_id = in_patient_id;
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET visit_date = in_visit_date, persistent_fatigue_weakness = 'Yes', persistent_fatigue_weakness_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      END IF;

    WHEN @not_able_to_eat_or_drink THEN
      IF @already_exist = 0 THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, not_able_to_eat_or_drink, not_able_to_eat_or_drink_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET not_able_to_eat_or_drink= 'Yes', not_able_to_eat_or_drink_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      ELSE
        IF in_visit_id = 0 THEN
          UPDATE patient_visits SET visit_date = in_visit_date,  not_able_to_eat_or_drink = 'Yes', not_able_to_eat_or_drink_enc_id = encounter_id
          WHERE patient_id = in_patient_id;
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET visit_date = in_visit_date, not_able_to_eat_or_drink = 'Yes', not_able_to_eat_or_drink_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      END IF;

    WHEN @mouth_sores_thrush_or_difficulty_swallowing THEN
      IF @already_exist = 0 THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, mouth_sores_thrush_or_difficulty_swallowing, mouth_sores_thrush_or_difficulty_swallowing_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET mouth_sores_thrush_or_difficulty_swallowing= 'Yes', mouth_sores_thrush_or_difficulty_swallowing_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      ELSE
        IF in_visit_id = 0 THEN
          UPDATE patient_visits SET visit_date = in_visit_date,  mouth_sores_thrush_or_difficulty_swallowing = 'Yes', mouth_sores_thrush_or_difficulty_swallowing_enc_id = encounter_id
          WHERE patient_id = in_patient_id;
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET visit_date = in_visit_date, mouth_sores_thrush_or_difficulty_swallowing = 'Yes', mouth_sores_thrush_or_difficulty_swallowing_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      END IF;

    WHEN @severe_dehydration THEN
      IF @already_exist = 0 THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, severe_dehydration, severe_dehydration_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET severe_dehydration= 'Yes', severe_dehydration_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      ELSE
        IF in_visit_id = 0 THEN
          UPDATE patient_visits SET visit_date = in_visit_date,  severe_dehydration = 'Yes', severe_dehydration_enc_id = encounter_id
          WHERE patient_id = in_patient_id;
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET visit_date = in_visit_date, severe_dehydration = 'Yes', severe_dehydration_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      END IF;

    WHEN @difficult_or_rapid_breathing_or_increased_pulse_rate THEN
      IF @already_exist = 0 THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, difficult_or_rapid_breathing_or_increased_pulse_rate, difficult_or_rapid_breathing_or_increased_pulse_rate_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET difficult_or_rapid_breathing_or_increased_pulse_rate= 'Yes', difficult_or_rapid_breathing_or_increased_pulse_rate_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      ELSE
        IF in_visit_id = 0 THEN
          UPDATE patient_visits SET visit_date = in_visit_date,  difficult_or_rapid_breathing_or_increased_pulse_rate = 'Yes', difficult_or_rapid_breathing_or_increased_pulse_rate_enc_id = encounter_id
          WHERE patient_id = in_patient_id;
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET visit_date = in_visit_date, difficult_or_rapid_breathing_or_increased_pulse_rate = 'Yes', difficult_or_rapid_breathing_or_increased_pulse_rate_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      END IF;

    WHEN @hypoglycemia_low_blood_sugar THEN
      IF @already_exist = 0 THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, hypoglycemia_low_blood_sugar, hypoglycemia_low_blood_sugar_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET hypoglycemia_low_blood_sugar= 'Yes', hypoglycemia_low_blood_sugar_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      ELSE
        IF in_visit_id = 0 THEN
          UPDATE patient_visits SET visit_date = in_visit_date,  hypoglycemia_low_blood_sugar = 'Yes', hypoglycemia_low_blood_sugar_enc_id = encounter_id
          WHERE patient_id = in_patient_id;
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET visit_date = in_visit_date, hypoglycemia_low_blood_sugar = 'Yes', hypoglycemia_low_blood_sugar_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      END IF;

    WHEN @dull_dry_thin_or_discolored_hair THEN
      IF @already_exist = 0 THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, dull_dry_thin_or_discolored_hair, dull_dry_thin_or_discolored_hair_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET dull_dry_thin_or_discolored_hair= 'Yes', dull_dry_thin_or_discolored_hair_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      ELSE
        IF in_visit_id = 0 THEN
          UPDATE patient_visits SET visit_date = in_visit_date,  dull_dry_thin_or_discolored_hair = 'Yes', dull_dry_thin_or_discolored_hair_enc_id = encounter_id
          WHERE patient_id = in_patient_id;
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET visit_date = in_visit_date, dull_dry_thin_or_discolored_hair = 'Yes', dull_dry_thin_or_discolored_hair_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      END IF;

    WHEN @convulsions THEN
      IF @already_exist = 0 THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, convulsions, convulsions_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET convulsions= 'Yes', convulsions_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      ELSE
        IF in_visit_id = 0 THEN
          UPDATE patient_visits SET visit_date = in_visit_date,  convulsions = 'Yes', convulsions_enc_id = encounter_id
          WHERE patient_id = in_patient_id;
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET visit_date = in_visit_date, convulsions = 'Yes', convulsions_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      END IF;
  ELSE
    SET @enc_id = (encounter_id);
  END CASE;
END$$

DELIMITER ;
