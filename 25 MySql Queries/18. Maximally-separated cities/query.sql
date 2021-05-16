with t1 AS (
		SELECT s1.state, s1.city AS city1, s2.city AS city2, s1.latitude AS city1_lat, s1.longitude AS city1_long, s2.latitude AS city2_lat, s2.longitude AS city2_long
		FROM stations s1 JOIN stations s2 ON s1.state = s2.state AND s1.city < s2.city 
	),
	t2 AS (
		SELECT *, 
			round(( (city1_lat - city2_lat)^2 + (city1_long - city2_long)^2 ) ^ 0.5, 2) AS dist
		FROM t1 
	),
	t3 AS (
		SELECT *, rank() OVER (PARTITION BY state ORDER BY dist DESC) AS dist_rank
		FROM t2 
	)
	SELECT state, city1, city2, dist
	FROM t3
	WHERE dist_rank = 1