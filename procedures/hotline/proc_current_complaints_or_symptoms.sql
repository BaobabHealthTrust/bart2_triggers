DELIMITER $$

DROP PROCEDURE IF EXISTS `proc_current_complaints_or_symptoms`$$

CREATE PROCEDURE `proc_current_complaints_or_symptoms`(
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
  SET @diarrhoea = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Diarrhoea" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @anaemia = (SELECT concept.concept_id FROM concept_name concept_name
      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
    WHERE name = "Anaemia" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @hiv_positive_exposed = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "HIV positive/exposed" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @previously_diagnosed_as_malnourished = (SELECT concept.concept_id FROM concept_name concept_name
      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
    WHERE name = "Previously diagnosed as malnourished" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @fever = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Fever" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @vomiting = (SELECT concept.concept_id FROM concept_name concept_name
      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
    WHERE name = "Vomiting" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @previously_diagnosed_as_moderate_severely_malnourished = (SELECT concept.concept_id FROM concept_name concept_name
     LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
   WHERE name = "Previously diagnosed as moderate/severely malnourished" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @tb_tuberculosis = (SELECT concept.concept_id FROM concept_name concept_name
      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
    WHERE name = "Tb/tuberculosis" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @previously_diagnosed_as_moderate_severely_malnourished = (SELECT concept.concept_id FROM concept_name concept_name
       LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
     WHERE name = "Previously diagnosed as moderate/severely malnourished" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @bp_hypertension = (SELECT concept.concept_id FROM concept_name concept_name
        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
      WHERE name = "Tb/tuberculosis" AND voided = 0 AND retired = 0 LIMIT 1);
  aa
  SET @child_conditions_interfering_with_breastfeeding = (SELECT concept.concept_id FROM concept_name concept_name
       LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
     WHERE name = "Child conditions interfering with breastfeeding" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @bp_hypertension = (SELECT concept.concept_id FROM concept_name concept_name
        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
      WHERE name = "Bp/hypertension" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @already_exist = COALESCE((SELECT patient_id FROM patient_visits WHERE patient_visits.patient_id = in_patient_id), 0);

  CASE in_field_value_coded
    WHEN @aneamia THEN
      IF @already_exist = 0 THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, aneamia, aneamia_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET aneamia= 'Yes', aneamia_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      ELSE
        IF in_visit_id = 0 THEN
          UPDATE patient_visits SET visit_date = in_visit_date,  aneamia = 'Yes', aneamia_enc_id = encounter_id
          WHERE patient_id = in_patient_id;
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET visit_date = in_visit_date, aneamia = 'Yes', aneamia_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      END IF;

    WHEN @diarrhoea THEN
      IF @already_exist = 0 THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, diarrhoea, diarrhoea_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET diarrhoea= 'Yes', diarrhoea_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      ELSE
        IF in_visit_id = 0 THEN
          UPDATE patient_visits SET visit_date = in_visit_date,  diarrhoea = 'Yes', diarrhoea_enc_id = encounter_id
          WHERE patient_id = in_patient_id;
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET visit_date = in_visit_date, diarrhoea = 'Yes', diarrhoea_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      END IF;

    WHEN @hiv_positive_exposed THEN
      IF @already_exist = 0 THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, hiv_positive_exposed, hiv_positive_exposed_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET hiv_positive_exposed= 'Yes', hiv_positive_exposed_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      ELSE
        IF in_visit_id = 0 THEN
          UPDATE patient_visits SET visit_date = in_visit_date,  hiv_positive_exposed = 'Yes', hiv_positive_exposed_enc_id = encounter_id
          WHERE patient_id = in_patient_id;
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET visit_date = in_visit_date, hiv_positive_exposed = 'Yes', hiv_positive_exposed_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      END IF;

    WHEN @previously_diagnosed_as_malnourished THEN
      IF @already_exist = 0 THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, previously_diagnosed_as_malnourished, previously_diagnosed_as_malnourished_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET previously_diagnosed_as_malnourished= 'Yes', previously_diagnosed_as_malnourished_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      ELSE
        IF in_visit_id = 0 THEN
          UPDATE patient_visits SET visit_date = in_visit_date,  previously_diagnosed_as_malnourished = 'Yes', previously_diagnosed_as_malnourished_enc_id = encounter_id
          WHERE patient_id = in_patient_id;
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET visit_date = in_visit_date, previously_diagnosed_as_malnourished = 'Yes', previously_diagnosed_as_malnourished_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      END IF;

    WHEN @fever THEN
      IF @already_exist = 0 THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, fever, fever_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET fever= 'Yes', fever_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      ELSE
        IF in_visit_id = 0 THEN
          UPDATE patient_visits SET visit_date = in_visit_date,  fever = 'Yes', fever_enc_id = encounter_id
          WHERE patient_id = in_patient_id;
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET visit_date = in_visit_date, fever = 'Yes', fever_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      END IF;

    WHEN @vomiting THEN
      IF @already_exist = 0 THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, vomiting, vomiting_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET vomiting= 'Yes', vomiting_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      ELSE
        IF in_visit_id = 0 THEN
          UPDATE patient_visits SET visit_date = in_visit_date,  vomiting = 'Yes', vomiting_enc_id = encounter_id
          WHERE patient_id = in_patient_id;
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET visit_date = in_visit_date, vomiting = 'Yes', vomiting_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      END IF;

    WHEN @tb_tuberculosis THEN
      IF @already_exist = 0 THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, tb_tuberculosis, tb_tuberculosis_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET tb_tuberculosis= 'Yes', tb_tuberculosis_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      ELSE
        IF in_visit_id = 0 THEN
          UPDATE patient_visits SET visit_date = in_visit_date,  tb_tuberculosis = 'Yes', tb_tuberculosis_enc_id = encounter_id
          WHERE patient_id = in_patient_id;
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET visit_date = in_visit_date, tb_tuberculosis = 'Yes', tb_tuberculosis_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      END IF;

    WHEN @previously_diagnosed_as_moderate_severely_malnourished THEN
      IF @already_exist = 0 THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, previously_diagnosed_as_moderate_severely_malnourished, previously_diagnosed_as_moderate_severely_malnourished_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET previously_diagnosed_as_moderate_severely_malnourished= 'Yes', previously_diagnosed_as_moderate_severely_malnourished_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      ELSE
        IF in_visit_id = 0 THEN
          UPDATE patient_visits SET visit_date = in_visit_date,  previously_diagnosed_as_moderate_severely_malnourished = 'Yes', previously_diagnosed_as_moderate_severely_malnourished_enc_id = encounter_id
          WHERE patient_id = in_patient_id;
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET visit_date = in_visit_date, previously_diagnosed_as_moderate_severely_malnourished = 'Yes', previously_diagnosed_as_moderate_severely_malnourished_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      END IF;

    WHEN @child_conditions_interfering_with_breastfeeding THEN
      IF @already_exist = 0 THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, child_conditions_interfering_with_breastfeeding, child_conditions_interfering_with_breastfeeding_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET child_conditions_interfering_with_breastfeeding= 'Yes', child_conditions_interfering_with_breastfeeding_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      ELSE
        IF in_visit_id = 0 THEN
          UPDATE patient_visits SET visit_date = in_visit_date,  child_conditions_interfering_with_breastfeeding = 'Yes', child_conditions_interfering_with_breastfeeding_enc_id = encounter_id
          WHERE patient_id = in_patient_id;
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET visit_date = in_visit_date, child_conditions_interfering_with_breastfeeding = 'Yes', child_conditions_interfering_with_breastfeeding_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      END IF;

    WHEN @bp_hypertension THEN
      IF @already_exist = 0 THEN
        IF in_visit_id = 0 THEN
          INSERT INTO patient_visits(patient_id, visit_date, bp_hypertension, bp_hypertension_enc_id)
          VALUES(in_patient_id, visit_date, 'Yes', encounter_id);
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET bp_hypertension= 'Yes', bp_hypertension_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      ELSE
        IF in_visit_id = 0 THEN
          UPDATE patient_visits SET visit_date = in_visit_date,  bp_hypertension = 'Yes', bp_hypertension_enc_id = encounter_id
          WHERE patient_id = in_patient_id;
        ELSE
          IF in_field_voided = 0 THEN
            UPDATE patient_visits SET visit_date = in_visit_date, bp_hypertension = 'Yes', bp_hypertension_enc_id = encounter_id WHERE patient_visits.id = in_visit_id;
          END IF;
        END IF;
      END IF;
  ELSE
    SET @enc_id = (encounter_id);
  END CASE;
END$$

DELIMITER ;
