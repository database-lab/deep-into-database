with t1 AS 
	(
		SELECT start_date
		FROM projects
		WHERE start_date NOT IN (SELECT end_date FROM projects) 
	),
	t2 AS 
	(
		SELECT end_date
		FROM projects
		WHERE end_date NOT IN (SELECT start_date FROM projects) 
	),
	t3 AS 
	(
		SELECT start_date, min(end_date) AS end_date
		FROM t1, t2
		WHERE start_date < end_date
		GROUP BY start_date 
	)
	SELECT *, end_date - start_date AS project_duration
	FROM t3
	ORDER BY project_duration ASC, start_date ASC;