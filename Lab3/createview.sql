-- Aaron aahchan
-- createview.SQL
CREATE VIEW CA_NY_Passengers AS
  SELECT T.CustID, T.AirlineID, T.FlightNum
  FROM Tickets T, Flights F
  WHERE T.FlightNum = F.FlightNum
    AND T.AirlineID = F.AirlineID
    AND F.Origin IN (SELECT A.AirportID
                     FROM Airports A
                     WHERE A.State = 'CA')
    AND F.Destination IN (SELECT A.AirportID
                          FROM Airports A
                          WHERE A.State = 'NY');
