DELIMITER $$

	DROP TRIGGER IF EXISTS `patient_visits2`$$

	CREATE TRIGGER `patient_visits2` AFTER INSERT ON patient_demographics

	FOR EACH ROW BEGIN

		INSERT INTO patient_visits (patient_id) VALUES (new.patient_id);

	END$$

DELIMITER ;
