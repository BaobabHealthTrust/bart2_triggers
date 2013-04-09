DELIMITER $$
DROP TRIGGER IF EXISTS `flat_table2_after_insert`$$
CREATE TRIGGER `flat_table2_after_insert` AFTER UPDATE 
ON `flat_table2`
FOR EACH ROW
BEGIN
    
    SET @cohort_id = COALESCE((SELECT cohort_id FROM flat_cohort_table c WHERE c.patient_id = NEW.patient_id 
        AND QUARTER(NEW.visit_date) = QUARTER(c.earliest_start_date) AND YEAR(NEW.visit_date) AND YEAR(c.earliest_start_date)), 0);
    
    IF @cohort_id > 0 THEN
    
        SET @patient_id = NEW.patient_id;
    
    END IF;
    
END$$

DELIMITER ;
