Select
  measure_id,
  measure_name,
  stddev_pop(score) sd_score
from
  my_effective_care
where
  condition not in ('Pregnancy and Delivery Care','Emergency Department')
  and measure_name not in ('Stroke Education','Healthcare workers given influenza vaccination','Home Management Plan of Care Document','Median Time to ECG','Median Time to Fibrinolysis','Median Time to Transfer to Another Facility for Acute Coronary Intervention')
group by
  measure_id,
  measure_name
order by
  sd_score desc
limit 10;


Select
  stddev_pop(score)
from
  my_effective_care
where
  condition not in ('Pregnancy and Delivery Care','Emergency Department')
  and measure_name not in ('Stroke Education','Healthcare workers given influenza vaccination','Home Management Plan of Care Document','Median Time to ECG','Median Time to Fibrinolysis','Median Time to Transfer to Another Facility for Acute Coronary Intervention');
