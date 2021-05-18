CREATE TABLE salary_changes (
    employee_id INT,
    changed_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    old_salary DECIMAL(8 , 2 ),
    new_salary DECIMAL(8 , 2 ),
    PRIMARY KEY (employee_id , changed_at)
);