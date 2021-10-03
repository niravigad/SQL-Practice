WITH	low_classification(pid) AS (
		SELECT	DISTINCT Onproject.pid
		FROM	Employee NATURAL JOIN Onproject

		GROUP BY	pid
		HAVING		MAX(Employee.classification) <=3 
)

	
SELECT	Project.pname,Project.budget
FROM	Project NATURAL JOIN low_classification,Onproject
WHERE	Onproject.pid = Project.pid
	
GROUP BY	Onproject.pid , Project.pname, Project.budget
HAVING		COUNT(Onproject.eid)>= ALL(
					SELECT 		COUNT(Onproject.eid)
					FROM		Onproject
					GROUP BY	pid	
					)	
					