DELIMITER $$
DROP TRIGGER IF EXISTS `patient_visits3`$$
CREATE TRIGGER `patient_visits3` AFTER INSERT
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
