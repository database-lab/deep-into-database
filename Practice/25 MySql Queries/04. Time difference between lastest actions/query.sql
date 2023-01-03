with L1 as 
	( 
		select max(action_date) as last_action, user_id, action, action_date
		from users
		group by user_id
	),
	L2 as 
	(
		select max(action_date) as pre_last_action, user_id, action, action_date
		from users
		group by user_id
		having action_date < (
			select max(action_date) as last_action
			from users as U
			group by U.user_id;
			having user_id = U.user_id
		)
	)
	select user_id, (L1.last_action - L2.pre_last_action) as days_elapsed
	from L1 left join L2 on L1.user_id = L2.user_id
	order by days_elapsed desc;

