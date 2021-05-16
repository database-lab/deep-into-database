with debits AS (
		select sender, sum(amount) as debited
		from transactions
		group by sender
	),
	credits AS (
		select receiver, sum(amount) as credited
		from transactions
		group by receiver
	)
	select debits.sender, (credits.credited - debits.debited) as net_change
	from debits join credits on debits.sender = credits.receiver
	order by net_change desc;