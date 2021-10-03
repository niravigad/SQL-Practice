
CREATE OR REPLACE FUNCTION trigf1() RETURNS TRIGGER AS $$

BEGIN
	
	IF (NEW.fdate + 30 > 	( 
							SELECT MAX(duedate)
							FROM Project
							WHERE NEW.pid = Project.pid
							)
		)
	THEN
	BEGIN
		 RAISE NOTICE 'Sorry, you cant add a worker to a project that will close for less than a month';
		RETURN NULL;
	END;
	
	END IF;
	
	RETURN NEW;
	
END;
$$LANGUAGE PLpgSQL;


CREATE TRIGGER T1 
BEFORE INSERT OR UPDATE ON Onproject
FOR EACH ROW
EXECUTE PROCEDURE trigf1();