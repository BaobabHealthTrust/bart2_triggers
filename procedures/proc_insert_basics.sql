DELIMITER $$

DROP PROCEDURE IF EXISTS `proc_insert_basics`$$

CREATE PROCEDURE `proc_insert_basics`(
		IN in_patient_id INT,
		IN in_date_created DATE,
		IN in_creator INT
	)

	BEGIN

		SET @cellphone =	(SELECT value FROM person_attribute WHERE person_id = in_patient_id AND voided = 0 AND person_attribute_type_id IN (SELECT person_attribute_type_id FROM person_attribute_type where name = 'Cell phone number') LIMIT 1);

		SET @home_number = (SELECT value FROM person_attribute WHERE person_id = in_patient_id AND voided = 0 AND person_attribute_type_id IN (SELECT person_attribute_type_id FROM person_attribute_type where name = 'Home phone number') LIMIT 1);

		SET @office_number = (SELECT value FROM person_attribute WHERE person_id = in_patient_id AND voided = 0 AND person_attribute_type_id IN (SELECT person_attribute_type_id FROM person_attribute_type where name = 'Office phone number') LIMIT 1);

		SET @occupation = (SELECT value FROM person_attribute WHERE person_id = in_patient_id AND voided = 0 AND person_attribute_type_id IN (SELECT person_attribute_type_id FROM person_attribute_type where name = 'Occupation') LIMIT 1);

		SET @new_nat_id = (SELECT identifier FROM patient_identifier WHERE patient_id = in_patient_id AND voided = 0 AND identifier_type IN (SELECT patient_identifier_type_id FROM patient_identifier_type WHERE name = 'New national id') LIMIT 1);
		SET @nat_id = (SELECT identifier FROM patient_identifier WHERE patient_id = in_patient_id AND voided = 0 AND identifier_type IN (SELECT patient_identifier_type_id FROM patient_identifier_type WHERE name = 'National id') LIMIT 1);
		SET @filing_num = (SELECT identifier FROM patient_identifier WHERE patient_id = in_patient_id AND voided = 0 AND identifier_type IN (SELECT patient_identifier_type_id FROM patient_identifier_type WHERE name = 'Filing Number') LIMIT 1);

   #-- SET @guardian = COALESCE((SELECT person_a FROM relationship WHERE person_b = in_patient_id), 0);

   #-- IF (@guardian = 0) THEN
   #--   SET @is_person_guardian = 'No';
   #-- ELSE
   #--  SET @is_person_guardian = 'Yes';
   #--  SET @guardian_to_patient_id = @guardian;
   #-- END IF;

		SELECT given_name, middle_name, family_name FROM person_name WHERE person_id = in_patient_id LIMIT 1
				INTO @given_name, @middle_name, @last_name;

		SELECT birthdate, birthdate_estimated, gender FROM person WHERE person_id = in_patient_id LIMIT 1
				INTO @dob, @dob_est, @gender;

		SELECT address1, address2, county_district, city_village FROM person_address WHERE person_id = in_patient_id
			AND voided = 0 LIMIT 1 INTO @landmark, @home_district, @ta, @current_address ;

	  SET @already_exist = COALESCE((SELECT id FROM flat_table1 WHERE patient_id = in_patient_id), 0);

	  IF (@already_exist = 0) THEN
		  INSERT INTO flat_table1 (patient_id, given_name, middle_name, family_name, dob, dob_estimated, gender, nat_id, new_nat_id, filing_number, landmark, home_district, ta, current_address, cellphone_number, home_phone_number, office_phone_number, occupation, date_created, creator) VALUES ( in_patient_id,@given_name, @middle_name, @last_name,@dob,@dob_est, @gender,@nat_id, @new_nat_id,@filing_num, @landmark, @home_district, @ta, @current_address, @cellphone, @home_number, @office_number, @occupation, in_date_created ,in_creator);
		ELSE
			UPDATE flat_table1 SET given_name = @given_name, middle_name = @middle_name, family_name = @last_name, dob = @dob, dob_estimated = @dob_est, gender = @gender, nat_id = @nat_id, new_nat_id = @new_nat_id, filing_number = @filing_number, landmark = @landmark, home_district = @home_district, ta = @ta, current_address = @current_address, cellphone_number = @cellphone, home_phone_number = @home_number, office_phone_number = @office_number, occupation = @occupation, date_created = in_date_created, creator = in_creator
			WHERE patient_id = in_patient_id;
		END IF;

	END$$

DELIMITER ;
