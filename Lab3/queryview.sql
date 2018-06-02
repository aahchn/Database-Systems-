-- Aaron Chan
-- queryview.SQL


SELECT CNP.CustID, C.CustName, COUNT(CNP.CustID) AS CA_NY_Total
FROM CA_NY_Passengers CNP, Customers C
WHERE CNP.CustID = C.CustID
GROUP BY CNP.CustID, C.CustName;

/*

CustID | CustName       | CA_NY_Total
114    |Jim Halpert     | 1
131    |Harvey Spectre  | 1
137    |Drew Powell     | 2
139    |Sadik Hadzovic  | 2

*/

DELETE FROM Tickets
WHERE (TicketID = 202 OR TicketID = 204);

/*

CustID | CustName       | CA_NY_Total
114    |Jim Halpert     | 1
137    |Drew Powell     | 1
139    |Sadik Hadzovic  | 2

*/
