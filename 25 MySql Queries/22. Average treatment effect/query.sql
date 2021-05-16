with control AS (
		SELECT 1.0*sum(outcome)/count(*) AS avg_outcome, 
			   stddev(outcome) AS std_dev, 
			   count(*) AS group_size
		FROM study
		WHERE assignment = 0 
	),
	treatment AS (
		SELECT 1.0*sum(outcome)/count(*) AS avg_outcome, 
			   stddev(outcome) AS std_dev, 
			   count(*) AS group_size
		FROM study
		WHERE assignment = 1 
	),
	effect_size AS (
		SELECT t.avg_outcome - c.avg_outcome AS effect_size
		FROM control c, treatment t 
	),
	conf_interval AS (
		SELECT 1.96 * (t.std_dev^2 / t.group_size 
					 + c.std_dev^2 / c.group_size)^0.5 AS conf_int
		FROM treatment t, control c 
	)
	SELECT round(es.effect_size, 3) AS point_estimate, 
		   round(es.effect_size - ci.conf_int, 3) AS lower_bound, 
		   round(es.effect_size + ci.conf_int, 3) AS upper_bound
	FROM effect_size es, conf_interval ci;