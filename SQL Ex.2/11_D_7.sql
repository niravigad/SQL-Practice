
WITH	Employee1(eid) AS (
	SELECT	DISTINCT Employee.eid
	FROM	Employee NATURAL JOIN Onproject		
	)

SELECT	E1.eid,E2.eid
FROM	Employee1 AS E1,Employee1 AS E2
WHERE	E1.eid < E2.eid 
	AND
	E1.eid NOT IN(
		SELECT 	eid 
		FROM	Onproject
		WHERE	pid NOT IN (
			SELECT	pid
			FROM	Onproject
			WHERE	eid=E2.eid
			)
		)
	AND
	E2.eid NOT IN(
		SELECT 	eid 
		FROM	Onproject
		WHERE	pid NOT IN (
			SELECT	pid
			FROM	Onproject
			WHERE	eid=E1.eid
			)
		)