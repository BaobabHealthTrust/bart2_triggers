DELIMITER $$

DROP PROCEDURE IF EXISTS `proc_insert_breastfeeding`$$

CREATE PROCEDURE `proc_insert_breastfeeding`(
    IN in_patient_id INT,
    IN in_visit_date DATE,
    IN in_field_concept INT,
    IN in_field_value_coded INT,
    IN in_field_value_coded_name_id INT,
    IN in_field_other VARCHAR(25),
    IN in_visit_id INT,
    IN in_field_voided INT,
    IN encounter_id INT
)
BEGIN

    SET @yes = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Yes" AND voided = 0 AND retired = 0 LIMIT 1);

    SET @no = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "No" AND voided = 0 AND retired = 0 LIMIT 1);

    SET @unknown = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Unknown" AND voided = 0 AND retired = 0 LIMIT 1);

    CASE in_field_value_coded

        WHEN @yes THEN

            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            SET @encounter_type = (SELECT encounter_type FROM encounter e WHERE e.encounter_id = encounter_id AND voided = in_field_voided LIMIT 1);

            IF in_visit_id = 0 THEN
              IF (@encounter_type = 52) THEN
               INSERT INTO flat_table1 (patient_id, breastfeeding_yes, breastfeeding_yes_enc_id, breastfeeding_yes_v_date) VALUES (in_patient_id, @value, encounter_id, in_visit_date);
              ELSEIF (@encounter_type = 53) THEN
                INSERT INTO flat_table2 (patient_id, visit_date, breastfeeding_yes, breastfeeding_yes_enc_id) VALUES (in_patient_id, in_visit_date, @value, encounter_id);
              END IF;


            ELSE
              IF (@encounter_type = 52) THEN
                IF in_field_voided = 0 THEN
                  UPDATE flat_table1 SET breastfeeding_yes = @value, breastfeeding_no = NULL, breastfeeding_unknown = NULL, breastfeeding_yes_enc_id = encounter_id, breastfeeding_no_enc_id = NULL, breastfeeding_unknown_enc_id = NULL, breastfeeding_yes_v_date = in_visit_date, breastfeeding_no_v_date = NULL, breastfeeding_unknown_v_date = NULL WHERE flat_table1.id = in_visit_id;
                ELSE
                  UPDATE flat_table1 SET breastfeeding_yes = NULL, breastfeeding_no = NULL, breastfeeding_unknown = NULL, breastfeeding_yes_enc_id = NULL, breastfeeding_no_enc_id = NULL, breastfeeding_unknown_enc_id = NULL, breastfeeding_yes_v_date = NULL, breastfeeding_no_v_date = NULL, breastfeeding_unknown_v_date = NULL WHERE flat_table1.id = in_visit_id;
                END IF;
              ELSEIF (@encounter_type = 53) THEN
                IF in_field_voided = 0 THEN
                  UPDATE flat_table2 SET breastfeeding_yes = @value, breastfeeding_no = NULL, breastfeeding_unknown = NULL, breastfeeding_yes_enc_id = encounter_id, breastfeeding_no_enc_id = NULL, breastfeeding_unknown_enc_id = NULL WHERE flat_table2.id = in_visit_id;
                ELSE
                  UPDATE flat_table2 SET breastfeeding_yes = NULL, breastfeeding_no = NULL, breastfeeding_unknown = NULL, breastfeeding_yes_enc_id = NULL, breastfeeding_no_enc_id = NULL, breastfeeding_unknown_enc_id = NULL WHERE flat_table2.id = in_visit_id;
                END IF;
              END IF;
            END IF;

        WHEN @no THEN

            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            SET @encounter_type = (SELECT encounter_type FROM encounter e WHERE e.encounter_id = encounter_id AND voided = in_field_voided LIMIT 1);
            IF in_visit_id = 0 THEN

              IF (@encounter_type = 52) THEN
                INSERT INTO flat_table1 (patient_id, breastfeeding_no, breastfeeding_no_enc_id, breastfeeding_no_v_date) VALUES (in_patient_id, @value, encounter_id, in_visit_date);
              ELSEIF (@encounter_type = 53) THEN
                INSERT INTO flat_table2 (patient_id, visit_date, breastfeeding_no, breastfeeding_no_enc_id) VALUES (in_patient_id, in_visit_date, @value, encounter_id);
              END IF;
            ELSE

              IF (@encounter_type = 52) THEN
                IF in_field_voided = 0 THEN
                  UPDATE flat_table1 SET breastfeeding_no = @value, breastfeeding_yes = NULL, breastfeeding_unknown = NULL, breastfeeding_no_enc_id = encounter_id, breastfeeding_yes_enc_id = NULL, breastfeeding_unknown_enc_id = NULL, breastfeeding_no_v_date = in_visit_date, breastfeeding_yes_v_date = NULL, breastfeeding_unknown_v_date = NULL WHERE flat_table1.id = in_visit_id;
                ELSE
                  UPDATE flat_table1 SET breastfeeding_no = NULL, breastfeeding_yes = NULL, breastfeeding_unknown = NULL, breastfeeding_no_enc_id = NULL, breastfeeding_yes_enc_id = NULL, breastfeeding_unknown_enc_id = NULL, breastfeeding_no_v_date = NULL, breastfeeding_yes_v_date = NULL, breastfeeding_unknown_v_date = NULL WHERE flat_table1.id = in_visit_id;
                END IF;
              ELSEIF (@encounter_type = 53) THEN
                IF in_field_voided = 0 THEN
                  UPDATE flat_table2 SET breastfeeding_no = @value, breastfeeding_yes = NULL, breastfeeding_unknown = NULL, breastfeeding_no_enc_id = encounter_id, breastfeeding_yes_enc_id = NULL, breastfeeding_unknown_enc_id = NULL WHERE flat_table2.id = in_visit_id;
                ELSE
                  UPDATE flat_table2 SET breastfeeding_no = NULL, breastfeeding_yes = NULL, breastfeeding_unknown = NULL, breastfeeding_no_enc_id = NULL, breastfeeding_yes_enc_id = NULL, breastfeeding_unknown_enc_id = NULL WHERE flat_table2.id = in_visit_id;
                END IF;
              END IF;

            END IF;

        WHEN @unknown THEN

            SET @value = (SELECT name FROM concept_name WHERE concept_name_id = in_field_value_coded_name_id);
            SET @encounter_type = (SELECT encounter_type FROM encounter e WHERE e.encounter_id = encounter_id AND voided = in_field_voided LIMIT 1);

            IF in_visit_id = 0 THEN

              IF (@encounter_type = 52) THEN
                INSERT INTO flat_table1 (patient_id, breastfeeding_unknown, breastfeeding_unknown_enc_id, breastfeeding_unknown_v_date) VALUES (in_patient_id, @value, encounter_id, in_visit_date);
              ELSEIF (@encounter_type = 53) THEN
                INSERT INTO flat_table2 (patient_id, visit_date, breastfeeding_unknown, breastfeeding_unknown_enc_id) VALUES (in_patient_id, in_visit_date, @value, encounter_id);
              END IF;
            ELSE
             IF (@encounter_type = 52) THEN
              IF in_field_voided = 0 THEN
                  UPDATE flat_table1 SET breastfeeding_unknown = @value, breastfeeding_yes = NULL, breastfeeding_no = NULL, breastfeeding_unknown_enc_id = encounter_id, breastfeeding_yes_enc_id = NULL, breastfeeding_no_enc_id = NULL, breastfeeding_unknown_v_date = in_visit_date, breastfeeding_yes_v_date = NULL, breastfeeding_no_v_date = NULL WHERE flat_table1.id = in_visit_id;
                ELSE
                  UPDATE flat_table1 SET breastfeeding_unknown = NULL, breastfeeding_yes = NULL, breastfeeding_no = NULL, breastfeeding_unknown_enc_id = NULL, breastfeeding_yes_enc_id = NULL, breastfeeding_no_enc_id = NULL, breastfeeding_unknown_v_date = NULL, breastfeeding_yes_v_date = NULL, breastfeeding_no_v_date = NULL WHERE flat_table1.id = in_visit_id;
                END IF;
              ELSEIF (@encounter_type = 53) THEN
               IF in_field_voided = 0 THEN
                 UPDATE flat_table2 SET breastfeeding_unknown = @value, breastfeeding_yes = NULL, breastfeeding_no = NULL, breastfeeding_unknown_enc_id = encounter_id, breastfeeding_yes_enc_id = NULL, breastfeeding_no_enc_id = NULL WHERE flat_table2.id = in_visit_id;
                ELSE
                  UPDATE flat_table2 SET breastfeeding_unknown = NULL, breastfeeding_yes = NULL, breastfeeding_no = NULL, breastfeeding_unknown_enc_id = NULL, breastfeeding_yes_enc_id = NULL, breastfeeding_no_enc_id = NULL WHERE flat_table2.id = in_visit_id;
                END IF;
              END IF;

            END IF;
        ELSE

            SET @enc_id = encounter_id;

    END CASE;

END$$

DELIMITER ;
