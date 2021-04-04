/*
	The Users table. 
		ID
        Name
        Cellphone
        Referred by : Unique foreign key to another user ( can be null )
        Credit : Should be positive
*/
create table user
(
	-- Attributes
	id char(5),
    name varchar(20) not null,
    cellphone char(11),
    referred_by char(5) default null,
    credit int,
    -- 
    primary key (ID),
    foreign key (referred_by) references user(id),
    check (credit >= 0)
);

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
    is_active int,
    score int,
    --
	primary key (id),
    check (is_active in (0,1))
);

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
    estimated_value int,
    price int,
    is_round_trip int,
    start_time date,
    finish_time date,
    score int,
    --
    primary key (id),
    foreign key (user_id) references user(id),
    foreign key (driver_id) references driver(id),
	check (is_round_trip in (0,1)),
    check (score > 0 and score < 6)
);

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
    amount int,
    bank varchar(10),
    time date,
    --
    foreign key (user_id) references user(id),
    check (amount % 500 = 0),
    check (bank in ('melli', 'sina', 'saman', 'saderat'))
);