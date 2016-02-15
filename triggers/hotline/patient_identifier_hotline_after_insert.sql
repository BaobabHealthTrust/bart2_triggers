DELIMITER $$

	DROP TRIGGER IF EXISTS `patient_identifier_hotline_after_save`$$

	CREATE TRIGGER `patient_identifier_hotline_after_save` AFTER INSERT ON patient_identifier

	FOR EACH ROW

		BEGIN

			CALL proc_insert_hotline_patient_identifier(
				new.patient_id,
				new.identifier,
				new.identifier_type
			);

		END$$

DELIMITER ;
