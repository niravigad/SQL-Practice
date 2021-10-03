Find details of inspectors who have been working as inspectors for at least 5 years

select *
from inspector
where (current_date-sdate)/365>=5;

Find cases where the restaurant manager lives in the city where the restaurant is located, but at a different address
In the city. Introduce the name of the restaurant and the name of the manager.


select rname, mname
from restaurant, manager
where restaurant.mid=manager.mid and restaurant.city=manager.city and
restaurant.address<>manager.address;

For each restaurant, find the number of tests done for it last year) if the current year
Is 2021, last year is 2020.) Introduce the name of the restaurant and the number of tests.
If the restaurant was not tested last year, it will not appear in the result.
The query must be correct for each date


Select rname, count(*)
From restaurant, inspection
Where restaurant.lno=inspection.lno and date_part('year',idate)=date_part('year',current_date)-
1
Group by rname, restaurant.lno

Find restaurant managers who live in Carmiel but in Carmiel there is no restaurant that they manage
its. View the manager's name and phone number.


Select mname, mobile
From manager
Where city='karmiel' and mid not in
(select mid
From restaurant
Where city='karmiel')


For each of the months of 2021, find the inspectors who performed the highest number of tests
most.
If in a particular month no sanitary tests have been done, it will not appear in the result


With tmp(tmonth,tiid,tcount) as
(Select date_part('month',idate), iid, count(*)
From inspection
Where date_part('year',idate)=2021
Group by date_part('month',idate), iid)
Select tmonth, tiid
From tmp
Where tcount>=all
(select tcount
From tmp as tmp1
Where tmp.tmonth=tmp1.tmonth)


Find inspectors who performed a sanitary inspection of each of the restaurants in the city of Haifa. Introduced the
Name of inspector.


Select iname
From inspector
Where not exists
(select lno
From restaurant
Where city='haifa' and lno not in
(select lno
From inspection
Where inspector.iid=inspection.iid))


Among the inspectors who never inspected a restaurant in the city of Eilat, they found the inspector
Which failed the largest number of tests.
If there are several inspectors who meet the condition, they should all be presented.


Select iid
From inspection
Where passed=0 and iid not in
(select iid
From inspection, restaurant
Where inspection.lno=restaurant.lno and city='eilat')
Group by iid
Having count(*)>=all
(select count(*)
From inspection
Where passed=0 and iid not in
(select iid
From inspection, restaurant
Where inspection.lno=restaurant.lno and city=' eilat')
Group by iid)