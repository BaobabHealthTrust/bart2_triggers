DELIMITER $$

	DROP TRIGGER IF EXISTS `person_address_hotline_after_update` $$

	CREATE TRIGGER 	`person_address_hotline_after_update` AFTER UPDATE ON person_address

	FOR EACH ROW
	BEGIN

		IF new.voided = 1 THEN

			UPDATE patient_demographics SET current_residence = NULL, current_ta = NULL, home_village = NULL, group_village_head = NULL WHERE patient_id = new.person_id;


		ELSE

			UPDATE patient_demographics SET current_residence = new.city_village, current_ta = new.county_district, home_village = new.address2, group_village_head = new.subregion WHERE patient_id = new.person_id;

		END IF;

	END$$

DELIMITER ;
