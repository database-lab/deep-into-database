with t1 AS (
		SELECT o1.product_id AS prod_1, o2.product_id AS prod_2
		FROM orders o1 JOIN orders o2 ON o1.order_id = o2.order_id AND o1.product_id < o2.product_id 
	),
	t2 AS (
		SELECT concat(p1.name, ' ', p2.name) AS product_pair
		FROM t1 JOIN products p1 ON t1.prod_1 = p1.id JOIN products p2 ON t1.prod_2 = p2.id 
	)
	SELECT *, count(*) AS purchase_freq
	FROM t2
	GROUP BY 1
	ORDER BY 2 DESC 
	LIMIT 3;