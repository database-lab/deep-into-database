with t1 AS 
	(
		SELECT *, 
			row_number() OVER (PARTITION by state ORDER BY latitude ASC) AS row_number_state, 
			count(*) OVER (PARTITION by state) AS row_count
		FROM stations 
	)
	SELECT state, avg(latitude) AS median_latitude
	FROM t1
	WHERE row_number_state >= 1.0*row_count/2 AND row_number_state <= 1.0*row_count/2 + 1
	GROUP BY state