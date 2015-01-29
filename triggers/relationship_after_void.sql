DELIMITER $$
	
	DROP TRIGGER IF EXISTS `relationship_after_void`$$
	
	CREATE TRIGGER `relationship_after_void` AFTER UPDATE ON relationship

		FOR EACH ROW BEGIN

			IF new.voided = 1 THEN
				#--Get the guardian's person_id
        SET @person_b = COALESCE((SELECT person_b FROM relationship
	                                WHERE relationship_id = new.relationship_id
	                                AND voided = 1),0);
        #--Get patient_id
        SET @person_a = COALESCE((SELECT person_a FROM relationship
	                                WHERE relationship_id = new.relationship_id
	                                AND voided = 1), 0);

        SET @guardian_id = COALESCE((SELECT patient_id FROM flat_table1
                                     WHERE patient_id = @person_b), 0);

        SET @guardian_to_which_patient = COALESCE((SELECT patient_id FROM flat_table1
                                                   WHERE patient_id = @person_a), 0);

        IF (@guardian_id != 0) THEN
          IF (@guardian_to_which_patient != 0) THEN
			      #--check if the guardian_to_which_patient fields have values
            SET @guardian_to_which_patient1 = COALESCE((SELECT guardian_to_which_patient1 FROM flat_table1 
	                                                      WHERE patient_id = @guardian_id), 0);

            SET @guardian_to_which_patient2 = COALESCE((SELECT guardian_to_which_patient2 FROM flat_table1 
	                                                      WHERE patient_id = @guardian_id), 0);

            SET @guardian_to_which_patient3 = COALESCE((SELECT guardian_to_which_patient3 FROM flat_table1 
	                                                      WHERE patient_id = @guardian_id), 0);

            SET @guardian_to_which_patient4 = COALESCE((SELECT guardian_to_which_patient4 FROM flat_table1 
	                                                      WHERE patient_id = @guardian_id), 0);

            SET @guardian_to_which_patient5 = COALESCE((SELECT guardian_to_which_patient5 FROM flat_table1 
	                                                      WHERE patient_id = @guardian_id), 0);

            #--Check the guardian_to_which_patient
            IF (@guardian_to_which_patient1 = @guardian_to_which_patient) THEN
              UPDATE flat_table1
              SET guardian_to_which_patient1 = NULL
              WHERE patient_id = @guardian_id;
            ELSEIF (@guardian_to_which_patient2 = @guardian_to_which_patient) THEN
              UPDATE flat_table1
              SET guardian_to_which_patient2 = NULL
              WHERE patient_id = @guardian_id;
            ELSEIF (@guardian_to_which_patient3 = @guardian_to_which_patient) THEN
              UPDATE flat_table1
              SET guardian_to_which_patient3 = NULL
              WHERE patient_id = @guardian_id;
            ELSEIF (@guardian_to_which_patient4 = @guardian_to_which_patient) THEN
              UPDATE flat_table1
              SET guardian_to_which_patient4 = NULL
              WHERE patient_id = @guardian_id;
            ELSEIF (@guardian_to_which_patient5 = @guardian_to_which_patient) THEN
              UPDATE flat_table1
              SET guardian_to_which_patient5 = NULL
              WHERE patient_id = @guardian_id;
            ELSE
              SET @update_guardian = @quardian_id;
            END IF;

            #--check if the giardian_person_id fields have values
            SET @guardian_person_id1 = COALESCE((SELECT guardian_person_id1 FROM flat_table1 
	                                               WHERE patient_id = @guardian_to_which_patient ), 0);

            SET @guardian_person_id2 = COALESCE((SELECT guardian_person_id2 FROM flat_table1 
	                                               WHERE patient_id = @guardian_to_which_patient ), 0);

            SET @guardian_person_id3 = COALESCE((SELECT guardian_person_id3 FROM flat_table1 
	                                               WHERE patient_id = @guardian_to_which_patient ), 0);

            SET @guardian_person_id4 = COALESCE((SELECT guardian_person_id4 FROM flat_table1 
	                                               WHERE patient_id = @guardian_to_which_patient ), 0);

            SET @guardian_person_id5 = COALESCE((SELECT guardian_person_id5 FROM flat_table1 
	                                               WHERE patient_id = @guardian_to_which_patient ), 0);

            IF (@guardian_person_id1 = @guardian_id) THEN
              UPDATE flat_table1
              SET guardian_person_id1 = NULL
              WHERE patient_id = @guardian_to_which_patient;
            ELSEIF (@guardian_person_id2 = @guardian_id) THEN
              UPDATE flat_table1
              SET guardian_person_id2 = NULL
              WHERE patient_id = @guardian_to_which_patient;
            ELSEIF (@guardian_person_id3 = @guardian_id) THEN
              UPDATE flat_table1
              SET guardian_person_id3 = NULL
              WHERE patient_id = @guardian_to_which_patient;
            ELSEIF (@guardian_person_id4 = @guardian_id) THEN
              UPDATE flat_table1
              SET guardian_person_id4 = NULL
              WHERE patient_id = @guardian_to_which_patient;
            ELSEIF (@guardian_person_id5 = @guardian_id) THEN
              UPDATE flat_table1
              SET guardian_person_id5 = NULL
              WHERE patient_id = @guardian_to_which_patient;
            ELSE
             SET @update_guardian_person = @guardian_to_which_patient;
            END IF;          
          END IF;
        END IF;
			ELSE
			  CALL `proc_insert_basics`(
			    @guardian_id,
					new.date_created,
					new.creator
				); 					

		END IF;				
	END$$
DELIMITER ;
