SELECT user_id, (1.0 * publishes / starts) AS publish_rate, (1.0 * cancels / starts) AS cancel_rate
FROM (  SELECT user_id, 
		sum(CASE WHEN action = 'start' THEN 1 ELSE 0 END) AS starts, 
		sum(CASE WHEN action = 'cancel' THEN 1 ELSE 0 END) AS cancels, 
		sum(CASE WHEN action = 'publish' THEN 1 ELSE 0 END) AS publishes
		FROM users
		GROUP BY user_id
);