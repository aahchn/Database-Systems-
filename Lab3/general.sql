-- Aaron Chan - aahchan
-- general.sql
--
ALTER TABLE Tickets
  ADD CONSTRAINT positive_cost CHECK (Cost >= 0);

ALTER TABLE Flights
  ADD CONSTRAINT travel_time CHECK (ArrivalTime > DepartureTime),
  ADD CONSTRAINT traveling CHECK (Origin <> Destination);

ALTER TABLE Airports
  ADD CONSTRAINT location CHECK (
    CASE
      WHEN State = 'TN' THEN City = 'Knoxville'
      ELSE TRUE
    END
  );
