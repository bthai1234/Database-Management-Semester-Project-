
INSERT INTO person(ID, first_name, last_name, street, city, state, zipcode, unit_num) 
			VALUE(0001, 'ben', 'thai', '17100 Blossom View Dr', 'Olney', 'Maryland', 20832, 0);
INSERT INTO employee(ID, hire_date, manager_id) VALUE(0001, '2017-01-01', NULL);
INSERT INTO phone(ID, phone_number, number_type) value(0001, '3011234567', 'home');
INSERT INTO phone(ID, phone_number, number_type) value(0001, '3017654321', 'work');
INSERT INTO email(ID, email_address) value(0001, 'bthai1@umbc.edu');
INSERT INTO email(ID, email_address) value(0001, 'ben.thai1234@gmail.com');


-- insert associates info
CALL insert_associate(0002, 'John', 'Smith', '17200 Blossom View Dr', 'Olney', 'Maryland', 20832, 1, '2017-01-02', 0001);
INSERT INTO phone(ID, phone_number, number_type) value(0002, '3014321567', 'home');
INSERT INTO phone(ID, phone_number, number_type) value(0002, '3015674321', 'work');
INSERT INTO email(ID, email_address) value(0002, 'JohnSmith1@umbc.edu');
INSERT INTO email(ID, email_address) value(0002, 'John.Smith1234@gmail.com');

CALL insert_associate(0003, 'jane', 'dowe', '17300 Blossom View Dr', 'Olney', 'Maryland', 20832, 2, '2017-01-02', 0002);
INSERT INTO phone(ID, phone_number, number_type) value(0003, '3011726354', 'home');
INSERT INTO phone(ID, phone_number, number_type) value(0003, '3014536271', 'work');
INSERT INTO email(ID, email_address) value(0003, 'JaneDoe@umbc.edu');
INSERT INTO email(ID, email_address) value(0003, 'Jane.Doe1234@gmail.com');

CALL insert_associate(0004, 'Bob', 'Builder', '17400 Blossom View Dr', 'Olney', 'Maryland', 20832, 3, '2017-01-04', 0002);
INSERT INTO phone(ID, phone_number, number_type) value(0004, '3012674361', 'home');
INSERT INTO phone(ID, phone_number, number_type) value(0004, '3092745924', 'work');
INSERT INTO email(ID, email_address) value(0004, 'BobBuilder@umbc.edu');
INSERT INTO email(ID, email_address) value(0004, 'Bob.Builder@gmail.com');


-- Insert partner info
CALL insert_partner(0005, 'Dora', 'Explorer', '17500 Blossom View Dr', 'Olney', 'Maryland', 20832, 4, '2017-01-08', 0001);
INSERT INTO phone(ID, phone_number, number_type) value(0005, '3014653234', 'home');
INSERT INTO phone(ID, phone_number, number_type) value(0005, '3019798674', 'work');
INSERT INTO email(ID, email_address) value(0005, 'DoraExplorer@umbc.edu');
INSERT INTO email(ID, email_address) value(0005, 'DoraExplorer@gmail.com');

CALL insert_partner(0006, 'jimmy', 'Newtron', '17600 Blossom View Dr', 'Olney', 'Maryland', 20832, 5, '2017-02-08', 0005);
INSERT INTO phone(ID, phone_number, number_type) value(0006, '3019032471', 'home');
INSERT INTO phone(ID, phone_number, number_type) value(0006, '3018273423', 'work');
INSERT INTO email(ID, email_address) value(0006, 'jimmyNewtron@umbc.edu');
INSERT INTO email(ID, email_address) value(0006, 'jimmyNewtron@gmail.com');


-- insert client info
CALL insert_business_client(0007, 'Sponge', 'Bob', '1234 Pinapple Rd', 'Bikini Bottom', 'ocean', 73923, 1, 'cheap', 200);
INSERT INTO phone(ID, phone_number, number_type) value(0007, '2408734122', 'cell');
INSERT INTO email(ID, email_address) value(0007, 'SpongeBob@gmail.com');

CALL insert_business_client(0008, 'Patrick', 'Star', '12345 Pinapple Rd', 'Bikini Bottom', 'ocean', 73923, 2, 'under a Rock would be nice', 500);
INSERT INTO phone(ID, phone_number, number_type) value(0008, '2401233443', 'cell');
INSERT INTO email(ID, email_address) value(0008, 'PatrickStar@gmail.com');

CALL insert_business_client(0009, 'Squid', 'Ward', '4321 Pinapple Rd', 'Bikini Bottom', 'ocean', 73923, 3, 'not near Sponge Bobs house', 1000);
INSERT INTO phone(ID, phone_number, number_type) value(0009, '2405789322', 'cell');
INSERT INTO email(ID, email_address) value(0009, 'SquidWard@gmail.com');

CALL insert_business_client(0010, 'Sandy', 'Cheeks', '43421 Ocean Rd', 'Bikini Bottom', 'ocean', 73923, 2, 'under water', 5000);
INSERT INTO phone(ID, phone_number, number_type) value(0010, '2401121111', 'cell');
INSERT INTO email(ID, email_address) value(0010, 'SandyCheeks@gmail.com');

CALL insert_business_client(0011, 'Wallace', 'Smith', '65433 Claymation Rd', 'StopMotion City', 'Dog', 23423, 1, 'lots of space, and pets allowed', 10000);
INSERT INTO phone(ID, phone_number, number_type) value(0011, '2402222222', 'cell');
INSERT INTO email(ID, email_address) value(0011, 'WallaceSmith@gmail.com');

CALL insert_business_client(0012, 'Gromit', 's', '6234 Claymation Rd', 'StopMotion City', 'Dog', 23423, 2, 'no sheep near by', 10000);
INSERT INTO phone(ID, phone_number, number_type) value(0012, '2404444442', 'cell');
INSERT INTO email(ID, email_address) value(0012, 'GromitSmith@gmail.com');

CALL insert_business_client(0013, 'Billy', 'Doe', '23421 BIlly Rd', 'Billy City', 'csomtion', 223423, 3, 'Has a nice view', 2000);
INSERT INTO phone(ID, phone_number, number_type) value(0013, '2405566442', 'cell');
INSERT INTO email(ID, email_address) value(0013, 'BillyDoe@gmail.com');

CALL insert_business_client(0014, 'Amilea', 'Wattson', '23456 Holo Rd', 'Hololive', 'youtube', 12345, 1, 'cheap', 100);
INSERT INTO phone(ID, phone_number, number_type) value(0014, '2405534564', 'cell');
INSERT INTO email(ID, email_address) value(0014, 'AmileaWattson@gmail.com');

CALL insert_business_client(0015, 'Gura', 'Gawr', '23516 Holo Rd', 'Hololive', 'youtube', 12345, 2, 'Nice View', 1000);
INSERT INTO phone(ID, phone_number, number_type) value(0015, '24055325266', 'cell');
INSERT INTO email(ID, email_address) value(0015, 'GuraGawr@gmail.com');

CALL insert_business_client(0016, 'Takanashi', 'Kiara', '13516 Holo Rd', 'Hololive', 'youtube', 12345, 3, 'Nice View', 2000);
INSERT INTO phone(ID, phone_number, number_type) value(0016, '24088884566', 'cell');
INSERT INTO email(ID, email_address) value(0016, 'TakanashiKiara@gmail.com');

CALL insert_business_client(0017, 'Subaru', 'Ozaru', '12516 Holo Rd', 'Hololive', 'youtube', 12345, 4, 'Nice View', 50000);
INSERT INTO phone(ID, phone_number, number_type) value(0017, '2477784566', 'cell');
INSERT INTO email(ID, email_address) value(0017, 'SubaruOzaru@gmail.com');

CALL insert_business_client(0018, 'Haachama', 'Chama', '12516 Holo Rd', 'Hololive', 'youtube', 12345, 5, 'Nice View', 500);
INSERT INTO phone(ID, phone_number, number_type) value(0018, '2466684566', 'cell');
INSERT INTO email(ID, email_address) value(0018, 'HaachamaChama@gmail.com');


-- Insert Private property Owners
CALL insert_property_owner(0019, 'Matsuri', 'Channel', '1265 Holo Rd', 'Hololive', 'youtube', 1234, 6, 'Hololive', 0005);
INSERT INTO phone(ID, phone_number, number_type) value(0019, '2463442566', 'cell');
INSERT INTO email(ID, email_address) value(0019, 'Matsuri@gmail.com');

CALL insert_property_owner(0020, 'Robco', 'Channel', '1365 Holo Rd', 'Hololive', 'youtube', 1234, 7, 'Hololive', 0005);
INSERT INTO phone(ID, phone_number, number_type) value(0020, '2463943566', 'cell');
INSERT INTO email(ID, email_address) value(0020, 'Robco@gmail.com');

CALL insert_property_owner(0021, 'Sora', 'Channel', '1465 Holo Rd', 'Hololive', 'youtube', 1234, 8, 'Hololive', 0005);
INSERT INTO phone(ID, phone_number, number_type) value(0021, '2468934366', 'cell');
INSERT INTO email(ID, email_address) value(0021, 'Sora@gmail.com');

CALL insert_property_owner(0022, 'Ayame', 'Nakiri', '1665 Holo Rd', 'Hololive', 'youtube', 1234, 9, 'Hololive', 0006);
INSERT INTO phone(ID, phone_number, number_type) value(0022, '24345334346', 'cell');
INSERT INTO email(ID, email_address) value(0022, 'AyameNakiri@gmail.com');

CALL insert_property_owner(0023, 'Aqua', 'Channel', '1865 Holo Rd', 'Hololive', 'youtube', 1234, 2, 'Hololive', 0006);
INSERT INTO phone(ID, phone_number, number_type) value(0023, '23345387546', 'cell');
INSERT INTO email(ID, email_address) value(0023, 'Aqua@gmail.com');

CALL insert_property_owner(0024, 'Last', 'Airbender', '1865 Ba Sing Se', 'Ba Sing Se', 'Earth Nation', 1244, 2, NULL, 0006);
INSERT INTO phone(ID, phone_number, number_type) value(0024, '233453387546', 'cell');
INSERT INTO email(ID, email_address) value(0024, 'LastAirbender@gmail.com');

CALL insert_property_owner(0026, 'Pat', 'Doe', '1865 address', 'city1', 'maryland', 1244, 2, NULL, 0006);
INSERT INTO phone(ID, phone_number, number_type) value(0026, '233533887546', 'cell');
INSERT INTO email(ID, email_address) value(0026, 'PatDoe@gmail.com');


-- Insert residential Rental Properties
CALL insert_residential_property(1001, 0019, 0002, 24, '1800 Residentail Street', 'City1', 'maryland', 24643, 1,
								500, (.03), TRUE, 2, 1); 
                                
CALL insert_residential_property(1002, 0019, 0002, 15, '2800 Residentail Street', 'City2', 'maryland', 24643, 2,
								1000, (.03), TRUE, 1, 1); 
                                
CALL insert_residential_property(1003, 0020, 0002, 10, '3800 Residentail Street', 'City1', 'maryland', 24643, 3,
								5000, (.02), TRUE, 1, 1); 

CALL insert_residential_property(1004, 0020, 0002, 40, '4800 Residentail Street', 'City2', 'maryland', 24643, 4,
								8000, (.05), TRUE, 3, 2); 
                                
CALL insert_residential_property(1005, 0021, 0002, 50, '5800 Residentail Street', 'City2', 'maryland', 24643, 5,
								2000, (.02), TRUE, 4, 2); 
                                
CALL insert_residential_property(1006, 0021, 0002, 100, '6800 Residentail Street', 'City2', 'maryland', 24643, 6,
								300, (.05), TRUE, 6, 3); 


-- Insert residential industrial Properties
CALL insert_industrial_property(1007, 0024, 0004, 300, '1800 industrial Street', 'City2', 'maryland', 2345, 1,
											5000, (.05), TRUE, 'Steel Mill'); 
                                
CALL insert_industrial_property(1008, 0024, 0004, 200, '2800 industrial Street', 'City1', 'maryland', 2345, 3,
											6000, (.02), TRUE, 'Construction Inc.'); 
                                
CALL insert_industrial_property(1009, 0023, 0004, 500, '3800 industrial Street', 'City1', 'maryland', 2345, 2,
											2000, (.03), TRUE, 'Junk Yard'); 

CALL insert_industrial_property(1010, 0023, 0004, 300, '4800 industrial Street', 'City2', 'maryland', 2345, 5,
											1000, (.02), TRUE, 'Work Shop'); 
                                
CALL insert_industrial_property(1011, 0022, 0004, 1000, '5800 industrial Street', 'City2', 'maryland', 2345, 4,
											8000, (.02), TRUE, 'Concrete'); 
                                
CALL insert_industrial_property(1012, 0022, 0004, 900, '6800 industrial Street', 'City2', 'maryland', 2345, 3,
											900, (.08), TRUE, 'Warehouse'); 
                
                
-- Insert residential commercial Properties
CALL insert_commercial_property(1013, 0019, 0003, 300, '1800 commercial Street', 'City2', 'maryland', 223445, 1,
											5000, (.05), TRUE, 'Dentist'); 
                                
CALL insert_commercial_property(1014, 0024, 0003, 200, '2800 commercial Street', 'City2', 'maryland', 223445, 3,
											6000, (.02), TRUE, 'Vet'); 
                                
CALL insert_commercial_property(1015, 0023, 0003, 500, '3800 commercial Street', 'City1', 'maryland', 223445, 2,
											2000, (.03), TRUE, 'Shop'); 

CALL insert_commercial_property(1016, 0020, 0003, 300, '4800 commercial Street', 'City2', 'maryland', 223445, 5,
											1000, (.02), TRUE, 'Coffee Shop'); 
                                
CALL insert_commercial_property(1017, 0021, 0003, 1000, '5800 commercial Street', 'City1', 'maryland', 223445, 4,
											200, (.02), TRUE, 'Pet Shop'); 
                                
CALL insert_commercial_property(1018, 0022, 0003, 900, '6800 commercial Street', 'City1', 'maryland', 223445, 3,
											900, (.08), TRUE, 'Clinic'); 
                                            
CALL insert_commercial_property(1019, 0026, 0003, 900, '6900 commercial Street', 'City1', 'maryland', 223345, 3,
											900, (.08), TRUE, 'Pat Doe shop'); 
                                            
CALL insert_commercial_property(1020, 0026, 0003, 900, '6900 commercial Street', 'City2', 'maryland', 223345, 3,
											900, (.08), TRUE, 'Pat Doe shop'); 

-- Insert Property Viewings
INSERT INTO property_viewing(associate_id, client_id, property_num , viewing_date, viewing_time) 
								VALUE(0003, 0009, 1016, '2020-01-20', '03:30:00');
INSERT INTO property_viewing(associate_id, client_id, property_num , viewing_date, viewing_time) 
								VALUE(0003, 0008, 1017, '2020-02-21', '05:30:00');
INSERT INTO property_viewing(associate_id, client_id, property_num , viewing_date, viewing_time) 
								VALUE(0003, 0010, 1015, '2020-02-21', '12:30:00');

INSERT INTO property_viewing(associate_id, client_id, property_num , viewing_date, viewing_time) 
								VALUE(0002, 0012, 1006, '2019-03-20', '01:00:00');
INSERT INTO property_viewing(associate_id, client_id, property_num , viewing_date, viewing_time) 
								VALUE(0002, 0010, 1005, '2020-02-22', '06:30:00');
INSERT INTO property_viewing(associate_id, client_id, property_num , viewing_date, viewing_time) 
								VALUE(0002, 0012, 1003, '2020-02-23', '08:00:00');

INSERT INTO property_viewing(associate_id, client_id, property_num , viewing_date, viewing_time) 
								VALUE(0004, 0013, 1012, '2020-02-20', '03:30:00');
INSERT INTO property_viewing(associate_id, client_id, property_num , viewing_date, viewing_time) 
								VALUE(0004, 0015, 1010, '2019-03-20', '05:00:00');
INSERT INTO property_viewing(associate_id, client_id, property_num , viewing_date, viewing_time) 
								VALUE(0004, 0016, 1010, '2020-01-21', '01:30:00');

INSERT INTO property_viewing(associate_id, client_id, property_num , viewing_date, viewing_time) 
								VALUE(0002, 0011, 1002, '2020-02-21', '01:00:00');
INSERT INTO property_viewing(associate_id, client_id, property_num , viewing_date, viewing_time) 
								VALUE(0002, 0011, 1003, '2020-03-22', '06:00:00');
INSERT INTO property_viewing(associate_id, client_id, property_num , viewing_date, viewing_time) 
								VALUE(0002, 0017, 1004, '2020-01-24', '08:00:00');
-- insert lease
INSERT INTO lease(partner_id, property_num , client_id, lease_num, lease_date, start_date, end_date, deposit, monthly_rent) 
					VALUE(0005, 1016 , 0009, 2001, '2020-12-20', '2020-12-25', '2021-03-25', 500, 1000);
INSERT INTO lease(partner_id, property_num , client_id, lease_num, lease_date, start_date, end_date, deposit, monthly_rent)
					VALUE(0005, 1017 , 0008, 2002, '2020-07-20', '2020-08-20', '2020-12-20', 100, 200);
INSERT INTO lease(partner_id, property_num , client_id, lease_num, lease_date, start_date, end_date, deposit, monthly_rent)
					VALUE(0005, 1010 , 0015, 2003, '2019-04-20', '2019-06-20', '2020-06-20', 500, 1000);
INSERT INTO lease(partner_id, property_num , client_id, lease_num, lease_date, start_date, end_date, deposit, monthly_rent)
					VALUE(0005, 1006 , 0012, 2004, '2019-08-20', '2019-08-29', '2020-05-29', 100, 300);
INSERT INTO lease(partner_id, property_num , client_id, lease_num, lease_date, start_date, end_date, deposit, monthly_rent)
					VALUE(0006, 1002 , 0011, 2005, '2020-03-20', '2020-05-20', '2021-06-20', 400, 1000);
INSERT INTO lease(partner_id, property_num , client_id, lease_num, lease_date, start_date, end_date, deposit, monthly_rent)
					VALUE(0006, 1004 , 0017, 2006, '2019-06-20', '2019-07-20', '2020-07-20', 2000, 8000);
 






