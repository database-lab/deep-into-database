select round( 1.0 * sum(attendance) / count(*), 2) AS birthday_attendance
from attendance a JOIN students s ON a.student_id = s.student_id 
and extract(MONTH FROM school_date) = extract(MONTH FROM date_of_birth)
and extract(DAY FROM school_date) = extract(DAY FROM date_of_birth)
where attendance = 1;
