DROP SCHEMA Lab4 CASCADE;
CREATE SCHEMA Lab4;

ALTER ROLE aahchan SET SEARCH_PATH to Lab4;

--Airlines (AirlineID, AirlineName)

CREATE TABLE Airlines (
	AirlineID CHAR(3) PRIMARY KEY,
	AirlineName VARCHAR(30) UNIQUE
);

--Airports (AirportID, City, State)

CREATE TABLE Airports (
	AirportID CHAR(3) PRIMARY KEY,
	City VARCHAR(30) NOT NULL,
	State VARCHAR(30) NOT NULL
);

--Flights (AirlineID, FlightNum, Origin, Destination, DepartureTime, ArrivalTime)

CREATE TABLE Flights (
	AirlineID CHAR(3),
	FlightNum INT,
	Origin CHAR(3),
	Destination CHAR(3),
	DepartureTime TIME,
	ArrivalTime TIME,
	PRIMARY KEY(AirlineID, FlightNum),
	UNIQUE (AirlineID, Origin, Destination, DepartureTime)
);

--Customers (CustID, CustName, Status)

CREATE TABLE Customers (
	CustID INT PRIMARY KEY,
	CustName VARCHAR(30) NOT NULL,
	Status CHAR(1)
);

--Tickets (TicketID, CustID, AirlineID, FlightNum, FlightDate, SeatNum, Cost, Paid)

CREATE TABLE Tickets (
	TicketID INT PRIMARY KEY,
	CustID INT NOT NULL,
	AirlineID CHAR(3),
	FlightNum INT,
	SeatNum CHAR(3),
	Cost INT,
	Paid BOOLEAN,
	UNIQUE (CustID, AirlineID, FlightNum)
);
