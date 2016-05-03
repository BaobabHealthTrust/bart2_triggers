DELIMITER $$
DROP TRIGGER IF EXISTS `observation_after_insert1`$$
CREATE TRIGGER `observation_after_insert1` AFTER INSERT
ON `obs`
FOR EACH ROW
BEGIN

   SET @visit = COALESCE((SELECT ID FROM patient_visits WHERE patient_id = new.person_id AND DATE(visit_date) = DATE(new.obs_datetime)), 0);

   SET @encounter_type = COALESCE(( SELECT encounter_type FROM encounter
                            WHERE patient_id = new.person_id
                            AND DATE(encounter_datetime) = DATE(new.obs_datetime)
                            AND encounter_id = new.encounter_id
                            AND voided = 0 AND encounter_type NOT IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)), 0);

   IF (@encounter_type = 0 ) THEN
     CALL proc_insert_observations1(
        new.person_id,
        DATE(new.obs_datetime),
        new.concept_id,
        new.value_coded,
        new.value_coded_name_id,
        new.value_text,
        new.value_numeric,
        new.value_datetime,
        new.value_modifier,
        @visit,
        new.voided,
        new.encounter_id
    );
  ELSE
    CALL proc_insert_observations1(
     new.person_id,
     DATE(new.obs_datetime),
     new.concept_id,
     new.value_coded,
     new.value_coded_name_id,
     new.value_text,
     new.value_numeric,
     new.value_datetime,
     new.value_modifier,
     @visit,
     new.voided,
     new.encounter_id
   );
  END IF;

END$$

DELIMITER ;
