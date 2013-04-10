DELIMITER $$

DROP PROCEDURE IF EXISTS `proc_insert_basics`$$

CREATE PROCEDURE `proc_insert_basics`(
		IN in_patient_id INT,
		IN in_date_created DATE,
		IN in_creator INT
	)
	
	BEGIN

		SELECT given_name, middle_name, family_name FROM person_name WHERE person_id = in_patient_id LIMIT 1 
				INTO @given_name, @middle_name, @last_name; 
		
		SELECT birthdate, birthdate_estimated, gender FROM person WHERE person_id = in_patient_id LIMIT 1
				INTO @dob, @dob_est, @gender; 

		SELECT address1, address2, county_district, city_village FROM person_address WHERE person_id = in_patient_id 
			AND voided = 0 LIMIT 1 INTO @landmark, @home_district, @ta, @current_address;
		
		SET @new_nat_id = (SELECT identifier FROM patient_identifier WHERE patient_id = in_patient_id AND voided = 0 AND identifier_type IN (SELECT patient_identifier_type_id FROM patient_identifier_type WHERE name = 'New national id') LIMIT 1);		
		SET @nat_id = (SELECT identifier FROM patient_identifier WHERE patient_id = in_patient_id AND voided = 0 AND identifier_type IN(SELECT patient_identifier_type_id FROM patient_identifier_type WHERE name = 'National id') LIMIT 1);
		SET @filing_num = (SELECT identifier FROM patient_identifier WHERE patient_id = in_patient_id AND voided = 0 AND identifier_type IN(SELECT patient_identifier_type_id FROM patient_identifier_type WHERE name = 'Filing Number') LIMIT 1);

		INSERT INTO flat_table1 (patient_id, given_name, middle_name, family_name, dob, dob_estimated, gender, nat_id, new_nat_id, filing_number, landmark, home_district, ta, current_address, date_created, creator) VALUES ( in_patient_id,@given_name, @middle_name, @last_name,@dob,@dob_est, @gender,@nat_id, @new_nat_id,@filing_num, @landmark, @home_district, @ta, @current_address, in_date_created ,in_creator);	
		
	END$$
	
DELIMITER ;
