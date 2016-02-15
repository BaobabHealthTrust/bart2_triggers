DELIMITER $$

DROP TRIGGER IF EXISTS `patient_hotline_after_save`$$
CREATE trigger `patient_hotline_after_save` AFTER INSERT ON patient

	FOR EACH ROW BEGIN

		CALL `proc_insert_hotline_basics`(
			new.patient_id,
			new.date_created,
			new.creator
		);

	END$$

DELIMITER ;
