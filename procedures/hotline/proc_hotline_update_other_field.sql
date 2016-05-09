DELIMITER $$

DROP PROCEDURE IF EXISTS `proc_hotline_update_other_field`$$

CREATE PROCEDURE `proc_hotline_update_other_field`(
  IN in_patient_id INT,
  IN in_visit_date DATE,
  IN in_field_concept INT,
  IN in_field_text VARCHAR(255),
  IN in_field_value_coded INT,
  IN in_field_value_coded_name_id INT,
  IN in_field_value_numeric INT,
  IN in_field_value_datetime DATE,
  IN in_visit_id INT,
  IN in_field_voided INT,
  IN encounter_id INT
)

BEGIN

  SET @call_id = (SELECT concept_name.concept_id FROM concept_name concept_name
                                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                     WHERE name = "Call Id" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @pregnancy_status = (SELECT concept_name.concept_id FROM concept_name
                   LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                  WHERE name = "Pregnancy Status" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @pregnancy_due_date = (SELECT concept_name.concept_id FROM concept_name
                  LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                WHERE name = "Pregnancy due date" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @last_menstrual_period_date = (SELECT concept_name.concept_id FROM concept_name concept_name
                          LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                        WHERE name = "Last menstrual period" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @estimated_date_of_delivery = (SELECT concept_name.concept_id FROM concept_name
                   LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                WHERE name = "Expected due date" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @general_outcome = (SELECT concept_name.concept_id FROM concept_name concept_name
                    LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                  WHERE name = "General Outcome" AND voided = 0 AND retired = 0 LIMIT 1);

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
                                    WHERE name = "Telephone number type" AND voided = 0 AND retired = 0 LIMIT 1);

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

  SET @clinic = (SELECT concept_name.concept_id FROM concept_name concept_name
                                  LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                WHERE name = "clinic" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @nearest_health_facility = (SELECT concept_name.concept_id FROM concept_name concept_name
                                  LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                                WHERE name = "Nearest health facility" AND voided = 0 AND retired = 0 LIMIT 1);

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

  SET @very_sleepy = (SELECT concept_name.concept_id FROM concept_name concept_name
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

  SET @phone_type = (SELECT concept_name.concept_id FROM concept_name concept_name
                      LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                     WHERE name = "Phone type" AND voided = 0 AND retired = 0 LIMIT 1);

  SET @purpose_of_call = (SELECT concept_name.concept_id FROM concept_name concept_name
                              LEFT OUTER JOIN concept ON concept.concept_id = concept_name.concept_id
                            WHERE name = "Purpose of call" AND voided = 0 AND retired = 0 LIMIT 1);

	CASE in_field_concept
    When @purpose_of_call THEN
      UPDATE patient_visits
      SET purpose_of_call = NULL, purpose_of_call_enc_id = NULL
      WHERE patient_visits.patient_id  = in_patient_id
      AND patient_visits.purpose_of_call_enc_id = encounter_id;

    When @last_menstrual_period_date THEN
      UPDATE patient_visits
      SET last_menstrual_period_date = NULL, last_menstrual_period_date_enc_id = NULL
      WHERE patient_visits.patient_id  = in_patient_id
      AND patient_visits.last_menstrual_period_date_enc_id = encounter_id;

    When @phone_type THEN
      UPDATE patient_visits
      SET tips_telephone_number_type = NULL, tips_telephone_number_type_enc_id = NULL
      WHERE patient_visits.patient_id  = in_patient_id
      AND patient_visits.tips_telephone_number_type_enc_id = encounter_id;

    WHEN @call_id THEN
      UPDATE patient_visits
      SET call_id = NULL, call_id_enc_id = NULL
      WHERE patient_visits.patient_id = in_patient_id
      AND patient_visits.call_id_enc_id = encounter_id;

    WHEN @pregnancy_status THEN
      UPDATE patient_visits
      SET pregnancy_status = NULL, pregnancy_status_enc_id = NULL
      WHERE patient_visits.patient_id = in_patient_id
      AND patient_visits.pregnancy_status_enc_id = encounter_id;

    WHEN @pregnancy_due_date THEN
      UPDATE patient_visits
      SET pregnancy_due_date = NULL, pregnancy_due_date_enc_id = NULL
      WHERE patient_visits.patient_id = in_patient_id
      AND patient_visits.pregnancy_due_date_enc_id = encounter_id;

    WHEN @last_menstrual_period_date THEN
      UPDATE patient_visits
      SET last_menstrual_period_date = NULL, last_menstrual_period_date_enc_id = NULL
      WHERE patient_visits.patient_id = in_patient_id
      AND patient_visits.last_menstrual_period_date_enc_id = encounter_id;

    WHEN @estimated_date_of_delivery THEN
        UPDATE patient_visits
        SET estimated_date_of_delivery = NULL, estimated_date_of_delivery_enc_id = NULL
        WHERE patient_visits.patient_id = in_patient_id
        AND patient_visits.estimated_date_of_delivery_enc_id = encounter_id;

    WHEN @pregnancy_status_delivery_date THEN
      UPDATE patient_visits
      SET pregnancy_status_delivery_date = NULL, pregnancy_status_delivery_date_enc_id = NULL
      WHERE patient_visits.patient_id = in_patient_id
      AND patient_visits.pregnancy_status_delivery_date_enc_id = encounter_id;

    WHEN @general_outcome THEN
      UPDATE patient_visits
      SET general_outcome = NULL, general_outcome_enc_id = NULL
      WHERE patient_visits.patient_id = in_patient_id
      AND patient_visits.general_outcome_enc_id = encounter_id;

    WHEN @healthy_facility_name THEN
      UPDATE patient_visits
      SET healthy_facility_name = NULL, healthy_facility_name_enc_id = NULL
      WHERE patient_visits.patient_id = in_patient_id
      AND patient_visits.healthy_facility_name_enc_id = encounter_id;

    WHEN @reason_for_referral THEN
      UPDATE patient_visits
      SET reason_for_referral = NULL, reason_for_referral_enc_id = NULL
      WHERE patient_visits.patient_id = in_patient_id
      AND patient_visits.reason_for_referral_enc_id = encounter_id;

    WHEN @secondary_outcome THEN
      UPDATE patient_visits
      SET secondary_outcome = NULL, secondary_outcome_enc_id = NULL
      WHERE patient_visits.patient_id = in_patient_id
      AND patient_visits.secondary_outcome_enc_id = encounter_id;

    WHEN @tips_telephone_number THEN
      UPDATE patient_visits
      SET tips_telephone_number = NULL, tips_telephone_number_enc_id = NULL
      WHERE patient_visits.patient_id = in_patient_id
      AND patient_visits.tips_telephone_number_enc_id = encounter_id;

    WHEN @tips_telephone_number_type THEN
      UPDATE patient_visits
      SET tips_telephone_number_type = NULL, tips_telephone_number_type_enc_id = NULL
      WHERE patient_visits.patient_id = in_patient_id
      AND patient_visits.tips_telephone_number_type_enc_id = encounter_id;

    WHEN @on_tips_and_reminders_program THEN
      UPDATE patient_visits
      SET on_tips_and_reminders_program = NULL, on_tips_and_reminders_program_enc_id = NULL
      WHERE patient_visits.patient_id = in_patient_id
      AND patient_visits.on_tips_and_reminders_program_enc_id = encounter_id;

    WHEN @tips_language_preference THEN
      UPDATE patient_visits
      SET tips_language_preference = NULL, tips_language_preference_enc_id = NULL
      WHERE patient_visits.patient_id = in_patient_id
      AND patient_visits.tips_language_preference_enc_id = encounter_id;

    WHEN @tips_type_of_message THEN
      UPDATE patient_visits
      SET tips_type_of_message = NULL, tips_type_of_message_enc_id = NULL
      WHERE patient_visits.patient_id = in_patient_id
      AND patient_visits.tips_type_of_message_enc_id = encounter_id;

    WHEN @tips_type_of_message_content THEN
      UPDATE patient_visits
      SET tips_type_of_message_content = NULL, tips_type_of_message_content_enc_id = NULL
      WHERE patient_visits.patient_id = in_patient_id
      AND patient_visits.tips_type_of_message_content_enc_id = encounter_id;

    WHEN @birth_plan_delivery_location THEN
      UPDATE patient_visits
      SET birth_plan_delivery_location = NULL, pregnancy_status_delivery_date_enc_id = NULL
      WHERE patient_visits.patient_id = in_patient_id
      AND patient_visits.birth_plan_delivery_location_enc_id = encounter_id;

    WHEN @birth_plan_go_to_hospital_date THEN
      UPDATE patient_visits
      SET birth_plan_go_to_hospital_date = NULL, birth_plan_go_to_hospital_date_enc_id = NULL
      WHERE patient_visits.patient_id = in_patient_id
      AND patient_visits.birth_plan_go_to_hospital_date_enc_id = encounter_id;

    WHEN @birth_plan THEN
      UPDATE patient_visits
      SET birth_plan = NULL, birth_plan_enc_id = NULL
      WHERE patient_visits.patient_id = in_patient_id
      AND patient_visits.birth_plan_enc_id = encounter_id;

    WHEN @antenatal_clinic_patient_appointment THEN
      UPDATE patient_visits
      SET antenatal_clinic_patient_appointment = NULL, antenatal_clinic_patient_appointment_enc_id = NULL
      WHERE patient_visits.patient_id = in_patient_id
      AND patient_visits.antenatal_clinic_patient_appointment_enc_id = encounter_id;

    WHEN @last_ANC_visit_date THEN
      UPDATE patient_visits
      SET last_ANC_visit_date = NULL, pregnancy_status_delivery_date_enc_id = NULL
      WHERE patient_visits.patient_id = in_patient_id
      AND patient_visits.last_ANC_visit_date_enc_id = encounter_id;

    WHEN @next_ANC_visit_date THEN
      UPDATE patient_visits
      SET next_ANC_visit_date = NULL, next_ANC_visit_date_enc_id = NULL
      WHERE patient_visits.patient_id = in_patient_id
      AND patient_visits.next_ANC_visit_date_enc_id = encounter_id;

    WHEN @nearest_health_facility THEN
      UPDATE patient_visits
      SET nearest_health_facility = NULL, nearest_health_facility_enc_id = NULL
      WHERE patient_visits.patient_id = in_patient_id
      AND patient_visits.nearest_health_facility_enc_id = encounter_id;

    WHEN @clinic THEN
      UPDATE patient_visits
      SET clinic = NULL, clinic_enc_id = NULL
      WHERE patient_visits.patient_id = in_patient_id
      AND patient_visits.clinic_enc_id = encounter_id;

    WHEN @baby_delivered THEN
      UPDATE patient_visits
      SET baby_delivered = NULL, baby_delivered_enc_id = NULL
      WHERE patient_visits.patient_id = in_patient_id
      AND patient_visits.baby_delivered_enc_id = encounter_id;

    WHEN @baby_delivered_health_facility_name THEN
      UPDATE patient_visits
      SET baby_delivered_health_facility_name = NULL, baby_delivered_health_facility_name_enc_id = NULL
      WHERE patient_visits.patient_id = in_patient_id
      AND patient_visits.baby_delivered_health_facility_name_enc_id = encounter_id;

    WHEN @baby_delivered_delivery_date THEN
      UPDATE patient_visits
      SET baby_delivered_delivery_date = NULL, baby_delivered_delivery_date_enc_id = NULL
      WHERE patient_visits.patient_id = in_patient_id
      AND patient_visits.baby_delivered_delivery_date_enc_id = encounter_id;

    WHEN @baby_delivered_delivery_location THEN
      UPDATE patient_visits
      SET baby_delivered_delivery_location = NULL, baby_delivered_delivery_location_enc_id = NULL
      WHERE patient_visits.patient_id = in_patient_id
      AND patient_visits.baby_delivered_delivery_location_enc_id = encounter_id;

    WHEN @skin_dryness  THEN
          UPDATE patient_visits
          SET skin_dryness = NULL, skin_dryness_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id
          AND patient_visits.skin_dryness_enc_id = encounter_id;

    WHEN @fever_of_7_days_or_more THEN
          UPDATE patient_visits
          SET fever_of_7_days_or_more = NULL, fever_of_7_days_or_more_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id
          AND patient_visits.fever_of_7_days_or_more_enc_id = encounter_id;

    WHEN @diarrhea_for_14_days_or_more THEN
          UPDATE patient_visits
          SET diarrhea_for_14_days_or_more = NULL, diarrhea_for_14_days_or_more_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id
          AND patient_visits.diarrhea_for_14_days_or_more_enc_id = encounter_id;

    WHEN @blood_in_stool THEN
          UPDATE patient_visits
          SET blood_in_stool = NULL, blood_in_stool_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id
          AND patient_visits.blood_in_stool_enc_id = encounter_id;

    WHEN @cough_for_21_days_or_more THEN
          UPDATE patient_visits
          SET cough_for_21_days_or_more = NULL, cough_for_21_days_or_more_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id
          AND patient_visits.cough_for_21_days_or_more_enc_id = encounter_id;

    WHEN @not_eating_or_drinking_anything THEN
          UPDATE patient_visits
          SET not_eating_or_drinking_anything = NULL, not_eating_or_drinking_anything_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id
          AND patient_visits.not_eating_or_drinking_anything_enc_id = encounter_id;

    WHEN @red_eye_for_4_days_or_more_with_visual_problems THEN
          UPDATE patient_visits
          SET red_eye_for_4_days_or_more_with_visual_problems = NULL, red_eye_for_4_days_or_more_with_visual_problems_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id
          AND patient_visits.red_eye_for_4_days_or_more_with_visual_problems_enc_id = encounter_id;

    WHEN @potential_chest_indrawing THEN
          UPDATE patient_visits
          SET potential_chest_indrawing = NULL, potential_chest_indrawing_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id
          AND patient_visits.potential_chest_indrawing_enc_id = encounter_id;

    WHEN @heavy_vaginal_bleeding_during_pregnancy THEN
          UPDATE patient_visits
          SET heavy_vaginal_bleeding_during_pregnancy = NULL, heavy_vaginal_bleeding_during_pregnancy_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id
          AND patient_visits.heavy_vaginal_bleeding_during_pregnancy_enc_id = encounter_id;

    WHEN @excessive_postnatal_bleeding THEN
          UPDATE patient_visits
          SET excessive_postnatal_bleeding = NULL, excessive_postnatal_bleeding_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id
          AND patient_visits.excessive_postnatal_bleeding_enc_id = encounter_id;

    WHEN @severe_headache THEN
          UPDATE patient_visits
          SET severe_headache = NULL, severe_headache_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id
          AND patient_visits.severe_headache_enc_id = encounter_id;

    WHEN @very_sleepy_or_unconscious THEN
          UPDATE patient_visits
          SET very_sleepy_or_unconscious = NULL, very_sleepy_or_unconscious_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id
          AND patient_visits.very_sleepy_or_unconscious_enc_id = encounter_id;

    WHEN @convulsions_sign THEN
          UPDATE patient_visits
          SET convulsions_sign = NULL, convulsions_sign_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id
          AND patient_visits.convulsions_sign_enc_id = encounter_id;

    WHEN @vomiting_everything THEN
          UPDATE patient_visits
          SET vomiting_everything = NULL, vomiting_everything_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id
          AND patient_visits.vomiting_everything_enc_id = encounter_id;

    WHEN @fever_during_pregnancy_sign THEN
          UPDATE patient_visits
          SET fever_during_pregnancy_sign = NULL, fever_during_pregnancy_sign_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id
          AND patient_visits.fever_during_pregnancy_sign_enc_id = encounter_id;

    WHEN @postnatal_fever_sign THEN
          UPDATE patient_visits
          SET postnatal_fever_sign = NULL, postnatal_fever_sign_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id
          AND patient_visits.postnatal_fever_sign_enc_id = encounter_id;

    WHEN @fits_or_convulsions_sign THEN
          UPDATE patient_visits
          SET fits_or_convulsions_sign = NULL, fits_or_convulsions_sign_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id
          AND patient_visits.fits_or_convulsions_sign_enc_id = encounter_id;

    WHEN @swollen_hands_feet_sign THEN
          UPDATE patient_visits
          SET baby_swollen_hands_feet_sign = NULL, baby_swollen_hands_feet_sign_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id
          AND patient_visits.baby_swollen_hands_feet_sign_enc_id = encounter_id;

    WHEN @paleness_of_the_skin_and_tiredness_sign THEN
          UPDATE patient_visits
          SET paleness_of_the_skin_and_tiredness_sign = NULL, paleness_of_the_skin_and_tiredness_sign_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id
          AND patient_visits.paleness_of_the_skin_and_tiredness_sign_enc_id = encounter_id;

    WHEN @no_fetal_movements_sign THEN
          UPDATE patient_visits
          SET no_fetal_movements_sign = NULL, no_fetal_movements_sign_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id
          AND patient_visits.no_fetal_movements_sign_enc_id = encounter_id;

    WHEN @water_breaks_sign THEN
          UPDATE patient_visits
          SET water_breaks_sign = NULL, water_breaks_sign_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id
          AND patient_visits.water_breaks_sign_enc_id = encounter_id;

    WHEN @visual_problems THEN
          UPDATE patient_visits
          SET visual_problems = NULL, visual_problems_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id
          AND patient_visits.visual_problems_enc_id = encounter_id;

    WHEN @diarrhea THEN
          UPDATE patient_visits
          SET diarrhea = NULL, diarrhea_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id
          AND patient_visits.diarrhea_enc_id = encounter_id;

    WHEN @cough THEN
          UPDATE patient_visits
          SET cough = NULL, cough_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id
          AND patient_visits.cough_enc_id = encounter_id;

    WHEN @tachypnea THEN
          UPDATE patient_visits
          SET tachypnea = NULL, tachypnea_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id
          AND patient_visits.tachypnea_enc_id = encounter_id;

    WHEN @eye_infection THEN
          UPDATE patient_visits
          SET eye_infection = NULL, eye_infection_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id
          AND patient_visits.eye_infection_enc_id = encounter_id;

    WHEN @fever THEN
          UPDATE patient_visits
          SET fever = NULL, fever_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id
          AND patient_visits.fever_enc_id = encounter_id;

    WHEN @vomiting THEN
          UPDATE patient_visits SET vomiting = NULL, vomiting_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id AND patient_visits.vomiting_enc_id = encounter_id;

    WHEN @vaginal_bleeding_during_pregnancy THEN
          UPDATE patient_visits SET vaginal_bleeding_during_pregnancy = NULL, vaginal_bleeding_during_pregnancy_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id AND patient_visits.vaginal_bleeding_during_pregnancy_enc_id = encounter_id;

    WHEN @postnatal_bleeding THEN
          UPDATE patient_visits SET postnatal_bleeding = NULL, postnatal_bleeding_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id AND patient_visits.postnatal_bleeding_enc_id = encounter_id;

    WHEN @Not_eating THEN
          UPDATE patient_visits SET not_eating = NULL, not_eating_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id AND patient_visits.not_eating_enc_id = encounter_id;

    WHEN @very_sleepy THEN
          UPDATE patient_visits SET very_sleepy = NULL, very_sleepy_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id AND patient_visits.very_sleepy_enc_id = encounter_id;

    WHEN @unconscious THEN
          UPDATE patient_visits SET unconscious = NULL, unconscious_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id AND patient_visits.unconscious_enc_id = encounter_id;

    WHEN @convulsions_symptom THEN
          UPDATE patient_visits SET convulsions_symptom = NULL, convulsions_symptom_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id AND patient_visits.convulsions_symptom_enc_id = encounter_id;

    WHEN @fever_during_pregnancy_symptom THEN
          UPDATE patient_visits SET fever_during_pregnancy_symptom = NULL, fever_during_pregnancy_symptom_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id AND patient_visits.fever_during_pregnancy_symptom_enc_id = encounter_id;

    WHEN @postnatal_fever_symptom THEN
          UPDATE patient_visits SET postnatal_fever_symptom = NULL, postnatal_fever_symptom_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id AND patient_visits.postnatal_fever_symptom_enc_id = encounter_id;

    WHEN @headaches THEN
          UPDATE patient_visits SET headaches = NULL, headaches_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id AND patient_visits.headaches_enc_id = encounter_id;

    WHEN @fits_or_convulsions_symptom THEN
          UPDATE patient_visits SET fits_or_convulsions_symptom = NULL, fits_or_convulsions_symptom_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id AND patient_visits.fits_or_convulsions_symptom_enc_id = encounter_id;

    WHEN @swollen_hands_or_feet_symptom THEN
          UPDATE patient_visits SET swollen_hands_or_feet_symptom = NULL, swollen_hands_or_feet_symptom_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id AND patient_visits.swollen_hands_or_feet_symptom_enc_id = encounter_id;

    WHEN @paleness_of_the_skin_and_tiredness_symptom THEN
          UPDATE patient_visits SET paleness_of_the_skin_and_tiredness_symptom = NULL, paleness_of_the_skin_and_tiredness_symptom_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id AND patient_visits.paleness_of_the_skin_and_tiredness_symptom_enc_id = encounter_id;

    WHEN @no_fetal_movements_symptom THEN
          UPDATE patient_visits SET baby_no_fetal_movements_symptom = NULL, no_fetal_movements_symptom_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id AND patient_visits.no_fetal_movements_symptom_enc_id = encounter_id;

    WHEN @water_breaks_symptom THEN
          UPDATE patient_visits SET water_breaks_symptom = NULL, water_breaks_symptom_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id AND patient_visits.water_breaks_symptom_enc_id = encounter_id;

    WHEN @gained_or_lost_weight THEN
          UPDATE patient_visits SET gained_or_lost_weight = NULL, gained_or_lost_weight_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id AND patient_visits.gained_or_lost_weight_enc_id = encounter_id;

    WHEN @family_planning THEN
          UPDATE patient_visits SET family_planning = NULL, family_planning_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id AND patient_visits.family_planning_enc_id = encounter_id;

    WHEN @crying THEN
          UPDATE patient_visits SET crying = NULL, crying_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id AND patient_visits.crying_enc_id = encounter_id;

    WHEN @sleeping THEN
          UPDATE patient_visits SET sleeping = NULL, sleeping_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id AND patient_visits.sleeping_enc_id = encounter_id;

    WHEN @feeding_problems THEN
          UPDATE patient_visits SET feeding_problems = NULL, feeding_problems_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id AND patient_visits.feeding_problems_enc_id = encounter_id;

    WHEN @bowel_movements THEN
          UPDATE patient_visits SET bowel_movements = NULL, bowel_movements_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id AND patient_visits.bowel_movements_enc_id = encounter_id;

    WHEN @skin_infections THEN
          UPDATE patient_visits SET skin_infections = NULL, skin_infections_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id AND patient_visits.skin_infections_enc_id = encounter_id;

    WHEN @umbilicus_infection THEN
          UPDATE patient_visits SET umbilicus_infection = NULL, umbilicus_infection_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id AND patient_visits.umbilicus_infection_enc_id = encounter_id;

    WHEN @growth_milestones THEN
          UPDATE patient_visits SET growth_milestones = NULL, growth_milestones_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id AND patient_visits.growth_milestones_enc_id = encounter_id;

    WHEN @accessing_healthcare_services THEN
          UPDATE patient_visits SET accessing_healthcare_services = NULL, accessing_healthcare_services_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id AND patient_visits.accessing_healthcare_services_enc_id = encounter_id;

    WHEN @healthcare_visits THEN
          UPDATE patient_visits SET healthcare_visits = NULL, healthcare_visits_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id AND patient_visits.healthcare_visits_enc_id = encounter_id;

    WHEN @nutrition THEN
          UPDATE patient_visits SET nutrition = NULL, nutrition_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id AND patient_visits.nutrition_enc_id = encounter_id;

    WHEN @body_changes THEN
          UPDATE patient_visits SET body_changes = NULL, body_changes_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id AND patient_visits.body_changes_enc_id = encounter_id;

    WHEN @discomfort THEN
          UPDATE patient_visits SET discomfort = NULL, discomfort_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id AND patient_visits.discomfort_enc_id = encounter_id;

    WHEN @concerns THEN
          UPDATE patient_visits SET concerns = NULL, concerns_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id AND patient_visits.concerns_enc_id = encounter_id;

    WHEN @emotions THEN
          UPDATE patient_visits SET emotions = NULL, emotions_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id AND patient_visits.emotions_enc_id = encounter_id;

    WHEN @warning_signs THEN
          UPDATE patient_visits SET warning_signs = NULL, warning_signs_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id AND patient_visits.warning_signs_enc_id = encounter_id;

    WHEN @routines THEN
          UPDATE patient_visits SET routines = NULL, routines_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id AND patient_visits.routines_enc_id = encounter_id;

    WHEN @beliefs THEN
          UPDATE patient_visits SET beliefs = NULL, beliefs_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id AND patient_visits.beliefs_enc_id = encounter_id;

    WHEN @babys_growth THEN
          UPDATE patient_visits SET babys_growth = NULL, babys_growth_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id AND patient_visits.babys_growth_enc_id = encounter_id;

    WHEN @milestones THEN
          UPDATE patient_visits SET milestones = NULL, milestones_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id AND patient_visits.milestones_enc_id = encounter_id;

    WHEN @revention THEN
          UPDATE patient_visits SET revention = NULL, revention_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id AND patient_visits.revention_enc_id = encounter_id;

    WHEN @skin_rashes THEN
          UPDATE patient_visits SET skin_rashes = NULL, skin_rashes_enc_id = NULL
          WHERE patient_visits.patient_id = in_patient_id AND patient_visits.skin_rashes_enc_id = encounter_id;
	ELSE
		SET @new = in_patient_id;
  END CASE;

END$$

DELIMITER ;
