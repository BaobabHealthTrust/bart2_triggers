DELIMITER $$

	DROP TRIGGER IF EXISTS `person_hotline_after_update`$$

	CREATE TRIGGER `person_hotline_after_update` AFTER UPDATE ON person

		FOR EACH ROW BEGIN

			IF new.voided = 1 THEN

				DELETE FROM patient_demographics where patient_id = new.person_id;

			ELSE

					SET @check_existence = (SELECT patient_id FROM patient_demographics WHERE patient_id = new.person_id);

					if @check_existence IS NOT NULL THEN

						UPDATE patient_demographics
							SET gender = new.gender,
							    date_of_birth = new.birthdate,
							    dob_estimated = new.birthdate_estimated
							WHERE patient_id = new.person_id;
					END IF;

			END IF;

		END$$

DELIMITER ;
