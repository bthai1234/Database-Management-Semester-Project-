-- 1. List the names of all the unique clients
SELECT first_name, last_name 
from person INNER JOIN business_client
WHERE person.ID = business_client.ID;

-- 2. Find the unique names of owners and total square footage of all the properties they own.
WITH sq_ft_by_owner_id(owner_id, total_area_sq_ft) AS
(SELECT owner_id, SUM(area_sq_ft)
FROM rental_property
GROUP BY owner_id)

SELECT first_name, last_name, owner_id, total_area_sq_ft
from person INNER JOIN sq_ft_by_owner_id
WHERE person.ID = sq_ft_by_owner_id.owner_id;

-- 3. Find the properties shown by each associate in a given month.
-- @given_month parameter would be the value obtained from user input
SET @given_month = 3;
SELECT associate_id, (SELECT CONCAT(first_name, " ", last_name) FROM person WHERE person.ID = property_viewing.associate_id) AS name, property_num, viewing_date
FROM property_viewing
WHERE MONTH(viewing_date) = @given_month
ORDER BY associate_id;

-- 4. Find the most popular properties (in terms of number of viewings in a given year). 
 -- @given_year parameter would be the value obtained from user input
SET @given_year = 2020;
SELECT property_num, COUNT(property_num) as num_of_viewings
FROM property_viewing
WHERE YEAR(viewing_date) = @given_year
GROUP BY property_num
ORDER BY num_of_viewings DESC;

-- 5. Find the total rent due to each property owner
SELECT owner_id, (SELECT CONCAT(first_name, " ", last_name) FROM person WHERE person.ID = rental_property.owner_id) AS owner_name, SUM(lease.monthly_rent) AS total_rent_owed
FROM lease INNER JOIN rental_property
WHERE rental_property.property_num = lease.property_num
GROUP BY owner_id;
 
 -- 6. Find the unique names of associates supervised (directly or indirectly) by a given employee.
 -- @given_employee parameter would be the value obtained from user input
 -- #Finds associates directly supervised by a given employee
SET @employee_ID = 1;
WITH associate_list(ID, first_name, last_name, manager_id) AS
(
SELECT associate.ID, first_name, last_name, manager_id
FROM associate INNER JOIN employee INNER JOIN person 
WHERE associate.ID = employee.ID AND associate.ID = person.ID  
)
SELECT ID, first_name, last_name
FROM associate_list
WHERE manager_id = @employee_ID;
 
-- 7. Find the unique names of owners that have a residential property in every city where Pat Doe owns a commercial property
WITH pat_doe_id(ID) AS
(
SELECT ID FROM person WHERE person.first_name = 'Pat' AND person.last_name =  'Doe'
),
citys_with_pat_doe(owner_id ,city) AS
(
SELECT owner_id, city
FROM commercial INNER JOIN rental_property
WHERE rental_property.owner_id IN (SELECT ID FROM pat_doe_id)
),
owners_in_same_city(id) AS
(SELECT owner_id
FROM residential INNER JOIN rental_property
WHERE residential.property_num = rental_property.property_num AND city IN (SELECT distinct(city) FROM citys_with_pat_doe)
GROUP BY rental_property.owner_id
HAVING COUNT(DISTINCT city) = (SELECT COUNT(distinct(city)) AS num_city FROM citys_with_pat_doe))

SELECT first_name, last_name
FROM person INNER JOIN owners_in_same_city
WHERE owners_in_same_city.id = person.id;

-- 8. Find the top-3 partners with respect to number of properties leased in the current year.
SELECT partner_id, COUNT(lease_num) AS number_of_leases_this_year 
FROM lease
WHERE YEAR(lease_date) = YEAR(current_date())
GROUP BY partner_id 
ORDER BY number_of_leases_this_year DESC
LIMIT 3;

-- 9. Write a SQL function to compute the total management fees due to Pluto in the last 3 months.
WITH management_fees(property_num, management_fee, start_date, end_date) AS
(SELECT lease.property_num, (lease.monthly_rent*rental_property.management_fee_percentage) AS management_fee, start_date, end_date
FROM lease INNER JOIN rental_property
WHERE lease.property_num = rental_property.property_num)

SELECT SUM(management_fee*3) AS Total_Management_fee_for_past_3_months
FROM management_fees
WHERE current_date() >= management_fees.start_date AND
	  current_date() <= management_fees.end_date;
      
-- 10. Creates a SQL trigger to automatically set to FALSE the advertisement flag of a property when it is leased.
-- Trigger is implemented in the createAll.sql file.


