use airline_database_final;

CREATE TABLE route
(
id INT(11) AUTO_INCREMENT,
flight_id VARCHAR(32),
travel_from VARCHAR(32), 
travel_to VARCHAR(32),
airport_from VARCHAR(64),
airport_to VARCHAR(64),
PRIMARY KEY(id)
);

INSERT INTO route(flight_id, travel_from, travel_to, airport_from, airport_to)
VALUE ('ABLA01', 'Abuja', 'Lagos', 'Nnamdi Azikiwe International Airport, Abuja', 'Murtala Muhammed International Airport MM2, Lagos'),
      ('WRCL08', 'Warri', 'Calabar', 'Osubi Airport, Warri', 'Margaret Ekpo International Airport,Calabar'),
      ('ENKD06', 'Enugu', 'Kaduna', 'Akanu Ibiam International Airport, Enugu', 'Kaduna International Airport');
      
      
CREATE TABLE schedule
(
id INT(11) AUTO_INCREMENT,
route_id INT,
flight_date TIMESTAMP,
departure_time TIME, 	
seat_type VARCHAR(32),
PRIMARY KEY(id),
FOREIGN KEY (route_id) REFERENCES route(id)
);

INSERT INTO schedule(route_id, flight_date, departure_time, seat_type)
VALUE('1', '2020-02-18', '09:00:00','Economy'),
     ('1', '2020-02-18', '09:00:00','Business'),
	 ('2', '2020-02-18', '15:30:00','Economy'),
     ('2', '2020-02-18', '15:30:00','Business'),
     ('3', '2020-02-18', '22:00:00','Economy'),
     ('3', '2020-02-18', '22:00:00','Business');
     
SELECT * FROM schedule;
     
CREATE TABLE seat_class
(
id INT(11) AUTO_INCREMENT,
class_id INT(11),
seat_class VARCHAR(32),
seat_number VARCHAR(5),
availability BOOL,
PRIMARY KEY(id),
FOREIGN KEY (class_id) REFERENCES schedule(id)
);

INSERT INTO seat_class(class_id, seat_class, seat_number, availability)
VALUES('1', 'economy', 'a1', TRUE),
      ('1', 'economy', 'a2', TRUE),
      ('1', 'economy', 'b1', TRUE),
      ('1', 'economy', 'b2', TRUE),
      ('2', 'business', 'g1', TRUE),
      ('2', 'business', 'g2', TRUE),
      ('2', 'business', 'h1', TRUE),
      ('2', 'business', 'h2', TRUE);
 
 SELECT * FROM seat_class;
 
CREATE TABLE passenger_info
(
id INT(11) AUTO_INCREMENT,
seat_allocated INT(11),
Title VARCHAR(10),
first_name VARCHAR(32),
middle_name VARCHAR(32),
last_name VARCHAR(32),
gender VARCHAR(32),
date_of_birth VARCHAR(16),
country VARCHAR(32),
phone_number VARCHAR(20),
email VARCHAR(64),
PRIMARY KEY(id),
FOREIGN KEY(seat_allocated) REFERENCES seat_class(id)
);

INSERT INTO passenger_info(seat_allocated, Title, first_name, middle_name, last_name, gender, date_of_birth, country, phone_number, email)
VALUES('1', 'Mr', 'Sakamanje', 'Tulamonia', 'Ajanlekoko', 'male','01-01-1970', 'Nigeria', '0803000000', 'ajanlekoko@gmail.com'),
      ('5', 'Mrs', 'omobu', 'Alaseju', 'Ajanlekoko', 'female','04-06-1975', 'Nigeria', '0804000000', 'ajanlekokomrs@gmail.com'),
      ('3', 'Mr', 'Naira', 'Omobu', 'Marley', 'male','24-04-1990', 'Nigeria', '0805000000', 'marlian@gmail.com'),
      ('7', 'Miss', 'Tiwa', 'Nwanem', 'Savage', 'female','25-08-1992', 'Nigeria', '0806000000', 'savage@gmail.com'),
      ('4', 'Mrs', 'Aishat', 'Esther', 'Buhari', 'female','11-11-1993', 'Nigeria', '0807000000', 'buhari@gmail.com'),
      ('8', 'Mr', 'Ambode', 'Tinubu', 'Sanwoolu', 'male','01-01-1980', 'Nigeria', '0808000000', 'lagoso@gmail.com');
  


CREATE TABLE transactions
(
id INT(11) AUTO_INCREMENT,
bookings INT(11),
payment_type VARCHAR(32),
payment_status VARCHAR(32),
PRIMARY KEY(id),
FOREIGN KEY(bookings) REFERENCES passenger_info(id)
);

INSERT INTO transactions(bookings, payment_type, payment_status)
VALUES ('1','Online', 'paid'),
       ('5','Cash in person', 'paid');