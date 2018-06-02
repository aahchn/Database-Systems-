-- Aaron Chan - aahchan
-- Foreign.sql

ALTER TABLE Tickets
  ADD FOREIGN KEY (CustID) REFERENCES Customers(CustID),
  ADD FOREIGN KEY (AirlineID, FlightNum) REFERENCES Flights(AirlineID, FlightNum);

ALTER TABLE Flights
  ADD FOREIGN KEY (AirlineID) REFERENCES Airlines(AirlineID);
