-- First Simple query
SELECT 
    employee_id, 
    first_name, 
    last_name, 
    salary
FROM
    employees
WHERE
    employee_id = 110;

-- Updating Salary where trigger adds to salary_changes	
UPDATE employees 
SET 
    salary = salary * 1.05
WHERE
    employee_id = 110;
	
-- Check that trigger has worked
SELECT 
    *
FROM
    salary_changes;