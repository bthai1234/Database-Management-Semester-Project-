CREATE TABLE person(
	ID INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    street VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    zipcode INT,
    unit_num INT,
    PRIMARY KEY(ID)
);

CREATE TABLE employee(
	ID INT NOT NULL,
    hire_date DATE,
    manager_id INT,
    PRIMARY KEY(ID),
    FOREIGN KEY(ID) REFERENCES person(ID)
		ON UPDATE CASCADE
        ON DELETE CASCADE,
	FOREIGN KEY(manager_id) REFERENCES person(ID)
		ON UPDATE CASCADE
);

CREATE TABLE partner(
	ID INT NOT NULL,
    PRIMARY KEY(ID),
    FOREIGN KEY(ID) REFERENCES employee(ID)
		ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE associate(
	ID INT NOT NULL,
    PRIMARY KEY(ID),
    FOREIGN KEY(ID) REFERENCES employee(ID)
		ON UPDATE CASCADE
        ON DELETE CASCADE
);


CREATE TABLE business_client(
	ID INT NOT NULL,
    preference TEXT,
    max_rent INT,
    PRIMARY KEY(ID),
    FOREIGN KEY(ID) REFERENCES person(ID)
		ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE property_owner(
	ID INT NOT NULL,
    corporation TEXT,
    partner_id INT NOT NULL,
    PRIMARY KEY(ID),
    FOREIGN KEY(ID) REFERENCES person(ID)
		ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY(partner_id) REFERENCES partner(ID)
		ON UPDATE CASCADE
);

CREATE TABLE rental_property(
	property_num INT NOT NULL,
    owner_id INT NOT NULL,
    manager_id INT,
	area_sq_ft INT,
	street VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    zipcode INT,
    unit_num INT,
    monthly_rent DOUBLE,
    management_fee_percentage DOUBLE,
    is_advertised BOOL,
    PRIMARY KEY(property_num),
	FOREIGN KEY(manager_id) REFERENCES associate(ID)
		ON UPDATE CASCADE
        ON DELETE SET NULL,
	FOREIGN KEY(owner_id) REFERENCES property_owner(ID)
		ON UPDATE CASCADE
);

CREATE TABLE industrial(
	property_num INT NOT NULL,
    property_name VARCHAR(50),
    PRIMARY KEY(property_num),
    FOREIGN KEY(property_num) REFERENCES rental_property(property_num)
		ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE commercial(
	property_num INT NOT NULL,
    property_name VARCHAR(50),
    PRIMARY KEY(property_num),
    FOREIGN KEY(property_num) REFERENCES rental_property(property_num)
		ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE residential(
	property_num INT NOT NULL,
    num_of_bedrooms INT,
    num_of_restrooms INT,
    PRIMARY KEY(property_num),
    FOREIGN KEY(property_num) REFERENCES rental_property(property_num)
		ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE lease(
	CONSTRAINT lease_duration_to_long CHECK ((datediff(end_date, start_date)/30) <= 36),
	CONSTRAINT lease_duration_to_short CHECK ((datediff(end_date, start_date)/30) >= 3),
    partner_id INT NOT NULL,
    property_num INT NOT NULL,
    client_id INT NOT NULL,
	lease_num INT NOT NULL,
    lease_date DATE,
    start_date DATE,
    end_date DATE,
    deposit DOUBLE,
	monthly_rent DOUBLE,
    duration_in_months DOUBLE AS (datediff(end_date, start_date)/30),
    PRIMARY KEY(lease_num, partner_id, property_num, client_id),
    UNIQUE(lease_num, property_num),
	FOREIGN KEY(property_num) REFERENCES rental_property(property_num)
		ON UPDATE CASCADE
        ON DELETE CASCADE,
	FOREIGN KEY(partner_id) REFERENCES partner(ID)
		ON UPDATE CASCADE,
	FOREIGN KEY(client_id) REFERENCES business_client(ID)
		ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE property_viewing(
	associate_id INT NOT NULL,
    client_id INT NOT NULL,
    property_num INT NOT NULL,
    viewing_date DATE,
    viewing_time  TIME,
    PRIMARY KEY(associate_id, client_id, property_num, viewing_date), 
	FOREIGN KEY(property_num) REFERENCES rental_property(property_num)
		ON UPDATE CASCADE
        ON DELETE CASCADE,
	FOREIGN KEY(associate_id) REFERENCES associate(ID)
		ON UPDATE CASCADE,
	FOREIGN KEY(client_id) REFERENCES business_client(ID)
		ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE email(
	ID INT NOT NULL,
    email_address VARCHAR(50),
    PRIMARY KEY(ID, email_address),
    UNIQUE(email_address),
    FOREIGN KEY(ID) REFERENCES person(ID)
		ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE phone(
	ID INT NOT NULL,
    phone_number VARCHAR(50),
    number_type VARCHAR(50),
    PRIMARY KEY(ID, phone_number),
    UNIQUE(phone_number),
    FOREIGN KEY(ID) REFERENCES person(ID)
		ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- Inserts an employee in one sql call. inserts tuples in person then in employee, inserting into person first is required due to foriegn constriants. 
DELIMITER //
Create PROCEDURE insert_employee(IN ID INT, IN first_name VARCHAR(50), IN last_name VARCHAR(50), IN street VARCHAR(50), IN city VARCHAR(50), IN state VARCHAR(50), IN zipcode INT, IN unit_num INT, 
								IN hire_date DATE, IN manager_id INT)
BEGIN
INSERT INTO person(ID, first_name, last_name, street, city, state, zipcode, unit_num) 
			VALUES(ID, first_name, last_name, street, city, state, zipcode, unit_num);
INSERT INTO employee(ID, hire_date, manager_id)
			VALUES(ID, hire_date, manager_id);
END 
//
DELIMITER ;

-- Inserts an partner in one sql call. inserts tuples in person then in employee and then partner, inserting tuple in that order is required due to foriegn constriants. 
DELIMITER //
Create PROCEDURE insert_partner(IN ID INT, IN first_name VARCHAR(50), IN last_name VARCHAR(50), IN street VARCHAR(50), IN city VARCHAR(50), IN state VARCHAR(50), IN zipcode INT, IN unit_num INT, 
								IN hire_date DATE, IN manager_id INT)
BEGIN
INSERT INTO person(ID, first_name, last_name, street, city, state, zipcode, unit_num) 
			VALUES(ID, first_name, last_name, street, city, state, zipcode, unit_num);
INSERT INTO employee(ID, hire_date, manager_id)
			VALUES(ID, hire_date, manager_id);
INSERT INTO partner(ID)
			VALUES(ID);
END 
//
DELIMITER ;

-- Inserts an associate in one sql call. inserts tuples in person then in employee and then associate, inserting tuple in that order is required due to foriegn constriants. 
DELIMITER //
Create PROCEDURE insert_associate(IN ID INT, IN first_name VARCHAR(50), IN last_name VARCHAR(50), IN street VARCHAR(50), IN city VARCHAR(50), IN state VARCHAR(50), IN zipcode INT, IN unit_num INT, 
								IN hire_date DATE, IN manager_id INT)
BEGIN
INSERT INTO person(ID, first_name, last_name, street, city, state, zipcode, unit_num) 
			VALUES(ID, first_name, last_name, street, city, state, zipcode, unit_num);
INSERT INTO employee(ID, hire_date, manager_id)
			VALUES(ID, hire_date, manager_id);
INSERT INTO associate(ID)
			VALUES(ID);
END 
//
DELIMITER ;	
 
 -- Inserts a property owner in one sql call. inserts tuples in person then in property_owner, inserting tuple in that order is required due to foriegn constriants. 
DELIMITER //
Create PROCEDURE insert_property_owner(IN ID INT, IN first_name VARCHAR(50), IN last_name VARCHAR(50), IN street VARCHAR(50), IN city VARCHAR(50), IN state VARCHAR(50), IN zipcode INT, IN unit_num INT, 
								IN corporation TEXT, IN partner_id INT)
BEGIN
INSERT INTO person(ID, first_name, last_name, street, city, state, zipcode, unit_num) 
			VALUES(ID, first_name, last_name, street, city, state, zipcode, unit_num);
INSERT INTO property_owner(ID, corporation, partner_id)
			VALUES(ID, corporation, partner_id);
END 
//
DELIMITER ;	

 -- Inserts a business_client in one sql call. inserts tuples in person then in business_client, inserting tuple in that order is required due to foriegn constriants. 
DELIMITER //
Create PROCEDURE insert_business_client(IN ID INT, IN first_name VARCHAR(50), IN last_name VARCHAR(50), IN street VARCHAR(50), IN city VARCHAR(50), IN state VARCHAR(50), IN zipcode INT, IN unit_num INT, 
								IN preference TEXT, IN max_rent INT)
BEGIN
INSERT INTO person(ID, first_name, last_name, street, city, state, zipcode, unit_num) 
			VALUES(ID, first_name, last_name, street, city, state, zipcode, unit_num);
INSERT INTO business_client(ID, preference, max_rent)
			VALUES(ID, preference, max_rent);
END 
//
DELIMITER ;	

-- adds a industrial rental property in a single sql call. where it would have requiered two due to the foreign constrains 
DELIMITER //
Create PROCEDURE insert_industrial_property(IN property_num INT,IN owner_id INT, IN manager_id INT, IN area_sq_ft INT, IN street VARCHAR(50), IN city VARCHAR(50), IN state VARCHAR(50), IN zipcode INT, IN unit_num INT,
											IN monthly_rent DOUBLE, IN management_fee_percentage DOUBLE, IN is_advertised BOOL, IN property_name VARCHAR(50))
BEGIN
INSERT INTO rental_property(property_num, owner_id, manager_id, area_sq_ft, street, city, state, zipcode, unit_num, monthly_rent, management_fee_percentage, is_advertised) 
			VALUES(property_num, owner_id, manager_id, area_sq_ft, street, city, state, zipcode, unit_num, monthly_rent, management_fee_percentage, is_advertised);
INSERT INTO industrial(property_num, property_name)
			VALUES(property_num, property_name);
END 
//
DELIMITER ;	

-- adds a commercial rental property in a single sql call. where it would have requiered two due to the foreign constrains 
DELIMITER //
Create PROCEDURE insert_commercial_property(IN property_num INT,IN owner_id INT, IN manager_id INT, IN area_sq_ft INT, IN street VARCHAR(50), IN city VARCHAR(50), IN state VARCHAR(50), IN zipcode INT, IN unit_num INT,
											IN monthly_rent DOUBLE, IN management_fee_percentage DOUBLE, IN is_advertised BOOL, IN property_name VARCHAR(50))
BEGIN
INSERT INTO rental_property(property_num, owner_id, manager_id, area_sq_ft, street, city, state, zipcode, unit_num, monthly_rent, management_fee_percentage, is_advertised) 
			VALUES(property_num, owner_id, manager_id, area_sq_ft, street, city, state, zipcode, unit_num, monthly_rent, management_fee_percentage, is_advertised);
INSERT INTO commercial(property_num, property_name)
			VALUES(property_num, property_name);
END 
//
DELIMITER ;	

-- adds a residential rental property in a single sql call. where it would have requiered two due to the foreign constrains 
DELIMITER //
Create PROCEDURE insert_residential_property(IN property_num INT,IN owner_id INT, IN manager_id INT, IN area_sq_ft INT, IN street VARCHAR(50), IN city VARCHAR(50), IN state VARCHAR(50), IN zipcode INT, IN unit_num INT,
											IN monthly_rent DOUBLE, IN management_fee_percentage DOUBLE, IN is_advertised BOOL, IN num_of_bedrooms INT, IN num_of_restrooms INT)
BEGIN
INSERT INTO rental_property(property_num, owner_id, manager_id, area_sq_ft, street, city, state, zipcode, unit_num, monthly_rent, management_fee_percentage, is_advertised) 
			VALUES(property_num, owner_id, manager_id, area_sq_ft, street, city, state, zipcode, unit_num, monthly_rent, management_fee_percentage, is_advertised);
INSERT INTO residential(property_num, num_of_bedrooms, num_of_restrooms)
			VALUES(property_num, num_of_bedrooms, num_of_restrooms);
END 
//
DELIMITER ;	

-- trigger that limits the amount of properties an associate can be assigned to, to 12
DELIMITER //
CREATE TRIGGER max_assigned_properties
BEFORE INSERT ON rental_property
FOR EACH ROW
BEGIN
    DECLARE cnt INT;

    SELECT count(manager_id) INTO cnt FROM rental_property where rental_property.manager_id = new.manager_id;

    IF cnt >= 12 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Associate can only be assigned up to 12 properties to manage.';
    END IF;
END;
//
DELIMITER ;	

-- 10. Creates a SQL trigger to automatically set to FALSE the advertisement flag of a property when it is leased.
DELIMITER //
CREATE TRIGGER set_ad_flag_false_on_lease_entry
AFTER INSERT ON lease
FOR EACH ROW
BEGIN
	UPDATE rental_property SET is_advertised = false WHERE NEW.property_num = rental_property.property_num;
END;
//
DELIMITER ;	

-- # create a index on the attribute 'first_name' and 'last_name' of 'person' to speed up shearches based on first name of a person 
CREATE INDEX person ON person(first_name);
