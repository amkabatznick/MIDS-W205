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
    )

    Select
        a.provider_id,
        a.hospital_name,
        sum(score) total_score,
        avg(score) avg_score,
        stddev_pop(score) standard_deviation_score
    from
      my_readmissions a
    join
      full_hospitals b
    on
        a.provider_id = b.provider_id
    group by
      a.hospital_name,
      a.provider_id
    order by
      total_score
    limit 10;
