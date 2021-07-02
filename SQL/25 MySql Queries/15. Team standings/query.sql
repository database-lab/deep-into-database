with t1 AS (
		SELECT *, 
			CASE 
				WHEN host_goals > guest_goals THEN 3 
				WHEN host_goals = guest_goals THEN 1 
				ELSE 0 
			END AS host_points, 
			CASE 
				WHEN host_goals < guest_goals THEN 3 
				WHEN host_goals = guest_goals THEN 1 
				ELSE 0 
			END AS guest_points
		FROM matches 
	) 
	SELECT t.team_name, a.host_points + b.guest_points AS total_points
	FROM teams t JOIN t1 a ON t.team_id = a.host_team JOIN t1 b ON t.team_id = b.guest_team
	ORDER BY total_points DESC, team_name ASC;