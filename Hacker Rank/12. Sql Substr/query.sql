/*
Enter your query here.
*/
select Name
from STUDENTS
where Marks > 75
order by RIGHT(Name, 3), ID asc;