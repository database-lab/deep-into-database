/*
	Adding some templates into the tables.
    Users
    Drivers
    Orders
    Payment
*/

-- Users
insert into user (id, name, cellphone, credit)
	values ("00001", "usr1", "09155232106", 200);
insert into user (id, name, cellphone, credit)
	values ("00002", "usr2", "09155232107", 200);
insert into user (id, name, cellphone, referred_by, credit)
	values ("00003", "usr3", "09155232108", "00001", 100);
insert into user (id, name, cellphone, referred_by, credit)
	values ("00004", "usr4", "09155232109", "00001", 100);
insert into user (id, name, cellphone, referred_by, credit)
	values ("00005", "usr5", "09155232110", "00002", 100);
    
-- Drivers
insert into driver (id, name, cellphone, address, is_active, score)
	values ("11000", "drv1", "09124720914", "13th Shariati Tehran", 1, 0);
insert into driver (id, name, cellphone, address, is_active, score)
	values ("11001", "drv2", "09124720915", "14th Shariati Tehran", 1, 0);
insert into driver (id, name, cellphone, address, is_active, score)
	values ("11002", "drv3", "09124720916", "15th Shariati Tehran", 1, 0);
insert into driver (id, name, cellphone, address, is_active, score)
	values ("11003", "drv4", "09124720917", "15th Shariati Tehran", 1, 0);
    
-- Orders
insert into orders (id, user_id, price, start_time)
		values ("22000", "00001", 1500, '2021-3-12 09:00:30.75');
insert into orders (id, user_id, price, start_time)
		values ("22001", "00001", 1000, '2021-3-13 09:00:30.75');
insert into orders (id, user_id, price, start_time)
		values ("22002", "00002", 15000, '2021-3-12 19:00:30.75');
insert into orders (id, user_id, price, start_time)
		values ("22003", "00003", 2000, '2021-3-11 02:30:30.75');
        
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