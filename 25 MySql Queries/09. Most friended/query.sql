with t1 as
	( 
		select user1, count(user2) as rightT
		from friends
		group by user1
	),
	t2 as 
	(
		select user2, count(user1) as leftT
		from friends
		group by user2
	)
	select ( CASE 
			 WHEN t1.user1 is null THEN t2.user2 ELSE t1.user1 ) 
			 END ) as user_id, ( t1.rightT + t2.leftT ) as friends_count
	from t1 cross join t2 on t1.user1 = t2.user2
	order by friends_count desc, user_id asc;