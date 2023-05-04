-- Procedures
CREATE OR REPLACE PROCEDURE base_level_salary()
LANGUAGE plpgsql
AS $$
DECLARE salary_info record;
BEGIN
	FOR salary_info IN SELECT j_id, base_salary FROM job_title LOOP
		UPDATE employee 
		SET salary = salary_info.base_salary
		WHERE j_id = salary_info.j_id;
	END LOOP;
END; 
$$;

CALL base_level_salary();



CREATE OR REPLACE PROCEDURE extend_contract()
LANGUAGE plpgsql
AS $$
BEGIN
	UPDATE employee SET contract_end = contract_end + INTERVAL '3 months'
	WHERE contract_type = 'Temporary' AND contract_end > NOW();
END; 
$$;

CALL extend_contract();

CREATE OR REPLACE PROCEDURE increase_salary(percentage DECIMAL, salary_limit INTEGER DEFAULT NULL)
LANGUAGE plpgsql
AS $$
BEGIN
	IF salary_limit IS NULL THEN
		UPDATE employee SET salary = salary * (1 + percentage);
	ELSE
		UPDATE employee SET salary = salary * (1 + percentage)
		WHERE salary < salary_limit;
	END IF;
END; 
$$;

CALL increase_salary(0.1); --increases all salaries 10%
CALL increase_salary(0.05, 4000); -- increases salaries below 4000 by 5%
