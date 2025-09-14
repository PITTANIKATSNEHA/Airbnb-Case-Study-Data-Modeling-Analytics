INSERT INTO property_type_dim VALUES (1,'Apartment'), (2,'House');
INSERT INTO location_dim VALUES (1,'Bangalore','KA','India',10000000);
INSERT INTO users_dim VALUES (1,'Sneha','2020-01-01','India','guest');
INSERT INTO hosts_dim VALUES (1,'Rahul','2018-05-10',95.5,'Bangalore');
INSERT INTO properties_dim VALUES (1,'Cozy Apartment',1,'Entire Place',3,1,12.9716,77.5946);
INSERT INTO payments_dim VALUES (1,'Credit Card','Visa','Success');
INSERT INTO calendar_dim VALUES (20250914,'2025-09-14',2025,9,14,'Sunday');
INSERT INTO bookings_fact VALUES (1,20250914,1,1,1,2500,'INR',2,false,1,'2025-09-10 12:00:00');
INSERT INTO reviews_fact VALUES (1,1,20250914,4.8,'Great stay!');
