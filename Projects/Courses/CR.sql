-- A 
CREATE DATABASE courses

CREATE TABLE GRADES ( 
	id char(3), 
	student_id char(5), 
	course_id char(5), 
	grade int, 
	PRIMARY KEY (id) );

select course_id, AVG(grade) as average
from grades
GROUP BY course_id;	
--

-- B 
CREATE TABLE DB_GRADES ( 
	id char(3), 
	student_id char(5), 
	grade int, 
	PRIMARY KEY (id) );
	
CREATE TABLE OS_GRADES ( 
	id char(3), 
	student_id char(5), 
	grade int, 
	PRIMARY KEY (id) );  

SELECT * 
FROM db_grades 
WHERE grade >= 12 and student_id not in ( SELECT student_id 
										  FROM os_grades 
										  WHERE grade < 12 );
--
										  
-- C 
CREATE TABLE bst( 
	N int, 
	P int,
	PRIMARY KEY (N) ); 	

SELECT N,
CASE 
	WHEN N in (SELECT N FROM bst WHERE P is null) then "ROOT" 
	WHEN N in (SELECT P FROM bst) then "INNER" 
	ELSE "LEAF" 
END AS new_state
FROM bst
--

-- D 
CREATE TABLE table1 ( x int, y int ); 

SELECT T.x, T.y
FROM table1 as T , table1 as S
WHERE T.x = S.y and T.y = S.x
--	
