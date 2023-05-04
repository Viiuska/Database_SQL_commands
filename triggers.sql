--Triggers first and last

CREATE OR REPLACE FUNCTION check_skills()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM skills WHERE skill=NEW.skill) THEN
        RAISE EXCEPTION 'This skill already exists.';
    END if;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_skills
BEFORE INSERT ON skills
FOR EACH ROW
EXECUTE FUNCTION check_skills();

--Testing the trigger
INSERT INTO skills (s_id, skill, salary_benefit, salary_benefit_value)
VALUES (37, 'SQL', 'false', 0);


CREATE OR REPLACE FUNCTION update_contract()
RETURNS TRIGGER AS $$
BEGIN
	IF NEW.contract_type = 'Temporary' THEN
		NEW.contract_start = NOW();
		NEW.contract_end = NEW.contract_end+ INTERVAL '2 years';
	ELSE 
		NEW.contract_start = NOW();
		NEW.contract_end = NULL;
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_contarct_trigger
BEFORE UPDATE ON employee
FOR EACH ROW
WHEN (OLD.contract_type != NEW.contract_type)
EXECUTE FUNCTION update_contract();


--Testing the trigger
UPDATE employee
SET contract_type = 'Part-time'
WHERE e_id = 2;
