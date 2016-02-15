DELIMITER $$

DROP PROCEDURE IF EXISTS `proc_insert_observations1`$$

CREATE PROCEDURE `proc_insert_observations1`(
    IN patient_id INT,
    IN value_date DATE,
    IN field_concept INT,
    IN field_value_coded INT,
    IN field_value_coded_name_id INT,
    IN field_text VARCHAR(255),
    IN field_value_numeric DOUBLE,
    IN field_value_datetime DATETIME,
    IN field_value_modifier VARCHAR(255),
    IN visit_id INT,
    IN field_voided INT,
    IN encounter_id INT
)
BEGIN

    SET @call_id = (SELECT concept_name.concept_id FROM concept_name
                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                        WHERE name = "Call Id" AND voided = 0 AND retired = 0 LIMIT 1);

    SET @pregnancy_status = (SELECT concept_name.concept_id FROM concept_name
                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                      WHERE name = "Pregnancy Status" AND voided = 0 AND retired = 0 LIMIT 1);

    CASE field_concept

        WHEN @call_id THEN

            CALL proc_insert_call_id(
                patient_id,
                value_date,
                field_concept,
                field_value_coded,
                field_value_coded_name_id,
                field_text,
                field_value_numeric,
                field_value_datetime,
                visit_id,
                field_voided,
                encounter_id
              );

     WHEN @pregnancy_status THEN

         CALL proc_insert_pregnancy_status(
             patient_id,
             value_date,
             field_concept,
             field_value_coded,
             field_value_coded_name_id,
             field_text,
             field_value_numeric,
             field_value_datetime,
             visit_id,
             field_voided,
             encounter_id
         );
    ELSE

            CALL proc_insert_other_hotline_field(
                patient_id,
                value_date,
                field_concept,
                field_value_coded,
                field_value_coded_name_id,
                field_text,
                field_value_numeric,
                field_value_datetime,
                visit_id,
                field_voided,
                encounter_id
            );

    END CASE;

END$$

DELIMITER ;
