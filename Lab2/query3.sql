-- Aaron Chan - aahchan
-- Lab2
-- query3.sql
-- Flights that go from airport SFO to airport JFK
-- airline (not the AirlineID), flight number, departure time & arrival time.

 -- \i lab2_data_loading.sql

SELECT A.AirlineName, F.FlightNum, F.DepartureTime, F.ArrivalTime
FROM Airlines A, Flights F
WHERE F.Origin = 'SFO' AND F.Destination = 'JFK'
  AND F.AirlineID = A.AirlineID
