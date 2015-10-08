DELIMITER $$
	
	DROP TRIGGER IF EXISTS `person_after_update`$$
	
	CREATE TRIGGER `person_after_update` AFTER UPDATE ON person

		FOR EACH ROW BEGIN
		
			IF new.voided = 1 THEN
			
				DELETE FROM flat_table1 where patient_id = new.person_id;
				DELETE FROM flat_table2 where patient_id = new.person_id;
				DELETE FROM flat_cohort_table where patient_id = new.person_id;

			ELSE
				
					SET @check_existence = (SELECT patient_id FROM flat_table1 WHERE patient_id = new.person_id);
					
					if @check_existence IS NOT NULL THEN

						UPDATE flat_table1
							SET gender = new.gender, 
							    dob = new.birthdate,  
							    dob_estimated = new.birthdate_estimated,
							    death_date = new.death_date 
							WHERE patient_id = new.person_id;				
					END IF;
				
			END IF;	

		END$$
	
DELIMITER ;
