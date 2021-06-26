The SQL code for creating, deleting, and initial population of the database tables are in separate files named createAll, loadAll, and dropAll. 
queryAll.sql and functional Requierments Interface.ipynb has querys that satisfy fuctional requirments.
User Guide.ipynb has detailed explanations and examples of insert, delete, and updating all tables in the database.
There was no usage of transactions for the inital creation of the database so the transactions.sql file is empty

There are a few things to note for the following database tables: 
“lease” table:
	Date values in the “lease” the table should be formatted as ‘yyyy-mm-d’
	Duration_in_months column is auto calculated based on the inserted start and end dates values and the duration is calculated in months. therefore when inserting an entry there is no need to specify a value for the Duration_in_months column in the parameter list of the insert statement.
	There is a check constraint that the duration is at least 3 months and at most 36 months long.
	The “lease” property_num and client_id values is set to delete cascade and a “lease” entry will be deleted if a corresponding property or client is deleted.

“property_viewing” table:
	The “property_viewing” client_id and property_num values is set to delete cascade and a “property_viewing” entry will be deleted if a corresponding property or client is deleted.


“Rental_property” table:
	There is a trigger named max_assigned_properties that prevents more than 12 properties to be assigned to an associate as that is the requirements of the project.
	The “property” owner_id value is set to delete cascade and the property entry will be deleted if a corresponding property owner is deleted

“Employee”, “Associate”, “partner”  table
	The “lease” and “property_owner” table has foreign key references to the “partner” table and will send an error if you try to delete a partner employee without first removing or redirecting the foriegn reference in “lease” and “property_owner”. The “property_owner” table also has a foriegn key ref. from the “rental_property” table so take note of that if trying to clear out a property_owner reference to a partner employee.
	The “rental_property” table also references the associate table however it will set the manager_id value to null if an associate employee is deleted instead of throwing an error.
	The “property_viewing table” references the associate table and will send an error if trying to delete an associate if the corresponding property_view entry isn’t redirected or removed.
	Employees manager_id references another employee and may need to redirect other employees manager_id foreign constraints. if trying to delete an employee

“business_client” table:
	The “lease” and “property_viewing” table is set to Delete cascade if a corresponding business_client is deleted. 


Phone and email tables
	Phone and email are set to delete cascade and will be removed if a person entry is removed.


Due to the layered foreign reference keys inserting can be a little tedious for some tables like “associate” and “partners”. So the createAll file also has some stored procedures, That makes it easier to insert a partner, associate, client, and property_owner entries, as well as industrial, commercial, and residential property entries.
Below is a short simplified list of the store procedures. more detailed information on them can be found in the Project Report Documentation.
	insert_employee(ID, first_name, last_name, street, city, state, zipcode, unit_num, hire_date, manager_id)
	insert_partner(ID, first_name, last_name, street, city, state, zipcode, unit_num, hire_date, manager_id)
	insert_associate(ID, first_name, last_name, street, city, state, zipcode, unit_num, hire_date, manager_id)
	insert_property_owner(ID, first_name, last_name, street, city, state, zipcode, unit_num, corporation, partner_id)
	insert_business_client(ID, first_name, last_name, street, city, state, zipcode, unit_num, preference, max_rent)
	insert_industrial_property(property_num, owner_id, manager_id, area_sq_ft, street, city, state, zipcode, unit_num, monthly_rent, management_fee_percentage, is_advertised, property_name)
	insert_commercial_property(property_num, owner_id, manager_id, area_sq_ft, street, city, state, zipcode, unit_num, monthly_rent, management_fee_percentage, is_advertised, property_name)
	insert_residential_property(property_num, owner_id, manager_id, area_sq_ft, street, city, state, zipcode, unit_num, monthly_rent, management_fee_percentage, is_advertised, num_of_bedrooms, num_of_restrooms)

More detailed info can be found in the user Guid and project report.