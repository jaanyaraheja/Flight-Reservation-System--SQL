CREATE TABLE Airlines ( 
    airline_id NUMBER(10) PRIMARY KEY, 
    airline_name VARCHAR2(255) NOT NULL, 
    loyalty_program_enabled CHAR(1) NOT NULL 
);

CREATE TABLE Airports ( 
    airport_id NUMBER(10) PRIMARY KEY, 
    airport_code VARCHAR2(3) NOT NULL, 
    airport_name VARCHAR2(255) NOT NULL, 
    city VARCHAR2(255) NOT NULL, 
    country VARCHAR2(255) NOT NULL 
);

CREATE TABLE Routes ( 
    route_id NUMBER(10) PRIMARY KEY, 
    origin_airport_id NUMBER(10) NOT NULL, 
    destination_airport_id NUMBER(10) NOT NULL, 
    FOREIGN KEY (origin_airport_id) REFERENCES Airports(airport_id), 
    FOREIGN KEY (destination_airport_id) REFERENCES Airports(airport_id) 
);

CREATE TABLE Flights ( 
    flight_id NUMBER(10) PRIMARY KEY, 
    airline_id NUMBER(10) NOT NULL, 
    route_id NUMBER(10) NOT NULL, 
    departure_time TIMESTAMP NOT NULL, 
    arrival_time TIMESTAMP NOT NULL, 
    capacity NUMBER(5) NOT NULL, 
    FOREIGN KEY (airline_id) REFERENCES Airlines(airline_id), 
    FOREIGN KEY (route_id) REFERENCES Routes(route_id) 
);

CREATE TABLE Passengers ( 
    passenger_id NUMBER(10) PRIMARY KEY, 
    name VARCHAR2(255) NOT NULL, 
    email VARCHAR2(255) NOT NULL, 
    phone VARCHAR2(20) NOT NULL, 
    loyalty_points NUMBER(5) DEFAULT 0 
);

CREATE TABLE Bookings ( 
    booking_id NUMBER(10) PRIMARY KEY, 
    flight_id NUMBER(10) NOT NULL, 
    passenger_id NUMBER(10) NOT NULL, 
    booking_date TIMESTAMP NOT NULL, 
    class VARCHAR2(20) NOT NULL, 
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id), 
    FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id) 
);

INSERT INTO Airlines (airline_id, airline_name, loyalty_program_enabled) 
VALUES  
    (1, 'Airline A', 'Y');

INSERT INTO Airlines (airline_id, airline_name, loyalty_program_enabled) 
VALUES  
    (2, 'Airline B', 'N');

INSERT INTO Airlines (airline_id, airline_name, loyalty_program_enabled) 
VALUES  
    (3, 'Airline C', 'Y');

INSERT INTO Airlines (airline_id, airline_name, loyalty_program_enabled) 
VALUES  
    (4, 'Airline D', 'Y');

INSERT INTO Airlines (airline_id, airline_name, loyalty_program_enabled) 
VALUES  
    (5, 'Airline E', 'N');

INSERT INTO Airlines (airline_id, airline_name, loyalty_program_enabled) 
VALUES  
    (6, 'Airline F', 'N');

INSERT INTO Airlines (airline_id, airline_name, loyalty_program_enabled) 
VALUES  
    (7, 'Airline G', 'Y');

INSERT INTO Airlines (airline_id, airline_name, loyalty_program_enabled) 
VALUES  
    (8, 'Airline H', 'Y');

INSERT INTO Airlines (airline_id, airline_name, loyalty_program_enabled) 
VALUES  
    (9, 'Airline I', 'N');

INSERT INTO Airlines (airline_id, airline_name, loyalty_program_enabled) 
VALUES  
    (10, 'Airline J', 'Y');

INSERT INTO Airports (airport_id, airport_code, airport_name, city, country) 
VALUES (1, 'JFK', 'John F. Kennedy International Airport', 'New York', 'USA');

INSERT INTO Airports (airport_id, airport_code, airport_name, city, country) 
VALUES (2, 'LAX', 'Los Angeles International Airport', 'Los Angeles', 'USA');

INSERT INTO Airports (airport_id, airport_code, airport_name, city, country) 
VALUES (3, 'LHR', 'London Heathrow Airport', 'London', 'UK');

INSERT INTO Airports (airport_id, airport_code, airport_name, city, country) 
VALUES (4, 'CDG', 'Charles de Gaulle Airport', 'Paris', 'France');

INSERT INTO Airports (airport_id, airport_code, airport_name, city, country) 
VALUES (5, 'SFO', 'San Francisco International Airport', 'San Francisco', 'USA');

INSERT INTO Airports (airport_id, airport_code, airport_name, city, country) 
VALUES (6, 'AMS', 'Amsterdam Airport Schiphol', 'Amsterdam', 'Netherlands');

INSERT INTO Airports (airport_id, airport_code, airport_name, city, country) 
VALUES (7, 'SYD', 'Sydney Kingsford Smith Airport', 'Sydney', 'Australia');

INSERT INTO Airports (airport_id, airport_code, airport_name, city, country) 
VALUES (8, 'DXB', 'Dubai International Airport', 'Dubai', 'UAE');

INSERT INTO Airports (airport_id, airport_code, airport_name, city, country) 
VALUES (9, 'HND', 'Haneda Airport', 'Tokyo', 'Japan');

INSERT INTO Airports (airport_id, airport_code, airport_name, city, country) 
VALUES (10, 'PEK', 'Beijing Capital International Airport', 'Beijing', 'China');

INSERT INTO Routes (route_id, origin_airport_id, destination_airport_id) 
VALUES  
    (1, 1, 2);

INSERT INTO Routes (route_id, origin_airport_id, destination_airport_id) 
VALUES  
    (2, 2, 1);

INSERT INTO Routes (route_id, origin_airport_id, destination_airport_id) 
VALUES  
    (3, 1, 3);

INSERT INTO Routes (route_id, origin_airport_id, destination_airport_id) 
VALUES  
    (4, 3, 1);

INSERT INTO Routes (route_id, origin_airport_id, destination_airport_id) 
VALUES  
    (5, 2, 3);

INSERT INTO Routes (route_id, origin_airport_id, destination_airport_id) 
VALUES  
    (6, 3, 2);

INSERT INTO Routes (route_id, origin_airport_id, destination_airport_id) 
VALUES  
    (7, 4, 5);

INSERT INTO Routes (route_id, origin_airport_id, destination_airport_id) 
VALUES  
    (8, 5, 4);

INSERT INTO Routes (route_id, origin_airport_id, destination_airport_id) 
VALUES  
    (9, 6, 7);

INSERT INTO Routes (route_id, origin_airport_id, destination_airport_id) 
VALUES  
    (10, 7, 6);

INSERT INTO Flights (flight_id, airline_id, route_id, departure_time, arrival_time, capacity) 
VALUES  
    (1, 1, 1, TO_TIMESTAMP('2024-04-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-04-01 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 200);

INSERT INTO Flights (flight_id, airline_id, route_id, departure_time, arrival_time, capacity) 
VALUES 
    (2, 2, 2, TO_TIMESTAMP('2024-04-02 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-04-02 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 180);

INSERT INTO Flights (flight_id, airline_id, route_id, departure_time, arrival_time, capacity) 
VALUES 
    (3, 3, 3, TO_TIMESTAMP('2024-04-03 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-04-03 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 220);

INSERT INTO Flights (flight_id, airline_id, route_id, departure_time, arrival_time, capacity) 
VALUES 
    (4, 4, 4, TO_TIMESTAMP('2024-04-04 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-04-04 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 150);

INSERT INTO Flights (flight_id, airline_id, route_id, departure_time, arrival_time, capacity) 
VALUES 
    (5, 5, 5, TO_TIMESTAMP('2024-04-05 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-04-05 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 190);

INSERT INTO Flights (flight_id, airline_id, route_id, departure_time, arrival_time, capacity) 
VALUES 
    (6, 6, 6, TO_TIMESTAMP('2024-04-06 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-04-06 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), 210);

INSERT INTO Flights (flight_id, airline_id, route_id, departure_time, arrival_time, capacity) 
VALUES 
    (7, 7, 7, TO_TIMESTAMP('2024-04-07 20:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-04-07 23:00:00', 'YYYY-MM-DD HH24:MI:SS'), 230);

INSERT INTO Flights (flight_id, airline_id, route_id, departure_time, arrival_time, capacity) 
VALUES 
    (8, 8, 8, TO_TIMESTAMP('2024-04-08 22:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-04-09 01:00:00', 'YYYY-MM-DD HH24:MI:SS'), 240);

INSERT INTO Flights (flight_id, airline_id, route_id, departure_time, arrival_time, capacity) 
VALUES 
    (9, 9, 9, TO_TIMESTAMP('2024-04-10 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-04-10 03:00:00', 'YYYY-MM-DD HH24:MI:SS'), 180);

INSERT INTO Flights (flight_id, airline_id, route_id, departure_time, arrival_time, capacity) 
VALUES 
    (10, 10, 10, TO_TIMESTAMP('2024-04-11 02:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-04-11 05:00:00', 'YYYY-MM-DD HH24:MI:SS'), 220);

select * from bookings;

select * from flights;

select * from flights;

select * from passengers;

INSERT INTO Passengers (passenger_id, name, email, phone, loyalty_points) 
VALUES  
    (1, 'John Doe', 'john.doe@example.com', '1234567890', 100);

INSERT INTO Passengers (passenger_id, name, email, phone, loyalty_points) 
VALUES  
    (2, 'Jane Smith', 'jane.smith@example.com', '0987654321', 50);

INSERT INTO Passengers (passenger_id, name, email, phone, loyalty_points) 
VALUES  
    (3, 'David Johnson', 'david.johnson@example.com', '9876543210', 200);

INSERT INTO Passengers (passenger_id, name, email, phone, loyalty_points) 
VALUES  
    (4, 'Emily Brown', 'emily.brown@example.com', '4567890123', 150);

INSERT INTO Passengers (passenger_id, name, email, phone, loyalty_points) 
VALUES  
    (5, 'Michael Wilson', 'michael.wilson@example.com', '7890123456', 75);

INSERT INTO Passengers (passenger_id, name, email, phone, loyalty_points) 
VALUES  
    (6, 'Sarah Taylor', 'sarah.taylor@example.com', '3210987654', 120);

INSERT INTO Passengers (passenger_id, name, email, phone, loyalty_points) 
VALUES  
    (7, 'Daniel Martinez', 'daniel.martinez@example.com', '6543210987', 180);

INSERT INTO Passengers (passenger_id, name, email, phone, loyalty_points) 
VALUES  
    (8, 'Olivia Anderson', 'olivia.anderson@example.com', '0123456789', 90);

INSERT INTO Passengers (passenger_id, name, email, phone, loyalty_points) 
VALUES  
    (9, 'James Garcia', 'james.garcia@example.com', '9876543210', 210);

INSERT INTO Passengers (passenger_id, name, email, phone, loyalty_points) 
VALUES  
    (10, 'Sophia Lee', 'sophia.lee@example.com', '5432109876', 110);

INSERT INTO Bookings (booking_id, flight_id, passenger_id, booking_date, class) 
VALUES  
    (1, 1, 1, TO_TIMESTAMP('2024-03-25 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Economy');

INSERT INTO Bookings (booking_id, flight_id, passenger_id, booking_date, class) 
VALUES  
    (2, 2, 2, TO_TIMESTAMP('2024-03-26 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Business');

INSERT INTO Bookings (booking_id, flight_id, passenger_id, booking_date, class) 
VALUES  
    (3, 3, 3, TO_TIMESTAMP('2024-03-27 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Economy');

INSERT INTO Bookings (booking_id, flight_id, passenger_id, booking_date, class) 
VALUES  
    (4, 4, 4, TO_TIMESTAMP('2024-03-28 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Economy');

INSERT INTO Bookings (booking_id, flight_id, passenger_id, booking_date, class) 
VALUES  
    (5, 5, 5, TO_TIMESTAMP('2024-03-29 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Business');

INSERT INTO Bookings (booking_id, flight_id, passenger_id, booking_date, class) 
VALUES  
    (6, 6, 6, TO_TIMESTAMP('2024-03-30 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Economy');

INSERT INTO Bookings (booking_id, flight_id, passenger_id, booking_date, class) 
VALUES  
    (7, 7, 7, TO_TIMESTAMP('2024-03-31 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Business');

INSERT INTO Bookings (booking_id, flight_id, passenger_id, booking_date, class) 
VALUES  
    (8, 8, 8, TO_TIMESTAMP('2024-04-01 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Economy');

INSERT INTO Bookings (booking_id, flight_id, passenger_id, booking_date, class) 
VALUES  
    (9, 9, 9, TO_TIMESTAMP('2024-04-02 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Economy');

INSERT INTO Bookings (booking_id, flight_id, passenger_id, booking_date, class) 
VALUES  
    (10, 10, 10, TO_TIMESTAMP('2024-04-03 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Business');

select* from Airlines;

INSERT INTO airports (airport_id, airport_code, airport_name, city, country) VALUES (11, 'LAX', 'Los Angeles International Airport', 'Los Angeles', 'USA');

INSERT INTO airports (airport_id, airport_code, airport_name, city, country) VALUES (12, 'ORD', 'O\Hare International Airport', 'Chicago', 'USA');

INSERT INTO airports (airport_id, airport_code, airport_name, city, country) VALUES (13, 'DFW', 'Dallas/Fort Worth International Airport', 'Dallas', 'USA');

INSERT INTO airlines (airline_id, airline_name, loyalty_program_enabled) VALUES (11, 'Airline K', 'Y');

INSERT INTO airlines (airline_id, airline_name, loyalty_program_enabled) VALUES (12, 'Airline L', 'N');

INSERT INTO airlines (airline_id, airline_name, loyalty_program_enabled) VALUES (13, 'Airline M', 'Y');

INSERT INTO airlines (airline_id, airline_name, loyalty_program_enabled) VALUES (14, 'Airline N', 'N');

INSERT INTO airports (airport_id, airport_code, airport_name, city, country) VALUES (14, 'DEN', 'Denver International Airport', 'Denver', 'USA');

INSERT INTO airports (airport_id, airport_code, airport_name, city, country) VALUES (15, 'ATL', 'Hartsfield-Jackson Atlanta International Airport', 'Atlanta', 'USA');

INSERT INTO airports (airport_id, airport_code, airport_name, city, country) VALUES (16, 'SFO', 'San Francisco International Airport', 'San Francisco', 'USA');

INSERT INTO airports (airport_id, airport_code, airport_name, city, country) VALUES (17, 'JFK', 'John F. Kennedy International Airport', 'New York', 'USA');

INSERT INTO airports (airport_id, airport_code, airport_name, city, country) VALUES (18, 'SEA', 'Seattle-Tacoma International Airport', 'Seattle', 'USA');

INSERT INTO airports (airport_id, airport_code, airport_name, city, country) VALUES (19, 'LAS', 'McCarran International Airport', 'Las Vegas', 'USA');

INSERT INTO airports (airport_id, airport_code, airport_name, city, country) VALUES (20, 'MCO', 'Orlando International Airport', 'Orlando', 'USA');

INSERT INTO airports (airport_id, airport_code, airport_name, city, country) VALUES (21, 'LHR', 'London Heathrow Airport', 'London', 'UK');

INSERT INTO airports (airport_id, airport_code, airport_name, city, country) VALUES (22, 'CDG', 'Charles de Gaulle Airport', 'Paris', 'France');

INSERT INTO airports (airport_id, airport_code, airport_name, city, country) VALUES (23, 'FRA', 'Frankfurt Airport', 'Frankfurt', 'Germany');

INSERT INTO airports (airport_id, airport_code, airport_name, city, country) VALUES (24, 'HND', 'Haneda Airport', 'Tokyo', 'Japan');

INSERT INTO airports (airport_id, airport_code, airport_name, city, country) VALUES (25, 'DXB', 'Dubai International Airport', 'Dubai', 'UAE');

INSERT INTO airports (airport_id, airport_code, airport_name, city, country) VALUES (26, 'SYD', 'Sydney Kingsford Smith Airport', 'Sydney', 'Australia');

INSERT INTO airports (airport_id, airport_code, airport_name, city, country) VALUES (27, 'AMS', 'Amsterdam Airport Schiphol', 'Amsterdam', 'Netherlands');

INSERT INTO airports (airport_id, airport_code, airport_name, city, country) VALUES (28, 'MUC', 'Munich Airport', 'Munich', 'Germany');

INSERT INTO airports (airport_id, airport_code, airport_name, city, country) VALUES (29, 'SIN', 'Singapore Changi Airport', 'Singapore', 'Singapore');

INSERT INTO airports (airport_id, airport_code, airport_name, city, country) VALUES (30, 'ICN', 'Incheon International Airport', 'Seoul', 'South Korea');

INSERT INTO airports (airport_id, airport_code, airport_name, city, country) VALUES (31, 'YYZ', 'Toronto Pearson International Airport', 'Toronto', 'Canada');

INSERT INTO airports (airport_id, airport_code, airport_name, city, country) VALUES (32, 'MIA', 'Miami International Airport', 'Miami', 'USA');

INSERT INTO airports (airport_id, airport_code, airport_name, city, country) VALUES (33, 'MAD', 'Adolfo Suárez Madrid–Barajas Airport', 'Madrid', 'Spain');

INSERT INTO airports (airport_id, airport_code, airport_name, city, country) VALUES (34, 'PEK', 'Beijing Capital International Airport', 'Beijing', 'China');

INSERT INTO airports (airport_id, airport_code, airport_name, city, country) VALUES (35, 'BKK', 'Suvarnabhumi Airport', 'Bangkok', 'Thailand');

INSERT INTO airports (airport_id, airport_code, airport_name, city, country) VALUES (36, 'DEL', 'Indira Gandhi International Airport', 'Delhi', 'India');

INSERT INTO airports (airport_id, airport_code, airport_name, city, country) VALUES (37, 'MEX', 'Mexico City International Airport', 'Mexico City', 'Mexico');

INSERT INTO airports (airport_id, airport_code, airport_name, city, country) VALUES (38, 'SCL', 'Arturo Merino Benítez International Airport', 'Santiago', 'Chile');

INSERT INTO airports (airport_id, airport_code, airport_name, city, country) VALUES (39, 'IST', 'Istanbul Airport', 'Istanbul', 'Turkey');

INSERT INTO airports (airport_id, airport_code, airport_name, city, country) VALUES (40, 'LIM', 'Jorge Chávez International Airport', 'Lima', 'Peru');

INSERT INTO airports (airport_id, airport_code, airport_name, city, country) VALUES (41, 'SVO', 'Sheremetyevo International Airport', 'Moscow', 'Russia');

INSERT INTO airports (airport_id, airport_code, airport_name, city, country) VALUES (42, 'JNB', 'O. R. Tambo International Airport', 'Johannesburg', 'South Africa');

INSERT INTO airports (airport_id, airport_code, airport_name, city, country) VALUES (43, 'CPT', 'Cape Town International Airport', 'Cape Town', 'South Africa');

INSERT INTO airports (airport_id, airport_code, airport_name, city, country) VALUES (44, 'AUH', 'Abu Dhabi International Airport', 'Abu Dhabi', 'UAE');

INSERT INTO airports (airport_id, airport_code, airport_name, city, country) VALUES (45, 'KUL', 'Kuala Lumpur International Airport', 'Kuala Lumpur', 'Malaysia');

INSERT INTO airports (airport_id, airport_code, airport_name, city, country) VALUES (46, 'CGK', 'Soekarno–Hatta International Airport', 'Jakarta', 'Indonesia');

INSERT INTO airports (airport_id, airport_code, airport_name, city, country) VALUES (47, 'BOM', 'Chhatrapati Shivaji Maharaj International Airport', 'Mumbai', 'India');

INSERT INTO airports (airport_id, airport_code, airport_name, city, country) VALUES (48, 'CAI', 'Cairo International Airport', 'Cairo', 'Egypt');

INSERT INTO airports (airport_id, airport_code, airport_name, city, country) VALUES (49, 'ATH', 'Athens International Airport', 'Athens', 'Greece');

INSERT INTO airports (airport_id, airport_code, airport_name, city, country) VALUES (50, 'BCN', 'Barcelona–El Prat Airport', 'Barcelona', 'Spain');

INSERT INTO routes (route_id, origin_airport_id, destination_airport_id) VALUES (11, 11, 12);

INSERT INTO routes (route_id, origin_airport_id, destination_airport_id) VALUES (12, 12, 11);

INSERT INTO routes (route_id, origin_airport_id, destination_airport_id) VALUES (13, 11, 13);

INSERT INTO routes (route_id, origin_airport_id, destination_airport_id) VALUES (14, 13, 11);

INSERT INTO routes (route_id, origin_airport_id, destination_airport_id) VALUES (15, 12, 13);

INSERT INTO routes (route_id, origin_airport_id, destination_airport_id) VALUES (16, 13, 12);

INSERT INTO routes (route_id, origin_airport_id, destination_airport_id) VALUES (17, 14, 15);

INSERT INTO routes (route_id, origin_airport_id, destination_airport_id) VALUES (18, 15, 14);

INSERT INTO routes (route_id, origin_airport_id, destination_airport_id) VALUES (19, 16, 17);

INSERT INTO routes (route_id, origin_airport_id, destination_airport_id) VALUES (20, 17, 16);

INSERT INTO routes (route_id, origin_airport_id, destination_airport_id) VALUES (21, 18, 19);

INSERT INTO routes (route_id, origin_airport_id, destination_airport_id) VALUES (22, 19, 18);

INSERT INTO routes (route_id, origin_airport_id, destination_airport_id) VALUES (23, 20, 2);

INSERT INTO routes (route_id, origin_airport_id, destination_airport_id) VALUES (24, 21, 20);

INSERT INTO routes (route_id, origin_airport_id, destination_airport_id) VALUES (25, 22, 23);

INSERT INTO routes (route_id, origin_airport_id, destination_airport_id) VALUES (26, 23, 22);

INSERT INTO routes (route_id, origin_airport_id, destination_airport_id) VALUES (27, 24, 25);

INSERT INTO routes (route_id, origin_airport_id, destination_airport_id) VALUES (28, 25, 24);

INSERT INTO routes (route_id, origin_airport_id, destination_airport_id) VALUES (29, 26, 27);

INSERT INTO routes (route_id, origin_airport_id, destination_airport_id) VALUES (30, 27, 26);

INSERT INTO flights (flight_id, airline_id, route_id, departure_time, arrival_time, capacity) VALUES (11, 1, 11, TO_TIMESTAMP('01-APR-24 08.00.00.000000 AM', 'DD-MON-YY HH12:MI:SS.FF6 AM'), TO_TIMESTAMP('01-APR-24 11.00.00.000000 AM', 'DD-MON-YY HH12:MI:SS.FF6 AM'), 200);

INSERT INTO flights (flight_id, airline_id, route_id, departure_time, arrival_time, capacity) VALUES (12, 2, 12, TO_TIMESTAMP('02-APR-24 10.00.00.000000 AM', 'DD-MON-YY HH12:MI:SS.FF6 AM'), TO_TIMESTAMP('02-APR-24 01.00.00.000000 PM', 'DD-MON-YY HH12:MI:SS.FF6 AM'), 180);

INSERT INTO flights (flight_id, airline_id, route_id, departure_time, arrival_time, capacity) VALUES (13, 1, 13, TO_TIMESTAMP('03-APR-24 12.00.00.000000 PM', 'DD-MON-YY HH12:MI:SS.FF6 PM'), TO_TIMESTAMP('03-APR-24 03.00.00.000000 PM', 'DD-MON-YY HH12:MI:SS.FF6 PM'), 220);

INSERT INTO flights (flight_id, airline_id, route_id, departure_time, arrival_time, capacity) VALUES (14, 3, 14, TO_TIMESTAMP('04-APR-24 02.00.00.000000 PM', 'DD-MON-YY HH12:MI:SS.FF6 PM'), TO_TIMESTAMP('04-APR-24 05.00.00.000000 PM', 'DD-MON-YY HH12:MI:SS.FF6 PM'), 150);

INSERT INTO flights (flight_id, airline_id, route_id, departure_time, arrival_time, capacity) VALUES (15, 2, 15, TO_TIMESTAMP('05-APR-24 04.00.00.000000 PM', 'DD-MON-YY HH12:MI:SS.FF6 PM'), TO_TIMESTAMP('05-APR-24 07.00.00.000000 PM', 'DD-MON-YY HH12:MI:SS.FF6 PM'), 190);

INSERT INTO flights (flight_id, airline_id, route_id, departure_time, arrival_time, capacity) VALUES (16, 3, 16, TO_TIMESTAMP('06-APR-24 06.00.00.000000 PM', 'DD-MON-YY HH12:MI:SS.FF6 PM'), TO_TIMESTAMP('06-APR-24 09.00.00.000000 PM', 'DD-MON-YY HH12:MI:SS.FF6 PM'), 210);

INSERT INTO flights (flight_id, airline_id, route_id, departure_time, arrival_time, capacity) VALUES (17, 4, 17, TO_TIMESTAMP('07-APR-24 08.00.00.000000 PM', 'DD-MON-YY HH12:MI:SS.FF6 PM'), TO_TIMESTAMP('07-APR-24 11.00.00.000000 PM', 'DD-MON-YY HH12:MI:SS.FF6 PM'), 230);

INSERT INTO flights (flight_id, airline_id, route_id, departure_time, arrival_time, capacity) VALUES (18, 5, 18, TO_TIMESTAMP('08-APR-24 10.00.00.000000 PM', 'DD-MON-YY HH12:MI:SS.FF6 PM'), TO_TIMESTAMP('09-APR-24 01.00.00.000000 AM', 'DD-MON-YY HH12:MI:SS.FF6 AM'), 240);

INSERT INTO flights (flight_id, airline_id, route_id, departure_time, arrival_time, capacity) VALUES (19, 6, 19, TO_TIMESTAMP('10-APR-24 12.00.00.000000 AM', 'DD-MON-YY HH12:MI:SS.FF6 AM'), TO_TIMESTAMP('10-APR-24 03.00.00.000000 AM', 'DD-MON-YY HH12:MI:SS.FF6 AM'), 180);

INSERT INTO flights (flight_id, airline_id, route_id, departure_time, arrival_time, capacity) VALUES (20, 7, 20, TO_TIMESTAMP('11-APR-24 02.00.00.000000 AM', 'DD-MON-YY HH12:MI:SS.FF6 AM'), TO_TIMESTAMP('11-APR-24 05.00.00.000000 AM', 'DD-MON-YY HH12:MI:SS.FF6 AM'), 220);

INSERT INTO flights (flight_id, airline_id, route_id, departure_time, arrival_time, capacity) VALUES (21, 8, 11, TO_TIMESTAMP('23-APR-24 08.00.00.000000 AM', 'DD-MON-YY HH12:MI:SS.FF6 AM'), TO_TIMESTAMP('23-APR-24 11.00.00.000000 AM', 'DD-MON-YY HH12:MI:SS.FF6 AM'), 200);

INSERT INTO flights (flight_id, airline_id, route_id, departure_time, arrival_time, capacity) VALUES (22, 9, 12, TO_TIMESTAMP('24-APR-24 10.00.00.000000 AM', 'DD-MON-YY HH12:MI:SS.FF6 AM'), TO_TIMESTAMP('24-APR-24 01.00.00.000000 PM', 'DD-MON-YY HH12:MI:SS.FF6 PM'), 180);

INSERT INTO flights (flight_id, airline_id, route_id, departure_time, arrival_time, capacity) VALUES (23, 10, 13, TO_TIMESTAMP('25-APR-24 12.00.00.000000 PM', 'DD-MON-YY HH12:MI:SS.FF6 PM'), TO_TIMESTAMP('25-APR-24 03.00.00.000000 PM', 'DD-MON-YY HH12:MI:SS.FF6 PM'), 220);

INSERT INTO flights (flight_id, airline_id, route_id, departure_time, arrival_time, capacity) VALUES (24, 1, 14, TO_TIMESTAMP('26-APR-24 02.00.00.000000 PM', 'DD-MON-YY HH12:MI:SS.FF6 PM'), TO_TIMESTAMP('26-APR-24 05.00.00.000000 PM', 'DD-MON-YY HH12:MI:SS.FF6 PM'), 150);

INSERT INTO flights (flight_id, airline_id, route_id, departure_time, arrival_time, capacity) VALUES (25, 2, 15, TO_TIMESTAMP('27-APR-24 04.00.00.000000 PM', 'DD-MON-YY HH12:MI:SS.FF6 PM'), TO_TIMESTAMP('27-APR-24 07.00.00.000000 PM', 'DD-MON-YY HH12:MI:SS.FF6 PM'), 190);

INSERT INTO flights (flight_id, airline_id, route_id, departure_time, arrival_time, capacity) VALUES (26, 3, 16, TO_TIMESTAMP('28-APR-24 06.00.00.000000 PM', 'DD-MON-YY HH12:MI:SS.FF6 PM'), TO_TIMESTAMP('28-APR-24 09.00.00.000000 PM', 'DD-MON-YY HH12:MI:SS.FF6 PM'), 210);

INSERT INTO flights (flight_id, airline_id, route_id, departure_time, arrival_time, capacity) VALUES (27, 4, 17, TO_TIMESTAMP('29-APR-24 08.00.00.000000 PM', 'DD-MON-YY HH12:MI:SS.FF6 PM'), TO_TIMESTAMP('29-APR-24 11.00.00.000000 PM', 'DD-MON-YY HH12:MI:SS.FF6 PM'), 230);

INSERT INTO flights (flight_id, airline_id, route_id, departure_time, arrival_time, capacity) VALUES (28, 5, 18, TO_TIMESTAMP('30-APR-24 10.00.00.000000 PM', 'DD-MON-YY HH12:MI:SS.FF6 PM'), TO_TIMESTAMP('01-MAY-24 01.00.00.000000 AM', 'DD-MON-YY HH12:MI:SS.FF6 AM'), 240);

INSERT INTO flights (flight_id, airline_id, route_id, departure_time, arrival_time, capacity) VALUES (29, 6, 19, TO_TIMESTAMP('01-MAY-24 12.00.00.000000 AM', 'DD-MON-YY HH12:MI:SS.FF6 AM'), TO_TIMESTAMP('01-MAY-24 03.00.00.000000 AM', 'DD-MON-YY HH12:MI:SS.FF6 AM'), 180);

INSERT INTO flights (flight_id, airline_id, route_id, departure_time, arrival_time, capacity) VALUES (30, 7, 20, TO_TIMESTAMP('02-MAY-24 02.00.00.000000 AM', 'DD-MON-YY HH12:MI:SS.FF6 AM'), TO_TIMESTAMP('02-MAY-24 05.00.00.000000 AM', 'DD-MON-YY HH12:MI:SS.FF6 AM'), 220);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (11, 'William Miller', 'william.miller@example.com', '2345678901', 80);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (12, 'Emma Moore', 'emma.moore@example.com', '8901234567', 95);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (13, 'Alexander Wilson', 'alexander.wilson@example.com', '3456789012', 120);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (14, 'Ava Taylor', 'ava.taylor@example.com', '9012345678', 70);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (15, 'Noah Thomas', 'noah.thomas@example.com', '4567890123', 105);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (16, 'Mia Jackson', 'mia.jackson@example.com', '7890123456', 135);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (17, 'Ethan White', 'ethan.white@example.com', '5678901234', 85);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (18, 'Isabella Harris', 'isabella.harris@example.com', '1234567890', 150);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (19, 'Liam Martin', 'liam.martin@example.com', '8901234567', 110);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (20, 'Charlotte Garcia', 'charlotte.garcia@example.com', '2345678901', 125);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (21, 'Amelia Martinez', 'amelia.martinez@example.com', '6789012345', 95);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (22, 'Benjamin Lee', 'benjamin.lee@example.com', '8901234567', 130);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (23, 'Evelyn Rodriguez', 'evelyn.rodriguez@example.com', '3456789012', 75);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (24, 'William Moore', 'william.moore@example.com', '9012345678', 100);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (25, 'Harper Perez', 'harper.perez@example.com', '4567890123', 80);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (26, 'Michael Walker', 'michael.walker@example.com', '7890123456', 90);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (27, 'Sophia Lewis', 'sophia.lewis@example.com', '5678901234', 115);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (28, 'James Young', 'james.young@example.com', '1234567890', 140);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (29, 'Ella Scott', 'ella.scott@example.com', '8901234567', 105);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (30, 'Alexander King', 'alexander.king@example.com', '2345678901', 75);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (31, 'Mia Wright', 'mia.wright@example.com', '6789012345', 95);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (32, 'William Lewis', 'william.lewis@example.com', '8901234567', 105);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (33, 'Ava Hill', 'ava.hill@example.com', '3456789012', 110);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (34, 'Liam Green', 'liam.green@example.com', '9012345678', 115);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (35, 'Charlotte Adams', 'charlotte.adams@example.com', '4567890123', 120);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (36, 'Oliver Baker', 'oliver.baker@example.com', '7890123456', 125);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (37, 'Amelia Cook', 'amelia.cook@example.com', '5678901234', 130);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (38, 'Benjamin Murphy', 'benjamin.murphy@example.com', '1234567890', 135);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (39, 'Sophia Turner', 'sophia.turner@example.com', '8901234567', 140);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (40, 'Ethan Carter', 'ethan.carter@example.com', '2345678901', 145);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (41, 'Isabella Parker', 'isabella.parker@example.com', '6789012345', 150);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (42, 'Lucas Morris', 'lucas.morris@example.com', '8901234567', 155);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (43, 'Ella Hall', 'ella.hall@example.com', '3456789012', 160);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (44, 'Jackson Ward', 'jackson.ward@example.com', '9012345678', 165);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (45, 'Madison Turner', 'madison.turner@example.com', '4567890123', 170);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (46, 'Sebastian Harris', 'sebastian.harris@example.com', '7890123456', 175);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (47, 'Avery Brooks', 'avery.brooks@example.com', '5678901234', 180);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (48, 'Aria Watson', 'aria.watson@example.com', '1234567890', 185);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (49, 'Grayson Sanders', 'grayson.sanders@example.com', '8901234567', 190);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (50, 'Luna James', 'luna.james@example.com', '2345678901', 195);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (51, 'Jack Evans', 'jack.evans@example.com', '6789012345', 200);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (52, 'Scarlett Clark', 'scarlett.clark@example.com', '8901234567', 205);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (53, 'Leo Turner', 'leo.turner@example.com', '3456789012', 210);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (54, 'Lucy Walker', 'lucy.walker@example.com', '9012345678', 215);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (55, 'Mason Scott', 'mason.scott@example.com', '4567890123', 220);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (56, 'Harper Perez', 'harper.perez@example.com', '7890123456', 225);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (57, 'Evelyn Rodriguez', 'evelyn.rodriguez@example.com', '5678901234', 230);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (58, 'Logan Lee', 'logan.lee@example.com', '1234567890', 235);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (59, 'Avery Green', 'avery.green@example.com', '8901234567', 240);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (60, 'Addison Martinez', 'addison.martinez@example.com', '2345678901', 245);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (61, 'Elijah Carter', 'elijah.carter@example.com', '6789012345', 250);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (62, 'Amelia Ward', 'amelia.ward@example.com', '8901234567', 255);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (63, 'Abigail Cooper', 'abigail.cooper@example.com', '3456789012', 260);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (64, 'Michael Diaz', 'michael.diaz@example.com', '9012345678', 265);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (65, 'Evelyn Richardson', 'evelyn.richardson@example.com', '4567890123', 270);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (66, 'Benjamin Morris', 'benjamin.morris@example.com', '7890123456', 275);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (67, 'Emily Murphy', 'emily.murphy@example.com', '5678901234', 280);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (68, 'Daniel Reed', 'daniel.reed@example.com', '1234567890', 285);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (69, 'Mia Hall', 'mia.hall@example.com', '8901234567', 290);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (70, 'Henry Hill', 'henry.hill@example.com', '2345678901', 295);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (71, 'Charlotte Price', 'charlotte.price@example.com', '6789012345', 300);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (72, 'Lucas Watson', 'lucas.watson@example.com', '8901234567', 305);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (73, 'Alexander Brooks', 'alexander.brooks@example.com', '3456789012', 310);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (74, 'Elizabeth Sanders', 'elizabeth.sanders@example.com', '9012345678', 315);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (75, 'Aiden Wood', 'aiden.wood@example.com', '4567890123', 320);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (76, 'Leah Rogers', 'leah.rogers@example.com', '7890123456', 325);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (77, 'Samuel Patterson', 'samuel.patterson@example.com', '5678901234', 330);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (78, 'Ava Cooper', 'ava.cooper@example.com', '1234567890', 335);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (79, 'Matthew Flores', 'matthew.flores@example.com', '8901234567', 340);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (80, 'Nora Diaz', 'nora.diaz@example.com', '2345678901', 345);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (81, 'Ethan Henderson', 'ethan.henderson@example.com', '6789012345', 350);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (82, 'Madison Simmons', 'madison.simmons@example.com', '8901234567', 355);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (83, 'Liam Perry', 'liam.perry@example.com', '3456789012', 360);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (84, 'Grace Long', 'grace.long@example.com', '9012345678', 365);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (85, 'Jackson Rivera', 'jackson.rivera@example.com', '4567890123', 370);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (86, 'Chloe Richardson', 'chloe.richardson@example.com', '7890123456', 375);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (87, 'Sebastian Wood', 'sebastian.wood@example.com', '5678901234', 380);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (88, 'Lily Patel', 'lily.patel@example.com', '1234567890', 385);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (89, 'Christopher Sanders', 'christopher.sanders@example.com', '8901234567', 390);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (90, 'Zoe Flores', 'zoe.flores@example.com', '2345678901', 395);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (91, 'Ryan Hughes', 'ryan.hughes@example.com', '6789012345', 400);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (92, 'Ella Richardson', 'ella.richardson@example.com', '8901234567', 405);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (93, 'Nathan Morgan', 'nathan.morgan@example.com', '3456789012', 410);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (94, 'Aubrey Campbell', 'aubrey.campbell@example.com', '9012345678', 415);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (95, 'Aiden Simmons', 'aiden.simmons@example.com', '4567890123', 420);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (96, 'Hannah King', 'hannah.king@example.com', '7890123456', 425);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (97, 'Dylan Parker', 'dylan.parker@example.com', '5678901234', 430);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (98, 'Avery White', 'avery.white@example.com', '1234567890', 435);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (99, 'Mia Thomas', 'mia.thomas@example.com', '8901234567', 440);

INSERT INTO passengers (passenger_id, name, email, phone, loyalty_points) VALUES (100, 'Carter Green', 'carter.green@example.com', '2345678901', 445);

ALTER TABLE bookings 
ADD Amount_paid DECIMAL(10, 2);

select * from bookings;

UPDATE BOOKINGS 
SET AMOUNT_PAID = ROUND(DBMS_RANDOM.VALUE(2000, 50000), 2);

select * from bookings;

select * from bookings;

select * from passengers;

select * from bookings;

INSERT INTO Bookings VALUES (11, 20, 20, TO_TIMESTAMP('2023-07-11 09:43:45', 'YYYY-MM-DD HH24:MI:SS'), 'First Class', 34163.39);

INSERT INTO Bookings VALUES (12, 27, 92, TO_TIMESTAMP('2023-03-07 19:51:47', 'YYYY-MM-DD HH24:MI:SS'), 'Business', 17106.92);

INSERT INTO Bookings VALUES (13, 21, 9, TO_TIMESTAMP('2023-05-23 14:25:34', 'YYYY-MM-DD HH24:MI:SS'), 'Business', 17987.17);

INSERT INTO Bookings VALUES (14, 19, 2, TO_TIMESTAMP('2023-06-19 09:19:25', 'YYYY-MM-DD HH24:MI:SS'), 'First Class', 22782.59);

INSERT INTO Bookings VALUES (15, 11, 79, TO_TIMESTAMP('2023-04-18 14:54:44', 'YYYY-MM-DD HH24:MI:SS'), 'First Class', 26804.91);

INSERT INTO Bookings VALUES (16, 5, 78, TO_TIMESTAMP('2023-07-25 09:21:13', 'YYYY-MM-DD HH24:MI:SS'), 'Economy', 39255.11);

INSERT INTO Bookings VALUES (17, 16, 74, TO_TIMESTAMP('2023-10-18 05:20:59', 'YYYY-MM-DD HH24:MI:SS'), 'First Class', 49382.59);

INSERT INTO Bookings VALUES (18, 18, 79, TO_TIMESTAMP('2023-04-17 03:07:11', 'YYYY-MM-DD HH24:MI:SS'), 'First Class', 15378.56);

INSERT INTO Bookings VALUES (19, 17, 98, TO_TIMESTAMP('2023-01-11 04:38:01', 'YYYY-MM-DD HH24:MI:SS'), 'Economy', 14180.55);

INSERT INTO Bookings VALUES (20, 30, 9, TO_TIMESTAMP('2023-09-17 01:59:23', 'YYYY-MM-DD HH24:MI:SS'), 'First Class', 41055.08);

INSERT INTO Bookings VALUES (21, 20, 91, TO_TIMESTAMP('2023-05-11 20:11:28', 'YYYY-MM-DD HH24:MI:SS'), 'First Class', 49343.81);

INSERT INTO Bookings VALUES (22, 29, 6, TO_TIMESTAMP('2023-03-23 23:20:05', 'YYYY-MM-DD HH24:MI:SS'), 'Economy', 10762.44);

INSERT INTO Bookings VALUES (23, 21, 87, TO_TIMESTAMP('2023-09-04 00:11:32', 'YYYY-MM-DD HH24:MI:SS'), 'Business', 24339.65);

INSERT INTO Bookings VALUES (24, 18, 33, TO_TIMESTAMP('2023-09-05 11:25:26', 'YYYY-MM-DD HH24:MI:SS'), 'Business', 31853.96);

INSERT INTO Bookings VALUES (25, 4, 24, TO_TIMESTAMP('2023-10-06 01:03:05', 'YYYY-MM-DD HH24:MI:SS'), 'First Class', 44542.56);

INSERT INTO Bookings VALUES (26, 22, 57, TO_TIMESTAMP('2023-03-23 14:36:29', 'YYYY-MM-DD HH24:MI:SS'), 'First Class', 4533.87);

INSERT INTO Bookings VALUES (27, 1, 7, TO_TIMESTAMP('2024-01-01 05:48:28', 'YYYY-MM-DD HH24:MI:SS'), 'First Class', 44054.52);

INSERT INTO Bookings VALUES (28, 4, 22, TO_TIMESTAMP('2023-02-02 21:14:23', 'YYYY-MM-DD HH24:MI:SS'), 'First Class', 7626.26);

INSERT INTO Bookings VALUES (29, 20, 16, TO_TIMESTAMP('2023-06-30 22:26:25', 'YYYY-MM-DD HH24:MI:SS'), 'Economy', 2374.25);

INSERT INTO Bookings VALUES (30, 14, 51, TO_TIMESTAMP('2023-05-01 02:51:06', 'YYYY-MM-DD HH24:MI:SS'), 'First Class', 23790.74);

INSERT INTO Bookings VALUES (31, 28, 16, TO_TIMESTAMP('2023-07-02 15:40:47', 'YYYY-MM-DD HH24:MI:SS'), 'First Class', 29776.31);

INSERT INTO Bookings VALUES (32, 25, 55, TO_TIMESTAMP('2023-05-30 04:53:41', 'YYYY-MM-DD HH24:MI:SS'), 'Business', 9719.89);

INSERT INTO Bookings VALUES (33, 8, 59, TO_TIMESTAMP('2023-10-17 13:52:23', 'YYYY-MM-DD HH24:MI:SS'), 'Business', 10244.64);

INSERT INTO Bookings VALUES (34, 15, 45, TO_TIMESTAMP('2023-09-11 01:07:16', 'YYYY-MM-DD HH24:MI:SS'), 'Business', 12131.06);

INSERT INTO Bookings VALUES (35, 9, 95, TO_TIMESTAMP('2023-03-18 02:45:25', 'YYYY-MM-DD HH24:MI:SS'), 'Economy', 24014.52);

INSERT INTO Bookings VALUES (36, 18, 14, TO_TIMESTAMP('2023-12-12 16:14:02', 'YYYY-MM-DD HH24:MI:SS'), 'Business', 18453.87);

INSERT INTO Bookings VALUES (37, 21, 55, TO_TIMESTAMP('2023-09-08 20:22:04', 'YYYY-MM-DD HH24:MI:SS'), 'Business', 42381.52);

INSERT INTO Bookings VALUES (38, 21, 95, TO_TIMESTAMP('2023-12-27 16:04:49', 'YYYY-MM-DD HH24:MI:SS'), 'Business', 39920.82);

INSERT INTO Bookings VALUES (39, 17, 90, TO_TIMESTAMP('2023-03-25 11:19:32', 'YYYY-MM-DD HH24:MI:SS'), 'First Class', 26175.65);

INSERT INTO Bookings VALUES (40, 23, 47, TO_TIMESTAMP('2023-04-29 20:01:03', 'YYYY-MM-DD HH24:MI:SS'), 'Business', 40108.41);

INSERT INTO Bookings VALUES (41, 10, 3, TO_TIMESTAMP('2023-04-18 20:42:24', 'YYYY-MM-DD HH24:MI:SS'), 'Business', 14621.52);

INSERT INTO Bookings VALUES (42, 17, 31, TO_TIMESTAMP('2023-10-17 19:10:28', 'YYYY-MM-DD HH24:MI:SS'), 'Economy', 22476.06);

INSERT INTO Bookings VALUES (43, 9, 16, TO_TIMESTAMP('2023-05-15 12:04:07', 'YYYY-MM-DD HH24:MI:SS'), 'First Class', 16980.32);

INSERT INTO Bookings VALUES (44, 20, 62, TO_TIMESTAMP('2023-12-13 22:59:39', 'YYYY-MM-DD HH24:MI:SS'), 'Economy', 38744.34);

INSERT INTO Bookings VALUES (45, 18, 5, TO_TIMESTAMP('2023-03-21 05:52:04', 'YYYY-MM-DD HH24:MI:SS'), 'Economy', 49744.83);

INSERT INTO Bookings VALUES (46, 28, 47, TO_TIMESTAMP('2023-12-18 23:27:03', 'YYYY-MM-DD HH24:MI:SS'), 'Business', 38670.68);

INSERT INTO Bookings VALUES (47, 20, 7, TO_TIMESTAMP('2023-02-08 14:59:54', 'YYYY-MM-DD HH24:MI:SS'), 'Business', 4553.33);

INSERT INTO Bookings VALUES (48, 27, 87, TO_TIMESTAMP('2023-10-09 19:00:58', 'YYYY-MM-DD HH24:MI:SS'), 'Business', 29913.96);

INSERT INTO Bookings VALUES (49, 26, 61, TO_TIMESTAMP('2023-01-20 21:14:59', 'YYYY-MM-DD HH24:MI:SS'), 'Business', 44578.5);

INSERT INTO Bookings VALUES (50, 11, 9, TO_TIMESTAMP('2023-04-19 00:28:48', 'YYYY-MM-DD HH24:MI:SS'), 'Economy', 5615.53);

INSERT INTO Bookings VALUES (51, 4, 42, TO_TIMESTAMP('2023-03-24 08:42:46', 'YYYY-MM-DD HH24:MI:SS'), 'Economy', 20128.63);

INSERT INTO Bookings VALUES (52, 26, 19, TO_TIMESTAMP('2023-03-03 23:54:47', 'YYYY-MM-DD HH24:MI:SS'), 'Economy', 7578.15);

INSERT INTO Bookings VALUES (53, 8, 9, TO_TIMESTAMP('2023-01-08 05:49:51', 'YYYY-MM-DD HH24:MI:SS'), 'Business', 34585.5);

INSERT INTO Bookings VALUES (54, 22, 69, TO_TIMESTAMP('2023-11-30 15:29:46', 'YYYY-MM-DD HH24:MI:SS'), 'Business', 37540.19);

INSERT INTO Bookings VALUES (55, 12, 67, TO_TIMESTAMP('2023-01-24 21:43:55', 'YYYY-MM-DD HH24:MI:SS'), 'Business', 21366.15);

INSERT INTO Bookings VALUES (56, 20, 93, TO_TIMESTAMP('2023-07-26 19:53:25', 'YYYY-MM-DD HH24:MI:SS'), 'First Class', 26224.32);

INSERT INTO Bookings VALUES (57, 6, 68, TO_TIMESTAMP('2023-09-17 00:20:42', 'YYYY-MM-DD HH24:MI:SS'), 'Economy', 40296.24);

INSERT INTO Bookings VALUES (58, 12, 59, TO_TIMESTAMP('2023-05-06 07:10:26', 'YYYY-MM-DD HH24:MI:SS'), 'Business', 48172.37);

INSERT INTO Bookings VALUES (59, 23, 68, TO_TIMESTAMP('2023-04-02 17:00:07', 'YYYY-MM-DD HH24:MI:SS'), 'First Class', 8120.81);

INSERT INTO Bookings VALUES (60, 10, 13, TO_TIMESTAMP('2023-04-07 01:33:58', 'YYYY-MM-DD HH24:MI:SS'), 'First Class', 47836.39);

INSERT INTO Bookings VALUES (61, 16, 79, TO_TIMESTAMP('2023-09-19 00:44:20', 'YYYY-MM-DD HH24:MI:SS'), 'Economy', 4435.05);

INSERT INTO Bookings VALUES (62, 15, 59, TO_TIMESTAMP('2023-05-26 21:48:59', 'YYYY-MM-DD HH24:MI:SS'), 'Economy', 9503.1);

INSERT INTO Bookings VALUES (63, 12, 30, TO_TIMESTAMP('2023-05-12 15:41:48', 'YYYY-MM-DD HH24:MI:SS'), 'First Class', 11831.53);

INSERT INTO Bookings VALUES (64, 11, 23, TO_TIMESTAMP('2023-10-16 15:42:31', 'YYYY-MM-DD HH24:MI:SS'), 'Economy', 18855.84);

INSERT INTO Bookings VALUES (65, 7, 39, TO_TIMESTAMP('2023-02-12 13:56:24', 'YYYY-MM-DD HH24:MI:SS'), 'First Class', 41498.23);

INSERT INTO Bookings VALUES (66, 18, 23, TO_TIMESTAMP('2023-06-30 13:23:06', 'YYYY-MM-DD HH24:MI:SS'), 'First Class', 22175.42);

INSERT INTO Bookings VALUES (67, 8, 53, TO_TIMESTAMP('2023-07-06 21:29:32', 'YYYY-MM-DD HH24:MI:SS'), 'First Class', 49062.11);

INSERT INTO Bookings VALUES (68, 7, 56, TO_TIMESTAMP('2023-10-24 08:34:54', 'YYYY-MM-DD HH24:MI:SS'), 'Economy', 9450.85);

INSERT INTO Bookings VALUES (69, 23, 49, TO_TIMESTAMP('2023-12-25 20:19:31', 'YYYY-MM-DD HH24:MI:SS'), 'Business', 39701.93);

INSERT INTO Bookings VALUES (70, 28, 1, TO_TIMESTAMP('2023-07-04 20:38:33', 'YYYY-MM-DD HH24:MI:SS'), 'First Class', 44590.37);

INSERT INTO Bookings VALUES (71, 28, 40, TO_TIMESTAMP('2023-08-18 00:05:19', 'YYYY-MM-DD HH24:MI:SS'), 'Business', 22321.04);

INSERT INTO Bookings VALUES (72, 2, 13, TO_TIMESTAMP('2023-03-09 23:13:12', 'YYYY-MM-DD HH24:MI:SS'), 'First Class', 45131.97);

INSERT INTO Bookings VALUES (73, 2, 34, TO_TIMESTAMP('2023-01-02 10:36:45', 'YYYY-MM-DD HH24:MI:SS'), 'Economy', 2818.19);

INSERT INTO Bookings VALUES (74, 24, 42, TO_TIMESTAMP('2023-10-30 18:30:07', 'YYYY-MM-DD HH24:MI:SS'), 'First Class', 24526.02);

INSERT INTO Bookings VALUES (75, 14, 4, TO_TIMESTAMP('2023-04-01 07:23:43', 'YYYY-MM-DD HH24:MI:SS'), 'Economy', 32857.09);

INSERT INTO Bookings VALUES (76, 13, 34, TO_TIMESTAMP('2023-07-21 01:57:26', 'YYYY-MM-DD HH24:MI:SS'), 'First Class', 12812.35);

INSERT INTO Bookings VALUES (77, 16, 30, TO_TIMESTAMP('2023-03-17 09:40:28', 'YYYY-MM-DD HH24:MI:SS'), 'First Class', 35303.37);

INSERT INTO Bookings VALUES (78, 13, 59, TO_TIMESTAMP('2023-03-08 07:52:34', 'YYYY-MM-DD HH24:MI:SS'), 'First Class', 33438.91);

INSERT INTO Bookings VALUES (79, 2, 51, TO_TIMESTAMP('2023-07-24 03:56:41', 'YYYY-MM-DD HH24:MI:SS'), 'Business', 4285.26);

INSERT INTO Bookings VALUES (80, 20, 67, TO_TIMESTAMP('2023-05-07 16:22:24', 'YYYY-MM-DD HH24:MI:SS'), 'Business', 42914.58);

INSERT INTO Bookings VALUES (81, 12, 14, TO_TIMESTAMP('2023-03-17 00:16:55', 'YYYY-MM-DD HH24:MI:SS'), 'First Class', 8286.9);

INSERT INTO Bookings VALUES (82, 26, 71, TO_TIMESTAMP('2023-01-25 10:56:36', 'YYYY-MM-DD HH24:MI:SS'), 'Business', 4505.78);

INSERT INTO Bookings VALUES (83, 23, 31, TO_TIMESTAMP('2023-08-05 17:04:16', 'YYYY-MM-DD HH24:MI:SS'), 'Economy', 45670.38);

INSERT INTO Bookings VALUES (84, 20, 45, TO_TIMESTAMP('2023-07-18 00:50:08', 'YYYY-MM-DD HH24:MI:SS'), 'First Class', 17062.03);

INSERT INTO Bookings VALUES (85, 12, 9, TO_TIMESTAMP('2023-09-11 03:18:40', 'YYYY-MM-DD HH24:MI:SS'), 'Business', 9593.4);

INSERT INTO Bookings VALUES (86, 18, 28, TO_TIMESTAMP('2023-03-13 04:54:24', 'YYYY-MM-DD HH24:MI:SS'), 'Business', 44064.22);

INSERT INTO Bookings VALUES (87, 30, 99, TO_TIMESTAMP('2023-04-23 07:20:09', 'YYYY-MM-DD HH24:MI:SS'), 'Economy', 38808.47);

INSERT INTO Bookings VALUES (88, 7, 13, TO_TIMESTAMP('2023-08-07 22:04:50', 'YYYY-MM-DD HH24:MI:SS'), 'Business', 28833.69);

INSERT INTO Bookings VALUES (89, 7, 52, TO_TIMESTAMP('2023-08-15 17:57:32', 'YYYY-MM-DD HH24:MI:SS'), 'Business', 4717.21);

INSERT INTO Bookings VALUES (90, 9, 50, TO_TIMESTAMP('2023-09-13 03:59:54', 'YYYY-MM-DD HH24:MI:SS'), 'First Class', 13370.33);

INSERT INTO Bookings VALUES (91, 14, 78, TO_TIMESTAMP('2023-01-19 14:14:53', 'YYYY-MM-DD HH24:MI:SS'), 'Business', 16696.57);

INSERT INTO Bookings VALUES (92, 21, 100, TO_TIMESTAMP('2023-07-05 22:12:53', 'YYYY-MM-DD HH24:MI:SS'), 'First Class', 2377.35);

INSERT INTO Bookings VALUES (93, 6, 9, TO_TIMESTAMP('2023-10-14 20:19:12', 'YYYY-MM-DD HH24:MI:SS'), 'Economy', 24321.14);

INSERT INTO Bookings VALUES (94, 9, 41, TO_TIMESTAMP('2023-10-21 14:15:37', 'YYYY-MM-DD HH24:MI:SS'), 'Business', 10825.03);

INSERT INTO Bookings VALUES (95, 10, 49, TO_TIMESTAMP('2023-06-13 03:08:54', 'YYYY-MM-DD HH24:MI:SS'), 'First Class', 4486.1);

INSERT INTO Bookings VALUES (96, 9, 77, TO_TIMESTAMP('2023-04-04 22:13:23', 'YYYY-MM-DD HH24:MI:SS'), 'First Class', 2662.22);

INSERT INTO Bookings VALUES (97, 18, 73, TO_TIMESTAMP('2023-08-26 05:35:57', 'YYYY-MM-DD HH24:MI:SS'), 'First Class', 28747.97);

INSERT INTO Bookings VALUES (98, 5, 83, TO_TIMESTAMP('2023-05-13 18:42:45', 'YYYY-MM-DD HH24:MI:SS'), 'Economy', 21125.78);

INSERT INTO Bookings VALUES (99, 3, 92, TO_TIMESTAMP('2023-10-27 12:13:56', 'YYYY-MM-DD HH24:MI:SS'), 'First Class', 34480.28);

INSERT INTO Bookings VALUES (100, 25, 27, TO_TIMESTAMP('2023-02-20 19:34:27', 'YYYY-MM-DD HH24:MI:SS'), 'Business', 12052.37);
