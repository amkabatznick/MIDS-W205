With full_hospitals as
(
  Select
    hospital_name
  from
    (
        Select
          hospital_name,
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
            hospital_name
          having
            measure_ids = 12
      ) a
    )

    Select
        a.hospital_name,
        sum(score) total_score
    from
      my_readmissions a
    join
      full_hospitals b
    on
        a.hospital_name = b.hospital_name
    group by
      a.hospital_name
    order by
      total_score
    limit 10;
