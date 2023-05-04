--First view
CREATE VIEW customer_project_info AS 
SELECT customer.c_name, customer.c_id, 
    project.project_name, project.p_id, geo_location.country, project.p_start_date, project.p_end_date
FROM customer INNER JOIN project ON customer.c_id = project.p_id
	INNER JOIN geo_location ON project.p_id = geo_location.l_id;


--Second view
CREATE VIEW employee_role_rights AS 
SELECT employee.e_id, employee.emp_name, skills.skill, user_group.group_title, user_group.u_id,
    user_group.group_rights
FROM employee INNER JOIN user_group ON employee.e_id = user_group.u_id
	INNER JOIN skills ON employee.e_id= skills.s_id;


--Third view
CREATE VIEW employee_skills_title AS 
SELECT employee.e_id, employee.emp_name, 
    skills.s_id, skills.skill, job_title.j_id, job_title.title
FROM employee INNER JOIN skills ON employee.e_id = skills.s_id
    INNER JOIN job_title ON employee.e_id =job_title.j_id;



--Forth view
CREATE VIEW employee_project_info AS
SELECT employee.e_id, employee.emp_name, customer.c_name, customer.c_id,
    project.p_id, project.project_name, project.p_start_date, project.p_end_date
FROM employee INNER JOIN project ON employee.e_id = project.p_id
	INNER JOIN customer ON project.p_id= customer.c_id; 

    