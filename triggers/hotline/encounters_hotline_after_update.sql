DELIMITER $$
DROP TRIGGER IF EXISTS `encounters_hotline_after_update`$$
CREATE TRIGGER `encounters_hotline_after_update` AFTER UPDATE
ON `encounter`
FOR EACH ROW
BEGIN

    # Declare condition for exiting loop
    DECLARE done INT DEFAULT FALSE;

    DECLARE  var_person_id INT(11);
    DECLARE  var_obs_datetime DATE;
    DECLARE  var_concept_id INT(11);
    DECLARE  var_value_coded INT(11);
    DECLARE  var_value_coded_name_id INT(11);
    DECLARE  var_value_text VARCHAR(255);
    DECLARE  var_field_value_numeric DOUBLE;
    DECLARE  var_field_value_datetime DATETIME;
    DECLARE  var_voided INT(11);

    # Declare and initialise cursor for looping through the table
    DECLARE cur CURSOR FOR SELECT DISTINCT person_id, DATE(obs_datetime) datetime, concept_id, value_coded, value_coded_name_id, value_text , value_numeric, value_datetime, voided
        FROM obs WHERE encounter_id = OLD.encounter_id;

    BEGIN

        SET @hotline_encounters = (SELECT encounter_type_id FROM encounter_type
                                   WHERE encounter_type_id IN (5, 40, 71, 72, 73, 90, 111, 150, 151) LIMIT 1);

        IF OLD.encounter_type = @hotline_encounters THEN

            UPDATE patient_visits SET call_id = NULL
            WHERE patient_visits.call_id_enc_id = OLD.encounter_id;

        END IF;

    END;

    # Open cursor
    OPEN cur;
    BEGIN
        # Declare loop position check
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

        # Declare loop for traversing through the records
        read_loop: LOOP

            # Get the fields into the variables declared earlier
            FETCH cur INTO var_person_id, var_obs_datetime, var_concept_id, var_value_coded, var_value_coded_name_id, var_value_text , var_field_value_numeric, var_field_value_datetime, var_voided;

            # Check if we are done and exit loop if done
            IF done THEN

                LEAVE read_loop;

            END IF;

            # Not done, process the parameters

              #--SET @voided = (SELECT voided FROM encounter WHERE encounter_id = OLD.encounter_id);
              #--IF @voided = 1 THEN

           IF new.voided = 1 THEN

                  SET @call_id = (SELECT concept_name.concept_id FROM concept_name concept_name
                                  LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                  WHERE name = "Call Id" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @pregnancy_status = (SELECT concept_name.concept_id FROM concept_name
                                  LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                  WHERE name = "Pregnancy Status" AND voided = 0 AND retired = 0 LIMIT 1);

                  CASE var_concept_id

                    WHEN @call_id THEN
						          UPDATE patient_visits SET call_id = NULL, call_id_enc_id = NULL
                      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.call_id_enc_id = OLD.encounter_id;

                    WHEN @pregnancy_status THEN
                        UPDATE patient_visits SET pregnancy_status = NULL, pregnancy_status_enc_id = NULL
                        WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.pregnancy_status_enc_id = OLD.encounter_id;

                  #--ELSE BEGIN END;
                  ELSE
                    CALL proc_hotline_update_other_field(
                      var_person_id,
                      var_obs_datetime,
                      var_concept_id,
                      var_value_coded,
                      var_value_coded_name_id,
                      var_value_text ,
                      var_field_value_numeric,
                      var_field_value_datetime,
                      NULL,
                      var_voided,
                      OLD.encounter_id);
                  END CASE;

          END IF;

          #--END IF;

        END LOOP;
    END;

END$$

DELIMITER ;
