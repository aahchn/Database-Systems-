-- Aaron Chan - aahchan
-- Lab2
-- query4.sql
-- Flights that go from SFO to JFK with 1 stopover; flights arrive/depart on time
--   30 mins < stopover < 2 hrs
-- print out FlightNum1, DepartureTime1, ArrivalTime1, StopOverAirportID, FlightNum2, DepartureTime2, ArrivalTime2

SELECT F1.FlightNum as FlightNum1,
       F1.DepartureTime as DepartureTime1,
       F1.ArrivalTime as ArrivalTime1,
       F1.Destination as StopOverAirportID,
       F2.FlightNum as FlightNum2,
       F2.DepartureTime as DepartureTime2,
       F2.ArrivalTime as ArrivalTime2
FROM Flights F1, Flights F2
WHERE F1.Origin = 'SFO'
  AND F1.Destination = F2.Origin
  AND F2.Destination = 'JFK'
  AND F2.DepartureTime >= F1.ArrivalTime + '00:30'
  AND F2.DepartureTime <= F1.ArrivalTime + '02:00'
