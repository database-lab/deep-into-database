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
    check (is_active in (0,1))
);