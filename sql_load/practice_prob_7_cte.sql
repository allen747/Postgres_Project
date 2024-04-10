SELECT
    job_id,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM
    job_postings_fact

WITH job_location_category AS (
    SELECT
        job_id,
        CASE
            WHEN job_location = 'Anywhere' THEN 'Remote'
            WHEN job_location = 'New York, NY' THEN 'Local'
            ELSE 'Onsite'
        END AS location_category
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
)

SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(job_location_category.job_id) AS job_count
FROM
    job_location_category
INNER JOIN 
    skills_job_dim ON job_location_category.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    location_category = 'Remote'
GROUP BY
    skills_dim.skill_id
ORDER BY
    job_count DESC
LIMIT 5