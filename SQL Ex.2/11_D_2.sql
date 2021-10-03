
SELECT	Employee.ename,Employee.salary
FROM	Employee NATURAL JOIN Onproject , Project
WHERE	pname = 'Search' AND 
		Employee.did = 1 AND
		Project.pid = Onproject.pid