SET sql_mode='ANSI_QUOTES';

create table user
(
	id char(5),
    name varchar(20) not null,
    cellphone char(11),
    referred_by char(5) unique,
    credit int,
    primary key (ID)
);

create table driver
(
	id char(5),
    name varchar(20) not null,
    cellphone char(11),
    address varchar(50),
    is_active int,
    score int,
    check (is_active in (0,1)),
    primary key (id)
);

create table orders
(
	id char(5),
    user_id char(5),
    driver_id char(5) default null,
    estimated_value int,
    price int,
    is_round_trip int,
    start_time date,
    finish_time date,
    score int,
    check (is_round_trip in (0,1)),
    check (score > 0 and score < 6),
    primary key (id),
    foreign key (user_id) references user(id),
    foreign key (driver_id) references driver(id)
);