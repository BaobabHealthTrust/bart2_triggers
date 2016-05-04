DELIMITER $$
DROP TRIGGER IF EXISTS `encounters_hotline_after_update`$$
CREATE TRIGGER `encounters_hotline_after_update` AFTER UPDATE
ON `encounter`
FOR EACH ROW
BEGIN

    # Declare condition for exiting loop
    DECLARE done INT DEFAULT FALSE;

    DECLARE  var_person_id INT(11);
    DECLARE  var_obs_datetime DATE;
    DECLARE  var_concept_id INT(11);
    DECLARE  var_value_coded INT(11);
    DECLARE  var_value_coded_name_id INT(11);
    DECLARE  var_value_text VARCHAR(255);
    DECLARE  var_field_value_numeric DOUBLE;
    DECLARE  var_field_value_datetime DATETIME;
    DECLARE  var_voided INT(11);

    # Declare and initialise cursor for looping through the table
    DECLARE cur CURSOR FOR SELECT DISTINCT person_id, DATE(obs_datetime) datetime, concept_id, value_coded, value_coded_name_id, value_text , value_numeric, value_datetime, voided
        FROM obs WHERE encounter_id = OLD.encounter_id;

    BEGIN

        SET @maternal_Hsymptoms = (SELECT encounter_type_id FROM encounter_type
                                   WHERE name = 'MATERNAL HEALTH SYMPTOMS' LIMIT 1);


    END;

    # Open cursor
    OPEN cur;
    BEGIN
        # Declare loop position check
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

        # Declare loop for traversing through the records
        read_loop: LOOP

            # Get the fields into the variables declared earlier
            FETCH cur INTO var_person_id, var_obs_datetime, var_concept_id, var_value_coded, var_value_coded_name_id, var_value_text , var_field_value_numeric, var_field_value_datetime, var_voided;

            # Check if we are done and exit loop if done
            IF done THEN

                LEAVE read_loop;

            END IF;

            # Not done, process the parameters

           IF new.voided = 1 THEN

                  SET @call_id = (SELECT concept_name.concept_id FROM concept_name concept_name
                                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                  WHERE name = "Call Id" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @pregnancy_status = (SELECT concept_name.concept_id FROM concept_name
                                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                  WHERE name = "Pregnancy Status" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @estimated_date_of_delivery = (SELECT concept_name.concept_id FROM concept_name
                                  	LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                  WHERE name = "Expected due date" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @pregnancy_due_date = (SELECT concept_name.concept_id FROM concept_name
                                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                  WHERE name = "Pregnancy due date" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @danger_signs = (SELECT concept_name.concept_id FROM concept_name concept_name
                                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                        WHERE name = "Danger sign" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @health_symptoms = (SELECT concept_name.concept_id FROM concept_name concept_name
                                            LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                          WHERE name = "Health symptom" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @health_information = (SELECT concept_name.concept_id FROM concept_name concept_name
                                              LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                             WHERE name = "Health information" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @outcome = (SELECT concept_name.concept_id FROM concept_name concept_name
                                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                  WHERE name = "Outcome" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @healthy_facility_name = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                  LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                WHERE name = "Health facility name" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @reason_for_referral = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                              WHERE name = "Reason for referral" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @secondary_outcome = (SELECT concept_name.concept_id FROM concept_name concept_name
                                              LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                            WHERE name = "Secondary Outcome" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @tips_telephone_number = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                  LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                WHERE name = "Telephone number" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @tips_telephone_number_type = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Phone type" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @on_tips_and_reminders_program = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                          LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                        WHERE name = "On tips and reminders program" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @tips_language_preference = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                   WHERE name = "Language preference" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @tips_type_of_message = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                               WHERE name = "Message type" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @tips_type_of_message_content = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                       WHERE name = "Type of message content" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @birth_plan_go_to_hospital_date = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                          LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                        WHERE name = "Go to hospital date" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @birth_plan = (SELECT concept_name.concept_id FROM concept_name concept_name
                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                     WHERE name = "Birth plan" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @antenatal_clinic_patient_appointment = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                                LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                              WHERE name = "Antenatal clinic patient appointment" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @last_ANC_visit_date = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                              WHERE name = "Last ANC Visit Date" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @next_ANC_visit_date = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                              WHERE name = "Next ANC Visit Date" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @baby_delivered = (SELECT concept_name.concept_id FROM concept_name concept_name
                                          LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                        WHERE name = "Delivered" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @baby_delivered_health_facility_name = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                                LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                              WHERE name = "Health facility name" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @baby_delivered_delivery_date = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                      WHERE name = "Delivery date" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @baby_delivered_delivery_location = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                            LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                           WHERE name = "Delivery location" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @birth_plan_delivery_location = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                        LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                      WHERE name = "Delivery location" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @skin_dryness = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Skin dryness" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @fever_of_7_days_or_more = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Fever of 7 days or more" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @diarrhea_for_14_days_or_more = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Diarrhea for 14 days or more" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @blood_in_stool = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Blood in stool" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @cough_for_21_days_or_more = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Cough for 21 days or more" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @not_eating_or_drinking_anything = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Not eating or drinking anything" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @red_eye_for_4_days_or_more_with_visual_problems = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Red eye for 4 days or more with visual problems" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @potential_chect_indrawing = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Potential chest indrawing" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @heavy_vaginal_bleeding_during_pregnancy = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Heavy vaginal bleeding during pregnancy" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @excessive_postnatal_bleeding = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Excessive postnatal bleeding" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @severe_headache = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Severe headache" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @very_sleepy_or_unconscious = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Very sleepy or unconscious" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @convulsions_sign = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Convulsions sign" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @vomiting_everything = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Vomiting everything" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @fever_during_pregnancy_sign = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Fever during pregnancy sign" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @postnatal_fever_sign = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Postnatal fever sign" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @fits_or_convulsions_sign = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Fits or convulsions sign" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @swollen_hands_or_feet_sign = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Swollen hands or feet sign" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @paleness_of_the_skin_and_tiredness_sign = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Paleness of the skin and tiredness sign" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @no_fetal_movements_sign = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "No fetal movements sign" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @water_breaks_sign = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Water breaks sign" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @visual_problems = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Visual problems" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @family_planning = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Family planning" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @crying = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Crying" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @sleeping = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Sleeping" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @feeding_problems = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Feeding problems" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @bowel_movements = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Bowel movements" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @skin_infections = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Skin infections" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @umbilicus_infection = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Umbilicus infection" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @growth_milestones = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Growth milestones" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @accessing_healthcare_services = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Accessing healthcare services" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @healthcare_visits = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Healthcare visits" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @nutrition = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Nutrition" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @body_changes = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Body changes" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @discomfort = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Discomfort" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @concerns = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Concerns" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @emotions = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Emotions" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @warning_signs = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Warning signs" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @routines = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Routines" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @beliefs = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Beliefs" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @babys_growth = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Baby's growth" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @milestones = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Milestones" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @prevention = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Prevention" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @skin_rashes = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Skin rashes" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @diarrhea = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Diarrhea" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @cough = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Cough" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @tachypnea = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Tachypnea" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @eye_infection = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Eye infection" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @fever = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Fever" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @vomiting = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Vomiting" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @vaginal_bleeding_during_pregnancy = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Vaginal bleeding during pregnancy" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @postnatal_bleeding = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Postnatal bleeding" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @not_eating = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Not eating" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @very_sleeping = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Very sleepy" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @unconsious = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Unconscious" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @convulsions_sympton = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Convulsions symptom" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @fever_during_pregnancy_symptom = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Fever during pregnancy symptom" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @postanal_fever_symptom = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Postnatal fever symptom" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @headaches = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Headaches" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @fits_or_convulsions_symptom = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Fits or convulsions symptom" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @swollen_hands_or_feet_symptom = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Swollen hands or feet symptom" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @paleness_of_the_skin_and_tiredness_symptom = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Paleness of the skin and tiredness symptom" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @no_fetal_movements_symptom = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "No fetal movements symptom" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @water_breaks_symptom = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Water breaks symptom" AND voided = 0 AND retired = 0 LIMIT 1);

                  SET @gained_or_lost_weight = (SELECT concept_name.concept_id FROM concept_name concept_name
                                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                                    WHERE name = "Gained or lost weight" AND voided = 0 AND retired = 0 LIMIT 1);

                  CASE var_concept_id

                    WHEN @call_id THEN
						          UPDATE patient_visits SET call_id = NULL, call_id_enc_id = NULL
                      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.call_id_enc_id = OLD.encounter_id;

                    WHEN @pregnancy_status THEN
                        UPDATE patient_visits SET pregnancy_status = NULL, pregnancy_status_enc_id = NULL
                        WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.pregnancy_status_enc_id = OLD.encounter_id;

                    WHEN @estimated_date_of_delivery THEN
                      UPDATE patient_visits SET estimated_date_of_delivery = NULL, estimated_date_of_delivery_enc_id = NULL
                      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.estimated_date_of_delivery_enc_id = OLD.encounter_id;

                    WHEN @pregnancy_status_delivery_date THEN
                      UPDATE patient_visits SET pregnancy_status_delivery_date = NULL, pregnancy_status_delivery_date_enc_id = NULL
                      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.pregnancy_status_delivery_date_enc_id = OLD.encounter_id;

                    WHEN @danger_signs THEN
                      UPDATE patient_visits SET danger_signs = NULL, danger_signs_enc_id = NULL
                      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.danger_signs_enc_id = OLD.encounter_id;

                    WHEN @health_symptoms THEN
                      UPDATE patient_visits SET health_symptoms = NULL, health_symptoms_enc_id = NULL
                      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.health_symptoms_enc_id = OLD.encounter_id;

                    WHEN @health_information THEN
                      UPDATE patient_visits SET health_information = NULL, health_information_enc_id = NULL
                      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.health_information_enc_id = OLD.encounter_id;

                    WHEN @outcome THEN
                      UPDATE patient_visits SET outcome = NULL, outcome_enc_id = NULL
                      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.outcome_enc_id = OLD.encounter_id;

                    WHEN @healthy_facility_name THEN
                      UPDATE patient_visits SET healthy_facility_name = NULL, healthy_facility_name_enc_id = NULL
                      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.healthy_facility_name_enc_id = OLD.encounter_id;

                    WHEN @reason_for_referral THEN
                      UPDATE patient_visits SET reason_for_referral = NULL, reason_for_referral_enc_id = NULL
                      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.reason_for_referral_enc_id = OLD.encounter_id;

                    WHEN @secondary_outcome THEN
                      UPDATE patient_visits SET secondary_outcome = NULL, secondary_outcome_enc_id = NULL
                      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.secondary_outcome_enc_id = OLD.encounter_id;

                    WHEN @tips_telephone_number THEN
                      UPDATE patient_visits SET tips_telephone_number = NULL, tips_telephone_number_enc_id = NULL
                      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.tips_telephone_number_enc_id = OLD.encounter_id;

                    WHEN @tips_telephone_number_type THEN
                      UPDATE patient_visits SET tips_telephone_number_type = NULL, tips_telephone_number_type_enc_id = NULL
                      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.tips_telephone_number_type_enc_id = OLD.encounter_id;

                    WHEN @on_tips_and_reminders_program THEN
                      UPDATE patient_visits SET on_tips_and_reminders_program = NULL, on_tips_and_reminders_program_enc_id = NULL
                      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.on_tips_and_reminders_program_enc_id = OLD.encounter_id;

                    WHEN @tips_language_preference THEN
                      UPDATE patient_visits SET tips_language_preference = NULL, tips_language_preference_enc_id = NULL
                      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.tips_language_preference_enc_id = OLD.encounter_id;

                    WHEN @tips_type_of_message THEN
                      UPDATE patient_visits SET tips_type_of_message = NULL, tips_type_of_message_enc_id = NULL
                      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.tips_type_of_message_enc_id = OLD.encounter_id;

                    WHEN @tips_type_of_message_content THEN
                      UPDATE patient_visits SET tips_type_of_message_content = NULL, tips_type_of_message_content_enc_id = NULL
                      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.tips_type_of_message_content_enc_id = OLD.encounter_id;

                    WHEN @birth_plan_delivery_location THEN
                      UPDATE patient_visits SET birth_plan_delivery_location = NULL, pregnancy_status_delivery_date_enc_id = NULL
                      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.birth_plan_delivery_location_enc_id = OLD.encounter_id;

                    WHEN @birth_plan_go_to_hospital_date THEN
                      UPDATE patient_visits SET birth_plan_go_to_hospital_date = NULL, birth_plan_go_to_hospital_date_enc_id = NULL
                      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.birth_plan_go_to_hospital_date_enc_id = OLD.encounter_id;

                    WHEN @birth_plan THEN
                      UPDATE patient_visits SET birth_plan = NULL, birth_plan_enc_id = NULL
                      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.birth_plan_enc_id = OLD.encounter_id;

                    WHEN @antenatal_clinic_patient_appointment THEN
                      UPDATE patient_visits SET antenatal_clinic_patient_appointment = NULL, antenatal_clinic_patient_appointment_enc_id = NULL
                      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.antenatal_clinic_patient_appointment_enc_id = OLD.encounter_id;

                    WHEN @last_ANC_visit_date THEN
                      UPDATE patient_visits SET last_ANC_visit_date = NULL, pregnancy_status_delivery_date_enc_id = NULL
                      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.last_ANC_visit_date_enc_id = OLD.encounter_id;

                    WHEN @next_ANC_visit_date THEN
                      UPDATE patient_visits SET next_ANC_visit_date = NULL, next_ANC_visit_date_enc_id = NULL
                      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.next_ANC_visit_date_enc_id = OLD.encounter_id;

                    WHEN @baby_delivered THEN
                      UPDATE patient_visits SET baby_delivered = NULL, baby_delivered_enc_id = NULL
                      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.baby_delivered_enc_id = OLD.encounter_id;

                    WHEN @baby_delivered_health_facility_name THEN
                      UPDATE patient_visits SET baby_delivered_health_facility_name = NULL, baby_delivered_health_facility_name_enc_id = NULL
                      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.baby_delivered_health_facility_name_enc_id = OLD.encounter_id;

                    WHEN @baby_delivered_delivery_date THEN
                      UPDATE patient_visits SET baby_delivered_delivery_date = NULL, baby_delivered_delivery_date_enc_id = NULL
                      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.baby_delivered_delivery_date_enc_id = OLD.encounter_id;

                    WHEN @baby_delivered_delivery_location THEN
                      UPDATE patient_visits SET baby_delivered_delivery_location = NULL, baby_delivered_delivery_location_enc_id = NULL
                      WHERE patient_visits.patient_id = OLD.patient_id AND patient_visits.baby_delivered_delivery_location_enc_id = OLD.encounter_id;

                  #--ELSE BEGIN END;
                  ELSE
                    CALL proc_hotline_update_other_field(
                      var_person_id,
                      var_obs_datetime,
                      var_concept_id,
                      var_value_coded,
                      var_value_coded_name_id,
                      var_value_text ,
                      var_field_value_numeric,
                      var_field_value_datetime,
                      NULL,
                      var_voided,
                      OLD.encounter_id);
                  END CASE;

          END IF;

          #--END IF;

        END LOOP;
    END;

END$$

DELIMITER ;
