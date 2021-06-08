SELECT first_name, last_name, level, years_experience,
       RANK() OVER (ORDER BY years_experience DESC),
       DENSE_RANK() OVER (ORDER BY years_experience DESC),
       ROW_NUMBER() OVER (ORDER BY years_experience DESC)
FROM developers;