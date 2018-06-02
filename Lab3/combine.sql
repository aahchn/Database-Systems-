-- Aaron Chan, aahchan
-- Combine.sql
-- For each “new ticket” tuple t that’s in NewTickets,
--   either there already is a matching tuple in Tickets
--   that has the same primary key as t, or there isn’t
--   a matching tuple in Tickets.
UPDATE Tickets T
  SET SeatNum = NT.SeatNum, Paid = FALSE
  FROM NewTickets NT
  WHERE NT.TicketID = T.TicketID;

INSERT INTO Tickets (TicketID, CustID, AirlineID, FlightNum, SeatNum, Cost, Paid)
  SELECT NT.TicketID, NT.CustID, NT.AirlineID, NT.FlightNum, NT.SeatNum, NULL, FALSE
  FROM NewTickets NT
  LEFT JOIN Tickets T
  ON NT.TicketID = T.TicketID
  WHERE T.TicketID IS NULL;
