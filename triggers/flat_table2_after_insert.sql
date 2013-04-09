DELIMITER $$
DROP TRIGGER IF EXISTS `flat_table2_after_insert`$$
CREATE TRIGGER `flat_table2_after_insert` AFTER INSERT 
ON `flat_table2`
FOR EACH ROW
BEGIN

    

END$$

DELIMITER ;
