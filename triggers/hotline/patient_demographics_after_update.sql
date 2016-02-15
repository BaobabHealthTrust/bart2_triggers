DELIMITER $$

	DROP TRIGGER IF EXISTS `patient_visits1`$$

	CREATE TRIGGER `patient_visits1` AFTER UPDATE ON patient_demographics

	FOR EACH ROW BEGIN

    SET @eligible = (SELECT patient_id FROM patient_demographics WHERE patient_id = new.patient_id);

    IF @eligible IS NOT NULL THEN
    	SET @record_exists = (SELECT id FROM patient_visits WHERE patient_id = new.patient_id);

    		IF @record_exists IS NULL THEN
					INSERT INTO patient_visits ( patient_id) VALUES (new.patient_id);
				END IF;
		END IF;
	END$$

DELIMITER ;
