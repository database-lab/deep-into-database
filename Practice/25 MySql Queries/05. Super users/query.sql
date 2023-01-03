with UNT as 
		(
			select user_id, count(*) as number_of_transactions
			from users
			group by user_id
			having number_of_transactions > 1
		),
		select user_id, min(transaction_date) as superuser_date
		from users
		where user_id in ( select user_id from UNT ) and superuser_date > ( 
				select min(transaction_date) 
				from users as U
				group by user_id 
				having U.user_id = user_id
			)
		group by user_id; 