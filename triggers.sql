--Triggers

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




