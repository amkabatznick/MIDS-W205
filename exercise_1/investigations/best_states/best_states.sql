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
      state,
      avg(total_score) avg_total_score,
      sum(total_score) total_score,
      stddev_pop(total_score) standard_deviation_score
    from
    (
      Select
          a.hospital_name,
          a.state,
          sum(score) total_score
      from
        my_readmissions a
      join
        full_hospitals b
      on
          a.provider_id = b.provider_id
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
        a.hospital_name,
        a.state
    ) a
    group by
      state
    order by
      avg_total_score
    limit 10;
