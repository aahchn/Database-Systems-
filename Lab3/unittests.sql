-- Aaron Chan - aahchan
-- unittests.SQL
---------------------------------------------------------------------------------------------
/* for each of the 3 FOREIGN KEYS write 1 unit test */
INSERT INTO Tickets(TicketID, CustID, AirlineID, FlightNum, SeatNum, Cost, Paid)
  VALUES (184, 900, ASA, 120, C45, 728.32, True);

INSERT INTO Tickets(TicketID, CustID, AirlineID, FlightNum, SeatNum, Cost, Paid)
  VALUES (207, 139, XXX, 900, F17, 812.74, False);

INSERT INTO Flights(AirlineID, FlightNum, Origin, Destination, DepartureTime, ArrivalTime)
  VALUES (XYZ, 220, SFO, JFK, '19:00:00', '21:00:00');


---------------------------------------------------------------------------------------------
/* For each of the 4 CONSTRAINTS write 2 unit test each */

UPDATE Tickets
  SET Cost = 600
  WHERE TicketID = 190;

UPDATE Tickets
  SET Cost = -123.00
  WHERE TicketID = 120;

UPDATE Flights
  SET ArrivalTime = '04:00:00', DepartureTime = '08:00:00'
  WHERE AirlineID = 'AAL' AND FlightNum = 200;

UPDATE Flights
  SET DepartureTime = '19:00:00'
  WHERE AirlineID = 'SWA' AND FlightNum = 300;

UPDATE Airports
  SET State = 'TN', City = 'Knoxville'
  WHERE AirportID = 'SFO';

UPDATE Airports
  SET State = 'TN'
  WHERE AirportID = 'LAX';

UPDATE Flights
  SET Origin = 'LAX', Destination = 'JFK'
  WHERE AirlineID = 'NKS' AND FlightNum = 170;

UPDATE Flights
  SET Origin = 'SFO', Destination = 'SFO'
  WHERE AirlineID = 'UAL' AND FlightNum = 290;
