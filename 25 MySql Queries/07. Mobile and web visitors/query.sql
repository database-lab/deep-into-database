with mobileT as (
		select count(*) as moblie_total 
		from mobile
		where user_id not in (select user_id from web)
	),
	webT as 
	(
		select count(*) as web_total
		from web 
		where user_id not in (select user_id from mobile)
	),
	bT as 
	(
		select count(*) as both_total
		from mobile
		where user_id in (select user_id from web)
	),
	total as 
	(
		select mobileT.moblie_total + webT.web_total - bt.both_total as total_number 
	),
	select mobileT.moblie_total / total.total_number as mobile_fraction, 
		   webT.web_total / total.total_number as web_fraction,  
		   bt.both_total / total.total_number as both_fraction;