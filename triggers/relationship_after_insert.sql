DELIMITER $$

DROP TRIGGER IF EXISTS `relationship_after_save`$$
CREATE trigger `relationship_after_save` AFTER INSERT ON relationship

	FOR EACH ROW BEGIN
    #--Get the guardian's person_id
    SET @guardian_id = COALESCE((SELECT person_b FROM relationship
	                               WHERE relationship_id = new.relationship_id
	                               AND voided = 0),0);
	                                   
    #--Check if guardian exist in flat_table1
    SET @guardian_id_in_flat_table = COALESCE((SELECT patient_id FROM flat_table1
	                                             WHERE patient_id = @guardian_id), 0);

    #--Get patient_id
    SET @guardian_to_which_patient = COALESCE((SELECT person_a FROM relationship
	                                             WHERE relationship_id = new.relationship_id
	                                             AND voided = 0), 0);

    IF (@guardian_to_which_patient != 0) THEN
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
        SET @guardian_exist = @guardian_id;
      ELSEIF (@guardian_person_id2 = @guardian_id) THEN
        SET @guardian_exist = @guardian_id;  
      ELSEIF (@guardian_person_id3 = @guardian_id) THEN
        SET @guardian_exist = @guardian_id;  
      ELSEIF (@guardian_person_id4 = @guardian_id) THEN
        SET @guardian_exist = @guardian_id;  
      ELSEIF (@guardian_person_id5 = @guardian_id) THEN
        SET @guardian_exist = @guardian_id;
      ELSE
        SET @guardian_exist = "0";    
      END IF;
    END IF;

    IF (@guardian_id != 0) THEN
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
      
      IF (@guardian_to_which_patient1 = @guardian_to_which_patient) THEN
        SET @patient_exist = @guardian_to_which_patient;
      ELSEIF (@guardian_to_which_patient2 = @guardian_to_which_patient) THEN
        SET @patient_exist = @guardian_to_which_patient;  
      ELSEIF (@guardian_to_which_patient3 = @guardian_to_which_patient) THEN
        SET @patient_exist = @guardian_to_which_patient;  
      ELSEIF (@guardian_to_which_patient4 = @guardian_to_which_patient) THEN
        SET @patient_exist = @guardian_to_which_patient;  
      ELSEIF (@guardian_to_which_patient5 = @guardian_to_which_patient) THEN
        SET @patient_exist = @guardian_to_which_patient;  
      ELSE
        SET @patient_exist = 0;  
      END IF;	                                            
    END IF;
                                     
    #--if guardian_not_in flat_table1 then create
    IF (@guardian_id_in_flat_table = 0) THEN
      CALL `proc_insert_basics`(
	           @guardian_id,
			       new.date_created,
			       new.creator
		       );

      #--update the guardian_person_id fields	
	    IF (@guardian_exist = 0) THEN
	      IF (@guardian_person_id1 = 0) THEN
	        UPDATE flat_table1
	        SET guardian_person_id1 = @guardian_id
	        WHERE patient_id = @guardian_to_which_patient;
	      ELSEIF (@guardian_person_id2 = 0) THEN
	        UPDATE flat_table1
	        SET guardian_person_id2 = @guardian_id
	        WHERE patient_id = @guardian_to_which_patient;	  
	      ELSEIF (@guardian_person_id3 = 0) THEN
	        UPDATE flat_table1
	        SET guardian_person_id3 = @guardian_id
	        WHERE patient_id = @guardian_to_which_patient;	  
	      ELSEIF (@guardian_person_id4 = 0) THEN
	        UPDATE flat_table1
	        SET guardian_person_id4 = @guardian_id
	        WHERE patient_id = @guardian_to_which_patient;	  
	      ELSEIF (@guardian_person_id5 = 0) THEN
	        UPDATE flat_table1
	        SET guardian_person_id5 = @guardian_id
	        WHERE patient_id = @guardian_to_which_patient;	  
	      ELSE
	        SET @guardian_person = @guardian_id;
	      END IF;
	    END IF;
	
	
      #--update the guardian_to_which_patient fields
      IF (@patient_exist = 0) THEN
        IF (@guardian_to_which_patient1 = 0) THEN
          UPDATE flat_table1
          SET guardian_to_which_patient1 = @guardian_to_which_patient
          WHERE patient_id = @guardian_id;
        ELSEIF (@guardian_to_which_patient2 = 0) THEN
          UPDATE flat_table1
          SET guardian_to_which_patient2 = @guardian_to_which_patient
          WHERE patient_id = @guardian_id;    
        ELSEIF (@guardian_to_which_patient3 = 0) THEN
          UPDATE flat_table1
          SET guardian_to_which_patient3 = @guardian_to_which_patient
          WHERE patient_id = @guardian_id;    
        ELSEIF (@guardian_to_which_patient4 = 0) THEN
          UPDATE flat_table1
          SET guardian_to_which_patient4 = @guardian_to_which_patient
          WHERE patient_id = @guardian_id;    
        ELSEIF (@guardian_to_which_patient5 = 0) THEN
          UPDATE flat_table1
          SET guardian_to_which_patient5 = @guardian_to_which_patient
          WHERE patient_id = @guardian_id;    
        ELSE
          SET @guardian_to_which_patient_id = @guardian_to_which_patient;
        END IF;
      END IF;		   
    ELSE
      #--else update the guardian fields
        #--update the guardian_person_id fields	
	    IF (@guardian_exist = 0) THEN
	      IF (@guardian_person_id1 = 0) THEN
	        UPDATE flat_table1
	        SET guardian_person_id1 = @guardian_id
	        WHERE patient_id = @guardian_to_which_patient;
	      ELSEIF (@guardian_person_id2 = 0) THEN
	        UPDATE flat_table1
	        SET guardian_person_id2 = @guardian_id
	        WHERE patient_id = @guardian_to_which_patient;	  
	      ELSEIF (@guardian_person_id3 = 0) THEN
	        UPDATE flat_table1
	        SET guardian_person_id3 = @guardian_id
	        WHERE patient_id = @guardian_to_which_patient;	  
	      ELSEIF (@guardian_person_id4 = 0) THEN
	        UPDATE flat_table1
	        SET guardian_person_id4 = @guardian_id
	        WHERE patient_id = @guardian_to_which_patient;	  
	      ELSEIF (@guardian_person_id5 = 0) THEN
	        UPDATE flat_table1
	        SET guardian_person_id5 = @guardian_id
	        WHERE patient_id = @guardian_to_which_patient;	  
	      ELSE
	        SET @guardian_person = @guardian_id;
	      END IF;
	    END IF;

      #--update the guardian_to_which_patient fields
      IF (@patient_exist = 0) THEN
        IF (@guardian_to_which_patient1 = 0) THEN
          UPDATE flat_table1
          SET guardian_to_which_patient1 = @guardian_to_which_patient
          WHERE patient_id = @guardian_id;
        ELSEIF (@guardian_to_which_patient2 = 0) THEN
          UPDATE flat_table1
          SET guardian_to_which_patient2 = @guardian_to_which_patient
          WHERE patient_id = @guardian_id;    
        ELSEIF (@guardian_to_which_patient3 = 0) THEN
          UPDATE flat_table1
          SET guardian_to_which_patient3 = @guardian_to_which_patient
          WHERE patient_id = @guardian_id;    
        ELSEIF (@guardian_to_which_patient4 = 0) THEN
          UPDATE flat_table1
          SET guardian_to_which_patient4 = @guardian_to_which_patient
          WHERE patient_id = @guardian_id;    
        ELSEIF (@guardian_to_which_patient5 = 0) THEN
          UPDATE flat_table1
          SET guardian_to_which_patient5 = @guardian_to_which_patient
          WHERE patient_id = @guardian_id;    
        ELSE
          SET @guardian_to_which_patient_id = @guardian_to_which_patient;
        END IF;
      END IF;
    END IF;

	END$$

DELIMITER ;

