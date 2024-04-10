SELECT 
    job_title_short,
    job_location,
    quarter1_job_postings.job_via,
    quarter1_job_postings.job_posted_date::Date,
    quarter1_job_postings.salary_year_avg
FROM (
    SELECT *
    FROM jan_2023_jobs
    UNION ALL
    SELECT *
    FROM feb_2023_jobs
    UNION ALL
    SELECT *
    FROM mar_2023_jobs
) AS quarter1_job_postings
WHERE
    quarter1_job_postings.salary_year_avg > 70000
    AND
    quarter1_job_postings.job_title_short = 'Data Analyst'
ORDER BY
    quarter1_job_postings.salary_year_avg DESC
