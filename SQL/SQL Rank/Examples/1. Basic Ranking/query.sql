SELECT first_name, last_name, level, years_experience,
       RANK() OVER (ORDER BY years_experience DESC)
FROM developers;