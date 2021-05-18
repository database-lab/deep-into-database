CREATE TABLE salary_changes (
    employee_id INT,
    changed_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    old_salary DECIMAL(8 , 2 ),
    new_salary DECIMAL(8 , 2 ),
    PRIMARY KEY (employee_id , changed_at)
);

CREATE TRIGGER before_update_salary
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
   IF NEW.salary <> OLD.salary THEN
	INSERT INTO salary_changes(employee_id,old_salary,new_salary)
        VALUES(NEW.employee_id,OLD.salary,NEW.salary);
    END IF;
END;

SELECT 
    employee_id, 
    first_name, 
    last_name, 
    salary
FROM
    employees
WHERE
    employee_id = 110;

UPDATE employees 
SET 
    salary = salary * 1.05
WHERE
    employee_id = 110;
	
SELECT 
    *
FROM
    salary_changes;