DELIMITER $$

DROP TRIGGER IF EXISTS `person_name_after_save`$$
CREATE trigger `person_name_after_save` AFTER INSERT ON person_name

	FOR EACH ROW BEGIN
	
		INSERT INTO flat_table1 (patient_id, given_name,middle_name,family_name,date_created ,creator) VALUES ( new.person_id,new.given_name,new.middle_name ,new.family_name,new.date_created ,new.creator);	
		
		SET @id = (SELECT id from flat_table1 WHERE patient_id = new.person_id);
		
		CALL `proc_insert_basics`(
			new.person_id,
			@id
		); 
		
	END$$

DELIMITER ;

