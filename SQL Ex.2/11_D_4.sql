

SELECT	Department.did , Department.dname
FROM	Department NATURAL JOIN Budget 
WHERE	DATE_PART('year',CURRENT_DATE) - 4 <= byear	

GROUP BY 	did
HAVING sum (Budget.budget)>2500000 