DELIMITER $$

	DROP TRIGGER IF EXISTS `patient_hotline_after_void`$$

	CREATE TRIGGER `patient_hotline_after_void` AFTER UPDATE ON patient

		FOR EACH ROW BEGIN

			IF new.voided = 1 THEN

				DELETE FROM patient_demographics where patient_id = new.patient_id;
				-- DELETE FROM flat_table2 where patient_id = new.patient_id;
				-- DELETE FROM flat_cohort_table where patient_id = new.patient_id;

			ELSE

					SET @check_existence = (SELECT patient_id FROM patient_demographics WHERE patient_id = new.patient_id);

					if @check_existence IS NULL THEN

							CALL `proc_insert_hotline_basics`(
								new.patient_id,
								new.date_created,
								new.creator
							);

					END IF;

			END IF;

		END$$

DELIMITER ;
