DELIMITER $$

DROP PROCEDURE IF EXISTS `proc_insert_hotline_patient_identifier`$$

CREATE PROCEDURE`proc_insert_hotline_patient_identifier`(
		IN pat_id INT,
		IN identifier VARCHAR(255),
		IN identifier_type INT
	)

	BEGIN

		SET @national_id = (SELECT patient_identifier_type_id FROM patient_identifier_type where name = 'National id' LIMIT 1);

		SET @IVR_access_code = (SELECT patient_identifier_type_id FROM patient_identifier_type where name = 'IVR Access Code' LIMIT 1);

		SET @anc_connect_id = (SELECT patient_identifier_type_id FROM patient_identifier_type where name = 'ANC Connect ID' LIMIT 1);

		CASE identifier_type

			WHEN @national_id THEN
				UPDATE patient_demographics SET national_id = identifier WHERE patient_id = pat_id;
			WHEN @IVR_access_code THEN
				UPDATE patient_demographics SET IVR_access_code = identifier WHERE patient_id = pat_id;
			WHEN @anc_connect_id THEN
				UPDATE patient_demographics SET anc_connect_id = identifier WHERE patient_id = pat_id;

			ELSE
				SET @encounter = pat_id;
		END CASE;

	END$$


DELIMITER ;
