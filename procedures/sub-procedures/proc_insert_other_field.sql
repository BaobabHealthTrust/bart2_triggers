DELIMITER $$

DROP PROCEDURE IF EXISTS `proc_insert_other_field`$$

CREATE PROCEDURE `proc_insert_other_field`(
    IN in_patient_id INT, 
    IN in_visit_date DATE, 
    IN in_field_concept INT, 
    IN in_field_value_coded INT,
    IN in_field_value_coded_name_id INT,
    IN in_field_other VARCHAR(100),
    IN in_visit_id INT
)
BEGIN

    SET @Weight = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Weight" AND voided = 0 AND retired = 0 LIMIT 1);
    
    SET @Height = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Height (cm)" AND voided = 0 AND retired = 0 LIMIT 1);
    
    SET @Temperature = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Temperature" AND voided = 0 AND retired = 0 LIMIT 1);
    
    SET @BMI = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "BMI" AND voided = 0 AND retired = 0 LIMIT 1);
    
    SET @systolic_blood_pressure = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Systolic blood pressure" AND voided = 0 AND retired = 0 LIMIT 1);
    
    SET @diastolic_blood_pressure = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Diastolic blood pressure" AND voided = 0 AND retired = 0 LIMIT 1);
    
    SET @weight_for_height = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Weight for height percent of median" AND voided = 0 AND retired = 0 LIMIT 1);
    
    SET @weight_for_age = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Weight for age percent of median" AND voided = 0 AND retired = 0 LIMIT 1);
    
    SET @height_for_age = (SELECT concept_name.concept_id FROM concept_name LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id WHERE name = "Height for age percent of median" AND voided = 0 AND retired = 0 LIMIT 1);
    
    CASE in_field_concept
    
        WHEN @Weight THEN
        
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, Weight) VALUES (in_patient_id, in_visit_date, in_field_other);
            
            ELSE 
            
                UPDATE flat_table2 SET Weight = in_field_other WHERE flat_table2.id = in_visit_id;
                
            END IF;       
    
        WHEN @Height THEN
        
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, Height) VALUES (in_patient_id, in_visit_date, in_field_other);
            
            ELSE 
            
                UPDATE flat_table2 SET Height = in_field_other WHERE flat_table2.id = in_visit_id;
                
            END IF;         
    
        WHEN @Temperature THEN
        
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, Temperature) VALUES (in_patient_id, in_visit_date, in_field_other);
            
            ELSE 
            
                UPDATE flat_table2 SET Temperature = in_field_other WHERE flat_table2.id = in_visit_id;
                
            END IF;           
    
        WHEN @BMI THEN
        
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, BMI) VALUES (in_patient_id, in_visit_date, in_field_other);
            
            ELSE 
            
                UPDATE flat_table2 SET BMI = in_field_other WHERE flat_table2.id = in_visit_id;
                
            END IF;               
    
        WHEN @systolic_blood_pressure THEN
        
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, systolic_blood_pressure) VALUES (in_patient_id, in_visit_date, in_field_other);
            
            ELSE 
            
                UPDATE flat_table2 SET systolic_blood_pressure = in_field_other WHERE flat_table2.id = in_visit_id;
                
            END IF;                  
    
        WHEN @diastolic_blood_pressure THEN
        
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, diastolic_blood_pressure) VALUES (in_patient_id, in_visit_date, in_field_other);
            
            ELSE 
            
                UPDATE flat_table2 SET diastolic_blood_pressure = in_field_other WHERE flat_table2.id = in_visit_id;
                
            END IF;                    
    
        WHEN @weight_for_height THEN
        
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, weight_for_height) VALUES (in_patient_id, in_visit_date, in_field_other);
            
            ELSE 
            
                UPDATE flat_table2 SET weight_for_height = in_field_other WHERE flat_table2.id = in_visit_id;
                
            END IF;                      
    
        WHEN @weight_for_age THEN
        
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, weight_for_age) VALUES (in_patient_id, in_visit_date, in_field_other);
            
            ELSE 
            
                UPDATE flat_table2 SET weight_for_age = in_field_other WHERE flat_table2.id = in_visit_id;
                
            END IF;                     
    
        WHEN @height_for_age THEN
        
            IF in_visit_id = 0 THEN
            
                INSERT INTO flat_table2 (patient_id, visit_date, height_for_age) VALUES (in_patient_id, in_visit_date, in_field_other);
            
            ELSE 
            
                UPDATE flat_table2 SET height_for_age = in_field_other WHERE flat_table2.id = in_visit_id;
                
            END IF;              
    
    END CASE;
    
END$$

DELIMITER ;
