drop table my_surveys_responses;

CREATE TABLE my_surveys_responses as
Select
  cast(provider_number as	int) provider_number,
  cast(hospital_name as VARCHAR(52)) hospital_name,
  cast(address as VARCHAR(46)) address,
  cast(city as VARCHAR(22)) city,
  cast(state as VARCHAR(4)) state,
  cast(zip_code as int) zip_code ,
  cast(county_name as VARCHAR(22)) county_name,
  cast(communication_with_nurses_achievement_points as varchar(15)) communication_with_nurses_achievement_points,
  cast(communication_with_nurses_improvement_points as varchar(15)) communication_with_nurses_improvement_points,
  cast(communication_with_nurses_dimension_score	as varchar(15)) communication_with_nurses_dimension_score,
  cast(communication_with_doctors_achievement_points as	varchar(15)) communication_with_doctors_achievement_points,
  cast(communication_with_doctors_improvement_points as	varchar(15)) communication_with_doctors_improvement_points,
  cast(communication_with_doctors_dimension_score as varchar(15)) communication_with_doctors_dimension_score,
  cast(responsiveness_of_hospital_staff_achievement_points as	varchar(15)) responsiveness_of_hospital_staff_achievement_points,
  cast(responsiveness_of_hospital_staff_improvement_points as	varchar(15)) responsiveness_of_hospital_staff_improvement_points,
  cast(responsiveness_of_hospital_staff_dimension_score  as varchar(15)) responsiveness_of_hospital_staff_dimension_score,
  cast(pain_management_achievement_points as varchar(15)) pain_management_achievement_points ,
  cast(pain_management_improvement_points as varchar(15)) pain_management_improvement_points,
  cast(pain_management_dimension_score	as varchar(15)) pain_management_dimension_score,
  cast(communication_about_medicines_achievement_points as varchar(15)) communication_about_medicines_achievement_points,
  cast(communication_about_medicines_improvement_points as varchar(15)) communication_about_medicines_improvement_points,
  cast(communication_about_medicines_dimension_score	as varchar(15)) communication_about_medicines_dimension_score,
  cast(cleanliness_and_quietness_of_hospital_environment_achievement_points	as varchar(15)) cleanliness_and_quietness_of_hospital_environment_achievement_points,
  cast(cleanliness_and_quietness_of_hospital_environment_improvement_points	as varchar(15)) cleanliness_and_quietness_of_hospital_environment_improvement_points,
  cast(cleanliness_and_quietness_of_hospital_environment_dimension_score	as varchar(15)) cleanliness_and_quietness_of_hospital_environment_dimension_score,
  cast(discharge_information_achievement_points as varchar(15)) discharge_information_achievement_points,
  cast(discharge_information_improvement_points as varchar(15)) discharge_information_improvement_points ,
  cast(discharge_information_dimension_score	as varchar(15)) discharge_information_dimension_score,
  cast(overall_rating_of_hospital_achievement_points as	varchar(15)) overall_rating_of_hospital_achievement_points,
  cast(overall_rating_of_hospital_improvement_points as	varchar(15)) overall_rating_of_hospital_improvement_points ,
  cast(overall_rating_of_hospital_dimension_score as varchar(15)) overall_rating_of_hospital_dimension_score,
  cast(hcahps_base_score as	int) hcahps_base_score,
  cast(hcahps_consistency_score as int) hcahps_consistency_score
from
  surveys_responses
where
    cast(hcahps_base_score as int) is not null
    and cast(hcahps_consistency_score as int) is not null;
