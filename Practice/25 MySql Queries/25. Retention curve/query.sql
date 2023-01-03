with join_dates AS (
		SELECT user_id, action_date AS join_date
		FROM users
		WHERE action = 'Join' 
	),
	date_vector AS (
		SELECT cast(generate_series(min(action_date), max(action_date), 
					'1 day'::interval) AS date) AS dates
		FROM users 
	),
	all_users_dates AS (
		SELECT DISTINCT user_id, d.dates
		FROM users
		CROSS JOIN date_vector d 
	),
	t1 AS (
		SELECT a.dates - c.join_date AS day_no, b.user_id
		FROM all_users_dates a LEFT JOIN users b ON a.user_id = b.user_id
		AND a.dates = b.action_date JOIN join_dates c ON a.user_id = c.user_id 
		WHERE a.dates - c.join_date >= 0 
	)
	SELECT day_no, count(*) AS n_total, 
       count(DISTINCT user_id) AS n_active, 
       round(1.0*count(DISTINCT user_id)/count(*), 2) AS retention
	FROM t1
	GROUP BY 1;