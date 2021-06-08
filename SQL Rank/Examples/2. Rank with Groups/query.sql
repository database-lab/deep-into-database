SELECT first_name, last_name, level, years_experience,
       RANK() OVER (PARTITION BY level ORDER BY years_experience    DESC)
FROM developers;