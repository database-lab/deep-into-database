with t1 AS 
	(
		SELECT user_id, type, access_date AS f2_date
		FROM events
		WHERE type = 'F2' 
	),
	t2 AS 
	(
		SELECT user_id, type, access_date AS premium_date
		FROM events
		WHERE type = 'P' 
	),
	t3 AS 
	(
		SELECT t2.premium_date - u.join_date AS upgrade_time
		FROM users u JOIN t1 ON u.user_id = t1.user_id LEFT JOIN t2 ON u.user_id = t2.user_id 
	)
	SELECT round(1.0 * sum( CASE 
								WHEN upgrade_time < 30 THEN 1 
								ELSE 0 
							END
						   ) / count(*), 2) AS upgrade_rate
	FROM t3