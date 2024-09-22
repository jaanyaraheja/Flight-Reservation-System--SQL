# Flight-Reservation-System--SQL
This project implements an Airline Management System using SQL to manage airline operations such as airlines, airports, routes, flights, passengers, and bookings. It is designed to ensure efficient and organized management of airline data and transactions, with each entity related to the system's core components.

Features
Manage Airlines with loyalty program information.
Store and manage Airports across various cities and countries.
Define Routes between origin and destination airports.
Manage Flights with details like departure and arrival times.
Track Passengers with personal details and loyalty points.
Manage Bookings for flights, including class and timestamp information.
Database Schema
1. Airlines Table  
   airline_id: NUMBER(10)  
     Primary key (unique airline identifier)  
   airline_name: VARCHAR2(255)  
     Name of the airline (required)  
   loyalty_program_enabled: CHAR(1)  
     'Y' for yes, 'N' for no (required)  
   
3. Airports Table  
   airport_id: NUMBER(10)  
     Primary key (unique airport identifier)  
   airport_code: VARCHAR2(3)  
     3-character airport code (e.g., LAX)  
   airport_name: VARCHAR2(255)  
     Full name of the airport  
   city: VARCHAR2(255)  
     City where the airport is located  
   country: VARCHAR2(255)  
     Country where the airport is located  
   
4. Routes Table  
   route_id: NUMBER(10)  
     Primary key (unique route identifier)  
   origin_airport_id: NUMBER(10)  
     Foreign key referencing airport_id in Airports (origin)  
   destination_airport_id: NUMBER(10)  
     Foreign key referencing airport_id in Airports (destination)  
   
5. Flights Table  
   flight_id: NUMBER(10)  
     Primary key (unique flight identifier)  
   airline_id: NUMBER(10)  
     Foreign key referencing airline_id in Airlines  
   route_id: NUMBER(10)  
     Foreign key referencing route_id in Routes  
   departure_time: TIMESTAMP  
     Departure time of the flight  
   arrival_time: TIMESTAMP  
     Arrival time of the flight  
   capacity: NUMBER(5)  
     Maximum capacity of the flight  
   
6. Passengers Table  
   passenger_id: NUMBER(10)  
     Primary key (unique passenger identifier)  
   name: VARCHAR2(255)  
     Passenger's name  
   email: VARCHAR2(255)  
     Passenger's email address  
   phone: VARCHAR2(20)  
     Passenger's phone number  
   loyalty_points: NUMBER(5)  
     Loyalty points accumulated by the passenger (default: 0)  
   
7. Bookings Table  
    booking_id: NUMBER(10)  
      Primary key (unique booking identifier)  
    flight_id: NUMBER(10)  
      Foreign key referencing flight_id in Flights  
    passenger_id: NUMBER(10)  
      Foreign key referencing passenger_id in Passengers  
    booking_date: TIMESTAMP  
      Date and time of booking  
    class: VARCHAR2(20)  
      Flight class (e.g., Economy, Business)  

Prerequisites  
Oracle Database (or any compatible SQL database)  
SQL client or command-line interface (CLI)
