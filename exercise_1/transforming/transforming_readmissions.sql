drop table my_readmissions;

create table my_readmissions as
Select
  cast(provider_id as	int) provider_id,
  cast(hospital_name as VARCHAR(52)) hospital_name,
  cast(address as VARCHAR(46)) address,
  cast(city as VARCHAR(22)) city,
  cast(state as VARCHAR(4)) state,
  cast(zip_code as int) zip_code,
  cast(county_name as VARCHAR(22)) county_name,
  cast(phone_number as varchar(12) phone_number,
  cast(measure_name as varchar(89) measure_name,
  cast(measure_id as varchar(20)) measure_id,
  cast(compare_to_national as	varchar(37)) compare_to_national,
  cast(denominator	as int) denominator,
  cast(score	as DECIMAL) score,
  cast(lower_estimate as DECIMAL) lower_estimate,
  cast(higher_estimate	as DECIMAL) higher_estimate,
  cast(footnote as	varchar(58)) footnote,
  cast(concat(substr(measure_start_date,7,4),'-',substr(measure_start_date,1,2),'-',substr(measure_start_date,4,2)) as DATE) measure_start_date,
  cast(concat(substr(measure_end_date,7,4),'-',substr(measure_end_date,1,2),'-',substr(measure_end_date,4,2)) as DATE) measure_end_date
from readmissions;
