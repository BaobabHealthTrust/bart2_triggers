DELIMITER $$

DROP PROCEDURE IF EXISTS `proc_health_information`$$

CREATE PROCEDURE `proc_health_information`(
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
  SET @malaria_sign = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Malaria" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @antenatal_care_sign = (SELECT concept.concept_id FROM concept_name concept_name
    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
  WHERE name = "Antenatal care" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @anemia_sign = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Anemia" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @family_planning = (SELECT concept.concept_id FROM concept_name concept_name
       LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
     WHERE name = "Family planning" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @healthcare_visits = (SELECT concept.concept_id FROM concept_name concept_name
       LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
     WHERE name = "Healthcare visits" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @nutrition = (SELECT concept.concept_id FROM concept_name concept_name
       LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
     WHERE name = "Nutrition" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @body_changes = (SELECT concept.concept_id FROM concept_name concept_name
       LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
     WHERE name = "Body changes" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @discomfort = (SELECT concept.concept_id FROM concept_name concept_name
       LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
     WHERE name = "Discomfort" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @concerns = (SELECT concept.concept_id FROM concept_name concept_name
       LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
     WHERE name = "Concerns" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @emotions = (SELECT concept.concept_id FROM concept_name concept_name
       LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
     WHERE name = "Emotions" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @warning_signs = (SELECT concept.concept_id FROM concept_name concept_name
       LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
     WHERE name = "Warning signs" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @routines = (SELECT concept.concept_id FROM concept_name concept_name
       LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
     WHERE name = "Routines" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @beliefs = (SELECT concept.concept_id FROM concept_name concept_name
       LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
     WHERE name = "Beliefs" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @babys_growth = (SELECT concept.concept_id FROM concept_name concept_name
       LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
     WHERE name = "Baby\'s growth" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @milestones = (SELECT concept.concept_id FROM concept_name concept_name
       LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
     WHERE name = "Milestones" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @prevention = (SELECT concept.concept_id FROM concept_name concept_name
       LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
     WHERE name = "Prevention" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @birth_planning_male = (SELECT concept.concept_id FROM concept_name concept_name
       LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
     WHERE name = "Birth planning - male" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @birth_planning_female = (SELECT concept.concept_id FROM concept_name concept_name
       LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
     WHERE name = "Birth planning - female" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @fits_or_convulsions_sign = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Fits or convulsions" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @cervical_cancer = (SELECT concept.concept_id FROM concept_name concept_name
      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
    WHERE name = "Cervical cancer" AND voided = 0 AND retired = 0 LIMIT 1);

  CASE in_field_value_coded
    WHEN @cervical_cancer THEN
      IF in_visit_id = 0 THEN
        INSERT INTO patient_visits(patient_id, visit_date, cervical_cancer, cervical_cancer_enc_id)
        VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
      ELSE
        IF in_field_voided = 0 THEN
          UPDATE patient_visits
          SET cervical_cancer = 'Yes', cervical_cancer_enc_id = encounter_id
          WHERE patient_visits.id = in_visit_id;
        END IF;
      END IF;

     WHEN @fits_or_convulsions_sign THEN
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

      WHEN @malaria_sign THEN
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

    WHEN @antenatal_care_sign THEN
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

    WHEN @anemia_sign THEN
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

    WHEN @birth_planning_female THEN
      IF in_visit_id = 0 THEN
        INSERT INTO patient_visits(patient_id, visit_date, birth_planning_female, birth_planning_female_enc_id)
        VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
      ELSE
        IF in_field_voided = 0 THEN
          UPDATE patient_visits
          SET birth_planning_female = 'Yes', birth_planning_female_enc_id = encounter_id
          WHERE patient_visits.id = in_visit_id;
        END IF;
      END IF;

    WHEN @birth_planning_male THEN
      IF in_visit_id = 0 THEN
        INSERT INTO patient_visits(patient_id, visit_date, birth_planning_male, birth_planning_male_enc_id)
        VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
      ELSE
        IF in_field_voided = 0 THEN
          UPDATE patient_visits
          SET birth_planning_male = 'Yes', birth_planning_male_enc_id = encounter_id
          WHERE patient_visits.id = in_visit_id;
        END IF;
      END IF;

    WHEN @prevention THEN
      IF in_visit_id = 0 THEN
        INSERT INTO patient_visits(patient_id, visit_date, prevention, prevention_enc_id)
        VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
      ELSE
        IF in_field_voided = 0 THEN
          UPDATE patient_visits
          SET prevention = 'Yes', prevention_enc_id = encounter_id
          WHERE patient_visits.id = in_visit_id;
        END IF;
      END IF;

    WHEN @milestones THEN
      IF in_visit_id = 0 THEN
        INSERT INTO patient_visits(patient_id, visit_date, milestones, milestones_enc_id)
        VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
      ELSE
        IF in_field_voided = 0 THEN
          UPDATE patient_visits
          SET milestones = 'Yes', milestones_enc_id = encounter_id
          WHERE patient_visits.id = in_visit_id;
        END IF;
      END IF;

    WHEN @babys_growth THEN
      IF in_visit_id = 0 THEN
        INSERT INTO patient_visits(patient_id, visit_date, babys_growth, babys_growth_enc_id)
        VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
      ELSE
        IF in_field_voided = 0 THEN
          UPDATE patient_visits
          SET babys_growth = 'Yes', babys_growth_enc_id = encounter_id
          WHERE patient_visits.id = in_visit_id;
        END IF;
      END IF;

    WHEN @beliefs THEN
      IF in_visit_id = 0 THEN
        INSERT INTO patient_visits(patient_id, visit_date, beliefs, beliefs_enc_id)
        VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
      ELSE
        IF in_field_voided = 0 THEN
          UPDATE patient_visits
          SET beliefs = 'Yes', beliefs_enc_id = encounter_id
          WHERE patient_visits.id = in_visit_id;
        END IF;
      END IF;

    WHEN @routines THEN
      IF in_visit_id = 0 THEN
        INSERT INTO patient_visits(patient_id, visit_date, routines, routines_enc_id)
        VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
      ELSE
        IF in_field_voided = 0 THEN
          UPDATE patient_visits
          SET routines = 'Yes', routines_enc_id = encounter_id
          WHERE patient_visits.id = in_visit_id;
        END IF;
      END IF;

    WHEN @warning_signs THEN
      IF in_visit_id = 0 THEN
        INSERT INTO patient_visits(patient_id, visit_date, warning_signs, warning_signs_enc_id)
        VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
      ELSE
        IF in_field_voided = 0 THEN
          UPDATE patient_visits
          SET warning_signs = 'Yes', warning_signs_enc_id = encounter_id
          WHERE patient_visits.id = in_visit_id;
        END IF;
      END IF;

    WHEN @emotions THEN
      IF in_visit_id = 0 THEN
        INSERT INTO patient_visits(patient_id, visit_date, emotions, emotions_enc_id)
        VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
      ELSE
        IF in_field_voided = 0 THEN
          UPDATE patient_visits
          SET emotions = 'Yes', emotions_enc_id = encounter_id
          WHERE patient_visits.id = in_visit_id;
        END IF;
      END IF;

    WHEN @concerns THEN
      IF in_visit_id = 0 THEN
        INSERT INTO patient_visits(patient_id, visit_date, concerns, concerns_enc_id)
        VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
      ELSE
        IF in_field_voided = 0 THEN
          UPDATE patient_visits
          SET concerns = 'Yes', concerns_enc_id = encounter_id
          WHERE patient_visits.id = in_visit_id;
        END IF;
      END IF;

    WHEN @discomfort THEN
      IF in_visit_id = 0 THEN
        INSERT INTO patient_visits(patient_id, visit_date, discomfort, discomfort_enc_id)
        VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
      ELSE
        IF in_field_voided = 0 THEN
          UPDATE patient_visits
          SET discomfort = 'Yes', discomfort_enc_id = encounter_id
          WHERE patient_visits.id = in_visit_id;
        END IF;
      END IF;

    WHEN @body_changes THEN
      IF in_visit_id = 0 THEN
        INSERT INTO patient_visits(patient_id, visit_date, body_changes, body_changes_enc_id)
        VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
      ELSE
        IF in_field_voided = 0 THEN
          UPDATE patient_visits
          SET body_changes = 'Yes', body_changes_enc_id = encounter_id
          WHERE patient_visits.id = in_visit_id;
        END IF;
      END IF;

    WHEN @nutrition THEN
      IF in_visit_id = 0 THEN
        INSERT INTO patient_visits(patient_id, visit_date, nutrition, nutrition_enc_id)
        VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
      ELSE
        IF in_field_voided = 0 THEN
          UPDATE patient_visits
          SET nutrition = 'Yes', nutrition_enc_id = encounter_id
          WHERE patient_visits.id = in_visit_id;
        END IF;
      END IF;

    WHEN @healthcare_visits THEN
      IF in_visit_id = 0 THEN
        INSERT INTO patient_visits(patient_id, visit_date, healthcare_visits, healthcare_visits_enc_id)
        VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
      ELSE
        IF in_field_voided = 0 THEN
          UPDATE patient_visits
          SET healthcare_visits = 'Yes', healthcare_visits_enc_id = encounter_id
          WHERE patient_visits.id = in_visit_id;
        END IF;
      END IF;

    WHEN @family_planning THEN
      IF in_visit_id = 0 THEN
        INSERT INTO patient_visits(patient_id, visit_date, family_planning, family_planning_enc_id)
        VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
      ELSE
        IF in_field_voided = 0 THEN
          UPDATE patient_visits
          SET family_planning = 'Yes', family_planning_enc_id = encounter_id
          WHERE patient_visits.id = in_visit_id;
        END IF;
      END IF;
  ELSE
    SET @enc_id = (encounter_id);
  END CASE;
END$$

DELIMITER ;
