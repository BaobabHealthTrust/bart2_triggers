DELIMITER $$

	DROP PROCEDURE IF EXISTS  `proc_person_attribute_after_insert`$$
	
	CREATE PROCEDURE `proc_person_attribute_after_insert` (in_person_id INT, in_attribute VARCHAR(255),	in_attribute_type INT )

	BEGIN		

		SET @type = (SELECT name FROM person_attribute_type where person_attribute_type_id = in_attribute_type);

		SET @cellphone = 'Cell phone number';

		SET @home_number = 'Home phone number';
	
		SET @office_number = 'Office phone number';

		SET @occupation = 'Occupation';
		
		CASE @type
		
			WHEN @occupation THEN
			
				UPDATE flat_table1 SET occupation = in_attribute WHERE patient_id = in_person_id;
			
			WHEN @cellphone THEN
			
				UPDATE flat_table1 SET cellphone_number = in_attribute WHERE patient_id = in_person_id;
			
			WHEN @home_number THEN
			
				UPDATE flat_table1 SET home_phone_number = in_attribute WHERE patient_id = in_person_id;
			
			WHEN @office_number THEN
	 		
	 			UPDATE flat_table1 SET office_phone_number = in_attribute WHERE patient_id = in_person_id;
	
			ELSE
			
				SET @unwanted = in_attribute;
		
		END CASE;
	END$$

DELIMITER ;
