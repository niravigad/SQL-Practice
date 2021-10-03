
WITH	in_progect (eid,salary2) AS (
		SELECT	DISTINCT Employee.eid, Employee.salary as salary2
		FROM	Employee, Onproject
		WHERE	Employee.eid IN (	
			SELECT Onproject.eid
			FROM Onproject		
			)
	),
	no_progect(eid,salary3) AS (
		SELECT	DISTINCT Employee.eid, Employee.salary as salary3
		FROM	Employee, Onproject
		WHERE	Employee.eid NOT IN (	
			SELECT Onproject.eid
			FROM Onproject		
			)
	)

SELECT	AVG(salary2)-AVG(salary3) AS Salary_difference
FROM	in_progect,no_progect

