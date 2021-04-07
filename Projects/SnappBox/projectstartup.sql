CREATE DATABASE DBHM1;

CREATE TYPE Toman as int final;

/*
	The Users table. 
		ID
        Name
        Cellphone
        Referred by : Unique foreign key to another user ( can be null )
        Credit : Should be positive
*/
create table users
(
	-- Attributes
	id char(5),
    name varchar(20) not null,
    cellphone char(11),
    referred_by char(5) default null,
    credit Toman check (credit >= 0),
    -- 
    primary key (ID),
    foreign key (referred_by) references users(id)
		on delete set null
)

/*
	The Drivers table. 
		ID
        Name
        Cellphone
        Address
        Is active : 0 means deactive and 1 means active 
        Score
*/
create table driver
(
	-- Attributes
	id char(5),
    name varchar(20) not null,
    cellphone char(11),
    address varchar(50),
    is_active int check (is_active in (0,1)),
    score int,
    --
	primary key (id)
)

/*
	Table of users Orders.
		ID
        User ID : foreign key in users
        Driver ID : foreign key in drivers can be null
        Estimated value
        Price
        Is round trip : 0 is false and 1 is true
        Start time
        Finish time
        Score : should be between 1 to 5
*/
create table orders
(
	-- Attributes
	id char(5),
    user_id char(5) not null,
    driver_id char(5) default null,
    estimated_value Toman,
    price Toman,
    is_round_trip int check (is_round_trip in (0,1)),
    start_time timestamp DEFAULT 0,
    finish_time timestamp DEFAULT 0,
    score int check (score > 0 and score < 6),
    --
    primary key (id),
    foreign key (user_id) references users(id)
		on delete cascade,
    foreign key (driver_id) references driver(id)
		on delete set null
)

/*
	The users Payment account table.
		ID
        User ID : foreign key in user
        Amount : should be a '500k' ( k is natrual number )
        Bank : should be in [saderat, saman, sina, melli]
        Time
*/
create table payment
(
	-- Attributes
	id char(5),
    user_id char(5) not null,
    amount Toman check (amount % 500 = 0),
    bank varchar(10) check (bank in ('melli', 'sina', 'saman', 'saderat')),
    time timestamp,
    --
    foreign key (user_id) references users(id)
		on delete cascade    
)


-- Create data Queries
/*
	Adding some templates into the tables.
    Users
    Drivers
    Orders
    Payment
*/

-- Users
insert into users (id, name, cellphone, credit)
	values ("00001", "usr1", "09155232106", 200);
insert into users (id, name, cellphone, credit)
	values ("00002", "usr2", "09155232107", 200);
insert into users (id, name, cellphone, referred_by, credit)
	values ("00003", "usr3", "09155232108", "00001", 100);
insert into users (id, name, cellphone, referred_by, credit)
	values ("00004", "usr4", "09155232109", "00001", 100);
insert into users (id, name, cellphone, referred_by, credit)
	values ("00005", "usr5", "09155232110", "00002", 100);
insert into users (id, name, cellphone, credit) 
	values ("00010", "froy", "09155232112", 200) ;
    
-- Drivers
insert into driver (id, name, cellphone, address, is_active, score)
	values ("11000", "drv1", "09124720914", "13th Shariati Tehran", 1, 0);
insert into driver (id, name, cellphone, address, is_active, score)
	values ("11001", "drv2", "09124720915", "14th Shariati Tehran", 1, 0);
insert into driver (id, name, cellphone, address, is_active, score)
	values ("11002", "drv3", "09124720916", "15th Shariati Tehran", 1, 0);
insert into driver (id, name, cellphone, address, is_active, score)
	values ("11003", "drv4", "09124720917", "15th Shariati Tehran", 1, 0);
insert into driver (id, name, cellphone, address, is_active, score) 
	values ("11010", "froy", "09155232112", "21st Shariati Tehran", 1, 0); 
insert into driver (id, name, cellphone, address, is_active, score) 
	values ("11020", "friend", "09155232109", "21st Shariati Tehran", 1, 0); 
    
-- Orders
insert into orders (id, user_id, estimated_value, price, start_time)
		values ("22000", "00001", 1500, 10, '2021-3-12 09:00:30.75');
insert into orders (id, user_id, estimated_value, price, start_time)
		values ("22001", "00001", 1000, 8, '2021-3-13 09:00:30.75');
insert into orders (id, user_id, estimated_value, price, start_time)
		values ("22002", "00002", 15000, 100, '2021-3-12 19:00:30.75');
insert into orders (id, user_id, estimated_value, price, start_time)
		values ("22003", "00003", 2000, 16, '2021-3-11 02:30:30.75');
insert into orders (id, user_id, driver_id, estimated_value, price, start_time, finish_time, score)
        values ("22004", "00004", "11000", 1500, 10, '2021-3-12 09:00:30.75', '2021-3-13 10:00:30.75', 4);
insert into orders (id, user_id, driver_id, estimated_value, price, start_time, finish_time, score)
        values ("22005", "00001", "11001", 15000, 30, '2021-3-12 09:00:30.75', '2021-3-13 09:00:30.75', 5);
insert into orders (id, user_id, driver_id, estimated_value, price, start_time, finish_time, score)
        values ("22006", "00005", "11002", 1000, 10, '2021-3-12 09:00:30.75', '2021-3-13 09:00:30.75', 2);
insert into orders (id, user_id, driver_id, estimated_value, price, start_time, finish_time, score)
        values ("22007", "00004", "11000", 12000, 100, '2021-3-12 09:00:30.75', '2021-3-15 09:00:30.75', 3);
insert into orders (id, user_id, driver_id, estimated_value, price, start_time, finish_time, score)
        values ("22008", "00003", "11000", 1500, 10, '2021-3-12 09:00:30.75', '2021-3-13 10:00:30.75', 4);
insert into orders (id, user_id, driver_id, estimated_value, price, start_time, finish_time, score)
        values ("22009", "00001", "11001", 1500, 10, '2021-3-12 09:00:30.75', '2021-3-13 09:00:30.75', 5);
insert into orders (id, user_id, driver_id, estimated_value, price, start_time, finish_time, score)
        values ("22010", "00005", "11002", 2500, 15, '2021-3-12 09:00:30.75', '2021-3-18 09:00:30.75', 2);
insert into orders (id, user_id, driver_id, estimated_value, price, start_time, finish_time, score)
        values ("22011", "00002", "11020", 1500, 10, '2021-3-12 09:00:30.75', '2021-3-12 12:00:30.75', 3);
        
-- Payment 
insert into payment (id, user_id, amount, bank, time)
	values ("55000", "00001", 500, "saman", '2021-3-10 12:30:30.75');
insert into payment
	values ("55001", "00002", 500, "melli", '2021-3-2 02:30:30.75');
insert into payment
	values ("55002", "00003", 500, "sina", '2021-3-5 02:50:47.75');
insert into payment
	values ("55003", "00004", 500, "saman", '2021-3-11 07:00:30.75');
insert into payment
	values ("55004", "00005", 500, "saderat", '2021-3-12 02:30:30.75');
	
	
-- Homework Queries 

-- A success
update users
	set name = "farbod" 
    where id = "00001";

-- B success
select name
from users
where users.id not in (  select user_id
						from orders    );

-- C success
delete from users
where users.id not in (  select user_id
						from orders    );

-- D success
select id
from users
where name = "farbod";	

-- E success
select *
from users
where users.cellphone in (   select cellphone
							from driver      );

-- F success
create view no_driver_order as 
    select *
    from orders
    where driver_id is null
	
create view part_f as
    SELECT user_id, count(user_id) as total
    from no_driver_order
    GROUP BY (user_id)
    HAVING COUNT(user_id) > 1

SELECT name
from users NATURAL JOIN part_f
WHERE id = user_id	

-- G success
select *
from orders
where datediff(finish_time, start_time) = 1

-- H success
SELECT user_id, driver_id, COUNT(id) as total 
FROM orders
GROUP BY user_id, driver_id
HAVING driver_id is not null and total > 1

-- I success 
select AVG(diff)
from 
( 	select id, ( datediff(finish_time, start_time) ) as diff
	from orders
	where score > 3 ) as T
	
-- J success
SELECT user_id, avg(score) as avg_score
FROM orders
GROUP BY user_id
ORDER BY avg_score DESC
LIMIT 5

-- K success
SELECT driver_id, sum(price) as total
FROM orders
WHERE datediff(NOW(), finish_time) < 7
GROUP BY driver_id
ORDER BY total DESC
LIMIT 1

-- L success
CREATE VIEW sina_users as
    SELECT DISTINCT user_id 
    FROM payment
    WHERE bank = "sina"
	
SELECT avg(score)
FROM orders
WHERE user_id in (select *
                  from sina_users)
				  
-- M success 
CREATE VIEW update_users AS
SELECT id as us_id, name as us_name, cellphone, referred_by, credit
from users

SELECT sum(estimated_value) as total
from orders NATURAL JOIN update_users
WHERE user_id = us_id and referred_by = (SELE
