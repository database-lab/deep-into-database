-- A success
update user
	set name = "farbod" 
    where id = "00001";

-- B success
select name
from user
where user.id not in (  select user_id
						from orders    );

-- C success
delete from user
where user.id not in (  select user_id
						from orders    );

-- D success
select id
from user
where name = "farbod";

-- E success
select cellphone
from user
where user.cellphone in (   select cellphone
							from driver      );
                            
-- F faild

-- G success
select id
from orders
where datediff(start_time, finish_time) >= 1;

-- H faild

-- I success
select avg( datediff(start_time, finish_time) ) as avg
from orders
where score > 3;

-- J faild

-- K faild

-- L faild

-- M success
select sum(price) as total
from order natural join user
where referred_by = "farbod";