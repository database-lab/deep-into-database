/*
Enter your query here.
*/
select count(CITY) - count(distinct CITY) as RES
from STATION;