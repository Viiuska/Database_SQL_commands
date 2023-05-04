--First partition:employee_partition
CREATE TABLE employee_partition
(
    e_id integer NOT NULL,
    emp_name character varying,
    email character varying,
    contract_type character varying,
    contract_start date NOT NULL,
    contract_end date,
    salary integer DEFAULT 0,
    supervisor integer,
    d_id integer,
    j_id integer
)PARTITION BY RANGE (contract_start);

CREATE TABLE employee_p1 PARTITION OF employee_partition
	FOR VALUES FROM ('2000-01-01') TO ('2010-01-01');

CREATE TABLE employee_p2 PARTITION OF employee_partition 
	FOR VALUES FROM ('2010-01-01') TO ('2020-01-01' );

CREATE TABLE employee_p3 PARTITION OF employee_partition 
	FOR VALUES FROM ('2020-01-01') TO ('2030-01-01');

INSERT INTO employee_partition SELECT * FROM employee;


--Second partition:project_partition
CREATE TABLE project_partition
(
    p_id integer NOT NULL,
    project_name character varying,
    budget numeric,
    commission_percentage numeric,
    p_start_date date NOT NULL,
    p_end_date date,
    c_id integer
)PARTITION BY RANGE (budget);

CREATE TABLE project_p1 PARTITION OF project_partition
	FOR VALUES FROM ('0') TO ('100000');

CREATE TABLE project_p2 PARTITION OF project_partition
	FOR VALUES FROM ('100000') TO ('200000');

CREATE TABLE project_p3 PARTITION OF project_partition 
	FOR VALUES FROM ('200000') TO ('500000');

CREATE TABLE project_p4 PARTITION OF project_partition 
	FOR VALUES FROM ('500000') TO ('1000000');

CREATE TABLE project_p5 PARTITION OF project_partition 
	FOR VALUES FROM ('1000000') TO ('5000000');
	
CREATE TABLE project_p6 PARTITION OF project_partition 
	FOR VALUES FROM ('5000000') TO ('10000000');
	
CREATE TABLE project_p7 PARTITION OF project_partition 
	FOR VALUES FROM ('10000000') TO ('20000000');

CREATE TABLE project_p8 PARTITION OF project_partition 
	FOR VALUES FROM ('20000000') TO ('50000000');

CREATE TABLE project_p9 PARTITION OF project_partition 
	FOR VALUES FROM ('50000000') TO ('100000000');

CREATE TABLE project_p10 PARTITION OF project_partition 
	FOR VALUES FROM ('100000000') TO ('1000000000');

INSERT INTO project_partition SELECT * FROM project;