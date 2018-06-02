-- Aaron Chan
-- Lab 2
-- CMPS 180 

DROP SCHEMA Lab2 CASCADE;
CREATE SCHEMA Lab2;

CREATE TABLE Airlines (
  AirlineID char(3) PRIMARY KEY,
  AirlineName varchar(30),
  UNIQUE (AirlineName)
);

CREATE TABLE Airports (
  AirportID char(3) PRIMARY KEY,
  City varchar(30) NOT NULL,
  State varchar(30) NOT NULL
);

CREATE TABLE Flights (
  AirlineID char(3),
  FlightNum int,
  Origin char(3),
  Destination char(3),
  DepartureTime time,
  ArrivalTime time,
  PRIMARY KEY (AirlineID, FlightNum),
  UNIQUE (AirlineID, Origin, Destination, DepartureTime)
);

CREATE TABLE Customers (
  CustID int PRIMARY KEY,
  CustName varchar(30) NOT NULL,
  Status char(1)
);

CREATE TABLE Tickets (
  TicketID int PRIMARY KEY,
  CustID int NOT NULL,
  AirlineID char(3),
  FlightNum int,
  FlightDate date,
  SeatNum char(3),
  Cost decimal(7,2),
  Paid boolean,
  UNIQUE (CustID, AirlineID, FlightNum)
);
