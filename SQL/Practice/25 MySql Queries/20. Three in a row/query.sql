with t1 AS (
		SELECT *, row_number() OVER (ORDER BY event_date) AS day_num
		FROM attendance 
	),
	t2 AS (
		SELECT *
		FROM t1
		WHERE visitors > 100 
	),
	t3 AS (
		SELECT a.day_num AS day1, b.day_num AS day2, c.day_num AS day3
		FROM t2 a JOIN t2 b ON a.day_num = b.day_num - 1 JOIN t2 c ON a.day_num = c.day_num - 2 
	)
	SELECT event_date, visitors
	FROM t1
	WHERE day_num IN (SELECT day1 FROM t3)
		OR day_num IN (SELECT day2 FROM t3)
		OR day_num IN (SELECT day3 FROM t3);