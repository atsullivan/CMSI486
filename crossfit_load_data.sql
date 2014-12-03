-- 
-- TABLE: Accomplishment 
--

CREATE TABLE IF NOT EXISTS Accomplishment(
    a_ID            INT         NOT NULL,
    comp_name       VARCHAR(24)    NOT NULL,
    workout_name    VARCHAR(16)    NOT NULL,
    a_score         INT,
    PRIMARY KEY (a_ID, comp_name, workout_name)
)ENGINE=INNODB
;



INSERT INTO Accomplishment (a_ID, comp_name, workout_name, a_score) VALUES
('1', '2014 CrossFit Games', 'Fran', '2:25'),
('2', '2014 CrossFit Games', 'Fran', '2:13'),
('3', '2014 CrossFit Games', 'Fran', '2:17'),
('4', '2014 CrossFit Games', 'Fran', '2:35'),
('5', '2014 CrossFit Games', 'Fran', '2:24'),
('6', '2014 CrossFit Games', 'Fran', '2:35'),
('5', '2014 Regionals', 'Fran', '2:35');

-- 
-- TABLE: Athlete 
--

CREATE TABLE IF NOT EXISTS Athlete(
    a_ID         INT         NOT NULL,
    a_gender     VARCHAR(10),
    a_height     INT,
    a_weight     INT,
    a_region     VARCHAR(16),
    affiliate    VARCHAR(24),
    a_email      VARCHAR(24),
    app_date     DATE,
    dob          DATE,
    a_name       VARCHAR(24),
    PRIMARY KEY (a_ID)
)ENGINE=INNODB
;

INSERT INTO Athlete (a_ID, a_gender, a_height, a_weight, a_region, affiliate, a_email, app_date, dob, a_name) VALUES
('1', 'm', '180', '190', 'Mid Atlantic', 'CrossFit Krypton', 'bsmith@gmail.com',	'2010/1/12', '1990/1/1', 'Smith'),
('2', 'm', '175', '195', 'Central East', 'CrossFit Mayhem', 'rfroning@gmail.com', '2009/1/2', '1987/1/1', 'Froning'),
('3', 'm', '170', '180', 'So Cal', 'none', 'dbailey@gmail.com',	'2008/2/24', '1984/1/1', 'Bailey'),
('4', 'f', '167', '137', 'Europe', 'CrossFit Black Five', 'sbriggs@gmail.com', '2009/5/17', '1982/1/1', 'Briggs'),
('5', 'f', '162', '135', 'Central East', 'CrossFit Ann Arbor',	'sfoucher@gmail.com', '2010/3/23', '1989/1/1', 'Foucher'),
('6', 'f', '160', '115', 'Mid Atlantic', 'CrossFit Invoke', 'cabbott@gmail.com', '2008/9/9',	'1982/1/1',	'Abbott');

-- 
-- TABLE: Benchmark 
--

CREATE TABLE IF NOT EXISTS Benchmark(
    a_ID       INT         NOT NULL,
    b_name     VARCHAR(16)    NOT NULL,
    units      VARCHAR(10),
    type       VARCHAR(10),
    b_score    INT,
    PRIMARY KEY (a_ID, b_name)
)ENGINE=INNODB
;

INSERT INTO Benchmark (a_ID, b_name, units, type, b_score) VALUES
('1', 'Fran', 'seconds', 'time', '2:25'),
('2', 'Fran', 'seconds', 'time', '2:13'),
('3', 'Fran', 'seconds', 'time', '2:17'),
('4', 'Fran', 'seconds', 'time', '2:35'),
('5', 'Fran', 'seconds', 'time', '2:24'),
('6', 'Fran', 'seconds', 'time', '2:35');

-- 
-- TABLE: Competition 
--

CREATE TABLE IF NOT EXISTS Competition(
    comp_name      VARCHAR(24)    NOT NULL,
    comp_type      VARCHAR(10),
    comp_score     INT,
    comp_region    VARCHAR(16),
    PRIMARY KEY (comp_name)
)ENGINE=INNODB
;

INSERT INTO Competition (comp_name, comp_type, comp_score, comp_region) VALUES
('2014 CrossFit Games', 'Games', '5', 'Global'),
('2014 Regionals', 'Regionals', '5', 'Central East'),
('2014 Open', 'Open', '5', 'So Cal');


-- 
-- TABLE: Feat 
--

CREATE TABLE IF NOT EXISTS Feat(
    type     VARCHAR(10),
    units    VARCHAR(10)
)ENGINE=INNODB
;

INSERT INTO Feat (type, units) VALUES
('time', 'seconds'),
('weight', 'lbs'),
('reps', 'reps'),
('total', 'points');

-- 
-- TABLE: Participation 
--

CREATE TABLE IF NOT EXISTS Participation(
    a_ID         INT         NOT NULL,
    comp_name    VARCHAR(24)    NOT NULL
)ENGINE=INNODB
;

INSERT INTO Participation( a_ID, comp_name) VALUES
('1', '2014 CrossFit Games'),
('2', '2014 CrossFit Games'),
('3', '2014 CrossFit Games'),
('4', '2014 CrossFit Games'),
('5', '2014 CrossFit Games'),
('5', '2014 Regionals'),
('6', '2014 CrossFit Games');




-- 
-- INDEX: Ref97 
--

CREATE INDEX Ref97 ON Accomplishment(a_ID, comp_name)
;
-- 
-- INDEX: Ref18 
--

CREATE INDEX Ref18 ON Benchmark(a_ID)
;
-- 
-- INDEX: Ref15 
--

CREATE INDEX Ref15 ON Participation(a_ID)
;
-- 
-- INDEX: Ref26 
--

CREATE INDEX Ref26 ON Participation(comp_name)
;


CREATE VIEW userview AS
    SELECT a.a_ID, a.a_gender, a.a_height, a.a_weight, a.a_region, a.affiliate, a.dob, a.a_name, c.comp_name, c.comp_type, c.comp_score, c.comp_region, accomp.workout_name, accomp.a_score, b.b_name, b.units, b.type, b.b_score
    FROM Athlete AS a,
    	Competition AS c,
    	Accomplishment AS accomp,
    	Benchmark AS b,
    	Participation AS p
    WHERE a.a_ID = p.a_ID
    	AND p.comp_name = c.comp_name
    	AND accomp.a_ID = p.a_ID
    	AND a.a_ID = b.a_ID
;

