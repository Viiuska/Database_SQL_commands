--Create access rights
CREATE ROLE admin;
CREATE ROLE employee;
CREATE ROLE trainee;

ALTER ROLE admin WITH SUPERUSER;
-- or  GRANT ALL ON DATABASE database TO admin

GRANT SELECT ON ALL TABLES IN SCHEMA public TO employee;

GRANT SELECT ON project, customer, geo_location, project_role TO trainee;
Create VIEW emp_info AS SELECT e_id, emp_name, email FROM employee;
GRANT SELECT ON emp_info TO trainee;




