-- 1) What did Froning score on Fran?	SELECT a2.a_score	FROM Athlete AS a		, Accomplishment AS a2	WHERE a.a_ID = a2.a_ID		AND a.a_name = 'Froning'
		AND a2.workout_name = 'Fran';-- 2) What is Smith's best score on the benchmark workout Fran?	SELECT b_score	FROM Benchmark		, Athlete	WHERE Athlete.a_ID = Benchmark.a_ID		AND b_name = 'Fran'
		AND a_name = 'Smith';-- 3) How many competitions has Bailey participated in?	SELECT COUNT(p.comp_name)	FROM Participation AS p		, Athlete AS a
		, Competition AS c	WHERE a.a_ID = p.a_ID
		AND c.comp_name = p.comp_name
		AND c.comp_region = c.comp_region		AND a_name = 'Bailey';-- 4) How many completed benchmarks does Foucher have?	SELECT COUNT(b_name)	FROM Benchmark AS b		, Athlete AS a	WHERE a.a_ID = b.a_ID		AND a_name = 'Foucher';-- 5) What athletes competed in the 2014 CrossFit Games?	SELECT Athlete.a_name	FROM Athlete		, Participation	WHERE Athlete.a_ID = Participation.a_ID		AND Participation.comp_name = '2014 CrossFit Games';-- 6) What did Foucher score at the 2014 Regionals in the Central East?	SELECT c.comp_score	FROM Athlete AS a		, Participation AS p		, Competition AS c	WHERE a.a_ID = p.a_ID		AND c.comp_name = p.comp_name		AND c.comp_region = 'Central East'		AND c.comp_name = '2014 Regionals'		AND a.a_name = 'Foucher';-- 7) Which Athletes competed in The 2014 Central East Regionals?	SELECT a_name	FROM Athlete AS a		, Participation AS p		, Competition AS c	WHERE a.a_ID = p.a_ID		AND c.comp_name = p.comp_name		AND c.comp_name = '2014 Regionals'
		AND c.comp_region = 'Central East';-- 8) What is the best score for Fran during the 2014 CrossFit Games?	SELECT MIN(a_score)
	FROM Athlete AS a
		, Participation AS p
		, Competition AS c
		, Accomplishment AS accomp
	WHERE a.a_ID = p.a_ID
		AND c.comp_name = p.comp_name
		AND accomp.a_ID = a.a_ID
		AND c.comp_name = '2014 CrossFit Games'
		AND accomp.workout_name = 'Fran';-- 9) Which athletes compete in the Central East Region?SELECT a_name	FROM AthleteWHERE a_region = 'Central East';-- 10) Which athletes are affiliated with CrossFit Mayhem?SELECT a_name	FROM AthleteWHERE affiliate = 'CrossFit Mayhem';