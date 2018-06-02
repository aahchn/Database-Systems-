-- Aaron Chan - aahchan
-- Lab2
-- query2.sql
-- Give the name for each customer whose name begins with ‘W’ and who has a ticket on UAL.

 -- \i lab2_data_loading.sql

SELECT DISTINCT C.CustName
FROM Customers C, Tickets T
WHERE T.AirlineID = 'UAL'
  AND C.CustName LIKE 'W%'
  AND T.CustID = C.CustID
