DELIMITER $$

	DROP PROCEDURE IF EXISTS  `proc_hotline_person_attribute_after_insert`$$

	CREATE PROCEDURE `proc_hotline_person_attribute_after_insert` (in_person_id INT, in_attribute VARCHAR(255),	in_attribute_type INT )

	BEGIN

		SET @cell_phone_number = (SELECT person_attribute_type_id FROM person_attribute_type where name = 'Cell phone number');

		SET @occupation = (SELECT person_attribute_type_id FROM person_attribute_type where name = 'Occupation');

		SET @nearest_health_facility = (SELECT person_attribute_type_id FROM person_attribute_type where name = 'Nearest health facility');

		CASE in_attribute_type

			WHEN @occupation THEN

				UPDATE patient_demographics SET occupation = in_attribute WHERE patient_id = in_person_id;

			WHEN @cellphone THEN

				UPDATE patient_demographics SET cellphone_number = in_attribute WHERE patient_id = in_person_id;

			WHEN @nearest_health_facility THEN

				UPDATE patient_demographics SET nearest_health_facility = in_attribute WHERE patient_id = in_person_id;

			ELSE

				SET @unwanted = in_attribute;

		END CASE;
	END$$

DELIMITER ;
