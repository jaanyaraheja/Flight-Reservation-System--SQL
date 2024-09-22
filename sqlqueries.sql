-- Q1)How many available seats are left for each flight?
SELECT  
    flight_id, 
    capacity - (SELECT COUNT(*) FROM Bookings WHERE Flights.flight_id = Bookings.flight_id) AS available_seats 
FROM  
    Flights;

-- Q2)What are the booking details (class, departure time, and arrival time) for passenger ID 5?
SELECT  
    booking_id, 
    class, 
    departure_time, 
    arrival_time 
FROM  
    Bookings 
JOIN  
    Flights ON Bookings.flight_id = Flights.flight_id 
WHERE  
    passenger_id =5;

--Q3)How can we handle flight cancellation?
ALTER TABLE Flights ADD status VARCHAR2(20);
UPDATE Flights 
SET status = 'Cancelled' 
WHERE flight_id =2;

--Q5)What are the passenger IDs, names, and loyalty points for all passengers?
SELECT passenger_id, name, loyalty_points 
FROM Passengers;

--Q6)Handle Overbooking Situation and prioritize passenger upgrades based on loyalty.
UPDATE  
Bookings 
SET  
class = 'Business' 
WHERE  
passenger_id IN ( 
SELECT  
passenger_id 
FROM  
Bookings 
WHERE  
flight_id = 4 
AND class = 'Economy' 
AND passenger_id IN ( 
SELECT  
passenger_id 
FROM  
Passengers 
WHERE  
loyalty_points >= 150 
) 
);

--Q8)Query to find total number of bookings for each fligh.
SELECT flights.flight_id, flights.departure_time, COUNT(bookings.booking_id) AS total_bookings 
FROM Flights 
LEFT JOIN Bookings ON flights.flight_id = bookings.flight_id 
GROUP BY flights.flight_id, flights.departure_time, flights.arrival_time;

--Q9)Calculate the average loyalty points earned per passenger
SELECT AVG(loyalty_points) AS avg_loyalty_points 
FROM Passengers;

--Q10)Find the Most popular destination airport.
SELECT airports.airport_name, COUNT(flights.route_id) AS total_flights 
FROM Flights  
JOIN Routes ON flights.route_id = routes.route_id 
JOIN Airports ON routes.destination_airport_id = airports.airport_id 
GROUP BY airports.airport_name 
ORDER BY total_flights DESC 
FETCH FIRST 1 ROW ONLY;

--Q11)Calculate the number of flights by Airline.
SELECT Airlines.airline_name, COUNT(Flights.flight_id) AS total_flights 
FROM Flights 
JOIN Airlines ON Flights.airline_id = Airlines.airline_id 
GROUP BY Airlines.airline_name;

--Q12)Find total revenue of each airline
SELECT Airlines.AIRLINE_ID, 
       Airlines.AIRLINE_NAME, 
       SUM(Bookings.AMOUNT_PAID) AS TOTAL_REVENUE 
FROM FLIGHTS 
JOIN BOOKINGS ON Flights.FLIGHT_ID = Bookings.FLIGHT_ID 
JOIN AIRLINES ON Flights.AIRLINE_ID = Airlines.AIRLINE_ID 
GROUP BY Airlines.AIRLINE_ID, Airlines.AIRLINE_NAME;

--Q13)Find the most booked flight
SELECT flight_id, COUNT(*) AS num_bookings 
FROM Bookings 
GROUP BY flight_id 
ORDER BY num_bookings DESC 
Fetch first 1 row only;
