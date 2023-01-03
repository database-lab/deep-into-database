SELECT s1.month, sum(s2.salary) AS salary_3mos
FROM salaries s1 JOIN salaries s2 ON s1.month <= s2.month  AND s1.month > s2.month - 3
GROUP BY 1
HAVING s1.month < 7
ORDER BY 1 ASC;