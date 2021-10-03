Status monitoring system Sanitary of restaurants:

inspector (iid, iname, bdate, sdate, mobile)
restaurant (lno, rname, address, city, phone, odate, mid)
manager (mid, mname, address, city, mobile, email)
inspection (lno, idate, iid, stime, passed, violations) 

The inspector ratio contains information on sanitary inspectors. The monitor has an ID number (iid, (name (iname,))
Date of birth (bdate, (date of commencement of work (sdate,) and mobile phone number (mobile.)

The restaurant ratio contains information about restaurants. The restaurant has a license number (lno, (name (rname,))
Including street and house number (address, city), phone number (opening date of the restaurant)
(odate, (and identifies the manager of the restaurant (mid.) There is no restaurant without a manager.

The manager ratio contains information about restaurant managers. Restaurant manager has an ID (mid, (name (mname,))
Residential address including street and house number (address (city), mobile phone number and
Email (email.) A restaurant manager who is not a restaurant manager is not possible.

The inspection ratio contains information on sanitary inspections for restaurants. The restaurant ID is kept for inspection
(lno, (date of test) (idate, (inspector) (iid, (start time of test) (stime,
The test passed or failed (the possible values ​​for this feature are 1 if the test passed 1 and
 0 If a sanitary failure is found. In addition a description is kept of the sanitary failures found, if any
 (violations)
