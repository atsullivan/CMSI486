-- 1) What did Froning score on Fran?
		AND a2.workout_name = 'Fran';
		AND a_name = 'Smith';
		AND c.comp_region = 'Central East';
	FROM Athlete AS a
		, Participation AS p
		, Competition AS c
		, Accomplishment AS accomp
	WHERE a.a_ID = p.a_ID
		AND c.comp_name = p.comp_name
		AND accomp.a_ID = a.a_ID
		AND c.comp_name = '2014 CrossFit Games'
		AND accomp.workout_name = 'Fran';