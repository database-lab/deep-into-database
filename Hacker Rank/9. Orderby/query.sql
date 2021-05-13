/*
Enter your query here.
*/
select CITY, LENGTH(CITY)
from STATION
order by LENGTH(CITY), CITY asc
limit 1;

select T.CITY, LENGTH(T.CITY)
from ( select * 
       from STATION
       order by CITY desc ) as T
order by LENGTH(T.CITY) desc
limit 1;