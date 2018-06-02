-- Aaron Chan - aahchan
-- Lab2
-- query5.sql

SELECT T.FlightNum,
       T.AirlineID,
       COUNT(Paid) as PaidTickets
FROM Tickets T
WHERE T.Paid = 'True'
GROUP BY T.FlightNum, T.AirlineID
