DELIMITER $$

DROP PROCEDURE IF EXISTS `proc_insert_hotline_basics`$$

CREATE PROCEDURE `proc_insert_hotline_basics`(
		IN in_patient_id INT,
		IN in_date_created DATE,
		IN in_creator INT
	)

	BEGIN

		SET @cell_phone_number =	(SELECT person_attribute_type_id
		                           FROM person_attribute_type
		                           WHERE name = 'Cell phone number' LIMIT 1);

		SET @occupation = (SELECT value FROM person_attribute
		                   WHERE person_id = in_patient_id AND voided = 0
		                   AND person_attribute_type_id IN (SELECT person_attribute_type_id
		                                                    FROM person_attribute_type
		                                                    WHERE name = 'Occupation') LIMIT 1);

		SET @nearest_health_facility = (SELECT value FROM person_attribute
		                                WHERE person_id = in_patient_id AND voided = 0
		                                AND person_attribute_type_id IN (SELECT person_attribute_type_id
		                                                                 FROM person_attribute_type
		                                                                 WHERE name = 'Nearest health facility') LIMIT 1);

		SET @national_id = (SELECT identifier FROM patient_identifier
		                    WHERE patient_id = in_patient_id AND voided = 0
		                    AND identifier_type IN (SELECT patient_identifier_type_id
		                                            FROM patient_identifier_type
		                                            WHERE name = 'National id') LIMIT 1);

		SET @IVR_access_code = (SELECT identifier FROM patient_identifier
		                      WHERE patient_id = in_patient_id AND voided = 0
		                      AND identifier_type IN (SELECT patient_identifier_type_id
		                                              FROM patient_identifier_type
		                                              WHERE name = 'IVR Access Code') LIMIT 1);

		SET @anc_connect_id = (SELECT identifier FROM patient_identifier
		                       WHERE patient_id = in_patient_id AND voided = 0
		                       AND identifier_type IN (SELECT patient_identifier_type_id
		                                               FROM patient_identifier_type
		                                               WHERE name = 'ANC Connect ID') LIMIT 1);

    SET @creator = (COALESCE((SELECT username FROM users WHERE user_id = in_creator), in_creator));

		SELECT given_name, family_name2, family_name, family_name_prefix, family_name_suffix FROM person_name WHERE person_id = in_patient_id LIMIT 1
				INTO @given_name, @mothers_surname, @last_name, @family_name_prefix, @family_name_suffix;

		SELECT birthdate, birthdate_estimated, gender FROM person WHERE person_id = in_patient_id LIMIT 1
				INTO @birthdate, @birthdate_est, @gender;

		SELECT value FROM  person_attribute
		WHERE person_id = in_patient_id AND person_attribute_type_id = @cell_phone_number
		ORDER BY person_attribute_id DESC LIMIT 1 INTO @cell_number;

		SELECT region, neighborhood_cell, county_district, address2 FROM person_address WHERE person_id = in_patient_id
			AND voided = 0 LIMIT 1 INTO @region, @neighborhood_cell, @county_district, @home_village ;

		INSERT INTO patient_demographics (patient_id, given_name, last_name, mothers_surname, nick_name ,date_of_birth, dob_estimated, gender, national_id, IVR_access_code, anc_connect_id, cellphone_number, nearest_health_facility, current_residence, current_ta, home_village, group_village_head, occupation, date_created, creator)
	  VALUES (in_patient_id, @given_name, @last_name, @mothers_surname, @family_name_prefix, @birthdate, @birthdate_est, @gender, @national_id, @IVR_access_code, @anc_connect_id, @cell_number, @nearest_health_facility, @region, @neighborhood_cell, @county_district, @home_village, @occupation, in_date_created, @creator);

	END$$

DELIMITER ;
