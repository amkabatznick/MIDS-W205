drop table my_measures;

create table my_measures as
Select
  cast(measure_name as varchar(89)) measure_name,
  cast(measure_id as varchar(20)) measure_id,
  cast(measure_start_quarter as varchar(8)) measure_start_quarter,
  cast(concat(substr(measure_start_date,7,4),'-',substr(measure_start_date,1,2),'-',substr(measure_start_date,4,2)) as DATE) measure_start_date,
  cast(measure_end_quarter as varchar(8)) measure_end_quarter,
  cast(concat(substr(measure_end_date,7,4),'-',substr(measure_end_date,1,2),'-',substr(measure_end_date,4,2)) as DATE) measure_end_date
from measures;
