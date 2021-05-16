with t1 AS (
		SELECT *, rank() OVER (PARTITION by id ORDER BY pay_month DESC) AS month_rank
		FROM employee 
	)
	SELECT id, pay_month, salary, sum(salary) OVER (PARTITION by id ORDER BY month_rank DESC) AS cumulative_sum
	FROM t1 
	WHERE month_rank != 1 AND month_rank <= 4
	ORDER BY id, pay_month;
	