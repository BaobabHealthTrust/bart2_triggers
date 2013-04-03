DELIMITER $$

DROP PROCEDURE IF EXISTS `proc_insert_basics`$$

CREATE PROCEDURE `proc_insert_basics`(
		IN in_pat_name_id INT,
		IN in_rec_id INT
	)
	
	BEGIN

		SET @dob = (SELECT birthdate from person where person_id = in_pat_name_id);
		SET @dob_est = (SELECT birthdate_estimated from person where person_id = in_pat_name_id);
		SET @gender = (SELECT gender from person where person_id = in_pat_name_id);
		
		UPDATE flat_table1 SET dob = @dob, dob_estimated = @dob_est, gender = @gender WHERE flat_table1.id = in_rec_id;

	END$$
	
DELIMITER ;
