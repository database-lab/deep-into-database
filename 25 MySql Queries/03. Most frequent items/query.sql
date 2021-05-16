with t1 as (
		select date, item, count(*) as item_count
		from items
		group by date, item
		order by date
	),
	t2 as 
	(
		select *, 
			rank() OVER (partition by date order by item_count desc) AS date_rank FROM t1
	)
	SELECT date, item
	FROM t2
	WHERE date_rank = 1