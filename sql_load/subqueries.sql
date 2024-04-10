-- SELECT
--     job_title_short,
--     job_location
-- FROM 
--     job_postings_fact
-- LIMIT 10;


-- SELECT
--     -- job_title_short,
--     -- job_location,
--     CASE
--         WHEN job_location = 'Anywhere' THEN 'Remote'
--         WHEN job_location = 'New York, NY' THEN 'Local'
--         ELSE 'Onsite'
--     END AS location_category,
--     COUNT(job_id) AS job_postings
-- FROM
--     job_postings_fact
-- WHERE
--     job_title_short = 'Data Analyst'
-- GROUP BY
--     location_category

SELECT name AS company_name
FROM company_dim
WHERE company_id IN (
    SELECT 
        company_id
    FROM
        job_postings_fact
    WHERE
        job_no_degree_mention = true
)

SELECT 
    company_id,
    job_no_degree_mention
FROM
    job_postings_fact
WHERE
    job_no_degree_mention = true
LIMIT 10;