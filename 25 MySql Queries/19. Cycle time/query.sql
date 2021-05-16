with t1 AS (
		SELECT cast(extract(MONTH FROM u2.join_date) AS int) AS month,
			   u1.join_date - u2.join_date AS cycle_time
		FROM users u1 JOIN users u2 ON u1.invited_by = u2.user_id
		ORDER BY 1 
	)
	SELECT month, avg(cycle_time) AS cycle_time_month_avg
	FROM t1
	GROUP BY 1
	ORDER BY 1;