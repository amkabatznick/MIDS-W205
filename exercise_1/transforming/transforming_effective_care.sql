drop table my_effective_care;

create table my_effective_care as
Select
  cast(provider_id as int) provider_id,
  cast(hospital_name as VARCHAR(52)) hospital_name,
  cast(address as VARCHAR(46)) address,
  cast(city as VARCHAR(22)) city,
  cast(state as VARCHAR(4)) state,
  cast(zip_code as int) zip_code,
  cast(county_name as VARCHAR(22)) county_name,
  cast(phone_number as varchar(12)) phone_number,
  cast(condition as varchar(37)) condition,
  cast(measure_id as varchar(18)) measure_id,
  cast(measure_name as varchar(137)) measure_name,
  cast(score as int) score,
  cast(sample as int) sample,
  cast(footnote as varchar(181)) footnote,
  cast(concat(substr(measure_start_date,7,4),'-',substr(measure_start_date,1,2),'-',substr(measure_start_date,4,2)) as DATE) measure_start_date,
  cast(concat(substr(measure_end_date,7,4),'-',substr(measure_end_date,1,2),'-',substr(measure_end_date,4,2)) as DATE) measure_end_date
from effective_care
where where cast(score as int) is not null;
