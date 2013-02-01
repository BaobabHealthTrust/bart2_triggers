DELIMITER $$

DROP PROCEDURE IF EXISTS `proc_insert_routine_tb_screening`$$

CREATE PROCEDURE `proc_insert_routine_tb_screening`(
    patient_id INT, 
    value_date DATE, 
    field_concept INT, 
    field_value_coded INT,
    field_value_coded_name_id INT,
    field_other VARCHAR(25),
    visit_id INT
)
BEGIN

    SET @pregnant = (SELECT concept_id FROM concept_name WHERE name = "Pregnant");
    
    
END$$

DELIMITER ;
