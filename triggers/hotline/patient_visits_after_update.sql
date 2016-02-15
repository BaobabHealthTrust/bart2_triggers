DELIMITER $$
DROP TRIGGER IF EXISTS `flat_table2_after_update`$$
CREATE TRIGGER `flat_table2_after_update` AFTER UPDATE
ON `patient_visits`
FOR EACH ROW
BEGIN


  # Get data into fields
  SELECT id, patient_id, visit_date, call_id, call_id_enc_id
  FROM patient_visits WHERE patient_id = NEW.patient_id
  LIMIT 1
    INTO @id, @patient_id, @visit_date, @call_id, @call_id_enc_id;

END$$

DELIMITER ;
