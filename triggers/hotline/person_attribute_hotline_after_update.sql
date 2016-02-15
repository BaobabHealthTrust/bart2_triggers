DELIMITER $$

	DROP TRIGGER IF EXISTS `person_attribute_hotline_update`$$

	CREATE TRIGGER `person_attribute_hotline_update` AFTER UPDATE ON person_attribute

	FOR EACH ROW BEGIN

		SET @cell_phone_number = (SELECT person_attribute_type_id FROM person_attribute_type where name = 'Cell phone number');

		SET @occupation = (SELECT person_attribute_type_id FROM person_attribute_type where name = 'Occupation');

		SET @nearest_health_facility = (SELECT person_attribute_type_id FROM person_attribute_type where name = 'Nearest health facility');

		IF new.voided = 1 THEN

			CASE new.person_attribute_type_id

					WHEN @occupation THEN

						UPDATE patient_demographics SET occupation = NULL WHERE patient_id = new.person_id;

					WHEN @cell_phone_number THEN

						UPDATE patient_demographics SET cellphone_number = NULL WHERE patient_id = new.person_id;

					WHEN @nearest_health_facility THEN

			 			UPDATE patient_demographics SET nearest_health_facility = NULL WHERE patient_id = new.person_id;

					ELSE
						SET @null = new.creator;



			END CASE;

		END IF;

	END$$

DELIMITER ;
