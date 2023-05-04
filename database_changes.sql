--Database changes
ALTER TABLE geo_location ADD COLUMN zip_code text;

ALTER TABLE customer ALTER COLUMN email SET NOT NULL;
ALTER TABLE project ALTER COLUMN p_start_date SET NOT NULL;

UPDATE employee SET salary = 1500 WHERE salary <= 1000;
ALTER TABLE employee ADD CONSTRAINT check_salary CHECK (salary > 1000);

