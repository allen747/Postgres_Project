-- WITH companies_with_most_job_postings AS (
--     SELECT 
--         name AS company_name
--     FROM
--         company_dim
--     WHERE 
--         company_id IN (
--             SELECT 
--                 company_id
--             FROM
--                 job_postings_fact
--             WHERE

--         )
--     )

SELECT name
FROM company_dim
WHERE company_id = 572



WITH job_postings AS (
    SELECT
        company_id,
        COUNT(job_id) AS number_of_job_postings
    FROM
        job_postings_fact
    GROUP BY
        company_id
)

SELECT 
    company_dim.name AS company_name,
    job_postings.number_of_job_postings AS num_job_postings
FROM
    job_postings
LEFT JOIN 
    company_dim ON job_postings.company_id = company_dim.company_id
ORDER BY
    num_job_postings DESC;
