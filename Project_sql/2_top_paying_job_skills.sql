/*
Question: What skills are most in demand for the top paying data analyst jobs?
- Use the top 10 highest paying data analyst roles identified in the previous query.
- Add the skills associated with these roles to understand the key competencies required 
  for high-paying positions.
- Why? This analysis will provide insights into the skills that can enhance employability 
  and salary potential for data analysts, guiding career development and training priorities.
*/

WITH top_paying_jobs AS (

    SELECT 
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM 
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE 
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY 
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;   