
SELECT	did, dname , sum(Project.budget)
FROM	Department NATURAL JOIN Project
WHERE	duedate > CURRENT_DATE

Group 	by did 