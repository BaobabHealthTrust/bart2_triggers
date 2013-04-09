DELIMITER $$

	DROP TRIGGER IF EXISTS `cohort_for_table1`$$
	
	CREATE TRIGGER `cohort_for_table1` AFTER UPDATE ON flat_table1
	
	FOR EACH ROW BEGIN
	
    SET @eligible = (SELECT earliest_start_date FROM flat_table1 WHERE patient_id = new.patient_id);
    
    IF @eligible IS NOT NULL THEN
    	
    	SET @record_exists = (SELECT gender FROM flat_cohort_table WHERE patient_id = new.patient_id);
    		
    		IF @record_exists IS NULL THEN
						
					INSERT INTO flat_cohort_table ( patient_id, gender, birthdate, earliest_start_date, reason_for_starting, ever_registered_at_art, date_art_last_taken, taken_art_in_last_two_months, extrapulmonary_tuberculosis, pulmonary_tuberculosis, pulmonary_tuberculosis_last_2_years, kaposis_sarcoma) VALUES (new.patient_id, new.gender, new.dob, @eligible, new.reason_for_eligibility, new.ever_registered_at_art_clinic, new.date_art_last_taken, new.taken_art_in_last_two_months, new.extrapulmonary_tuberculosis, new.pulmonary_tuberculosis, new.pulmonary_tuberculosis_last_2_years, new.kaposis_sarcoma);

				ELSE
				
					UPDATE flat_cohort_table SET  earliest_start_date = @eligible, reason_for_starting = new.reason_for_eligibility, ever_registered_at_art = new.ever_registered_at_art_clinic, date_art_last_taken = new.date_art_last_taken, taken_art_in_last_two_months = new.taken_art_in_last_two_months, extrapulmonary_tuberculosis = new.extrapulmonary_tuberculosis, pulmonary_tuberculosis = new.pulmonary_tuberculosis, pulmonary_tuberculosis_last_2_years = new.pulmonary_tuberculosis_last_2_years, kaposis_sarcoma = new.kaposis_sarcoma WHERE patient_id = new.patient_id;

				END IF;
			
		END IF;
	END$$

DELIMITER ;
