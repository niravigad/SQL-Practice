Write the trigger (trigger) that checks by adding a sanitary check that if a failure is found
Sanitary, the value of the description is not empty. If the condition is correct, insertion will be possible. If not, you will
An error message to the user, and this record alone will not be entered into the relationship. The trigger name will be T1 and there
The trigger function () trigf1


create or replace function trigf1() returns trigger as $$
begin
if (new.passed=0 and new.violations is null) then
begin
raise notice 'violations cannot be null if inspection did not pass';
return null;
end;
end if;
return new;
end;
$$language plpgsql;
create trigger t1
before insert on inspection
for each row
execute procedure trigf1();