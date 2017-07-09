With full_hospitals as
(
  Select
    provider_id
  from
    (
        Select
          provider_id,
          count(*) as measure_ids
        from
          my_readmissions
        where measure_id in
            (
              'MORT_30_CABG',
              'MORT_30_COPD',
              'MORT_30_HF',
              'MORT_30_PN',
              'MORT_30_STK',
              'READM_30_CABG',
              'READM_30_COPD',
              'READM_30_HF',
              'READM_30_PN',
              'READM_30_STK',
              'READM_30_HOSP_WIDE',
              'READM_30_HIP_KNEE'
              )
          group by
            provider_id
          having
            measure_ids = 12
    ) a
),

HOSPITAL_RANKS AS
(
    Select
      provider_id,
      a.hospital_name,
      rank() over (order by total_score) as score_rank
    from
    (
      Select
          a.provider_id,
          a.hospital_name,
          sum(score) total_score
      from
        my_readmissions a
      join
        full_hospitals b
      on
          a.provider_id = b.provider_id
      where
        measure_id in
          (
            'MORT_30_CABG',
            'MORT_30_COPD',
            'MORT_30_HF',
            'MORT_30_PN',
            'MORT_30_STK',
            'READM_30_CABG',
            'READM_30_COPD',
            'READM_30_HF',
            'READM_30_PN',
            'READM_30_STK',
            'READM_30_HOSP_WIDE',
            'READM_30_HIP_KNEE'
            )
      group by
        a.hospital_name,
        a.provider_id
    ) a
)

Select
  corr(patient_rank,score_rank)
from
  (
    Select
      provider_number,
      a.hospital_name,
      rank() over (order by hcahps_base_score+hcahps_consistency_score desc) as patient_rank,
      score_rank
    from
      my_surveys_responses a
    join
      HOSPITAL_RANKS b
    on
        a.provider_number = b.provider_id
  ) a;
