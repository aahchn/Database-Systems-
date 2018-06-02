-- Aaron Chan - aahchan
-- Lab2
-- query1.sql
-- Displays AirlineIDs that has flights departs before noon in alphabetical order

-- \i lab2_data_loading.sql

SELECT DISTINCT F.AirlineID
FROM Flights F
WHERE F.DepartureTime < '12:00'
ORDER BY F.AirlineID ASC
