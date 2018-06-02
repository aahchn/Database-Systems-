-- Aaron Chan
-- deleteUnpaid.pgsql

CREATE FUNCTION deleteUnpaid (deleteCount INTEGER)
RETURNS INTEGER AS
$$

	DECLARE
		totalCost INTEGER;
		custCustID INTEGER;
		currCount INTEGER;
		currentCost INTEGER;
		totalCust INTEGER;

  DECLARE custCursor CURSOR FOR
    SELECT C.CustID
    FROM Customers C
    WHERE  C.Status <> 'A';
  BEGIN

/* Get total amount of customers that is not 'A' status */
 SELECT COUNT(*) INTO totalCust
 FROM Customers
 WHERE Status <> 'A';

 IF totalCust = 0 THEN RETURN -1;
 END IF;

 totalCost = 0;

 OPEN custCursor;

 /*  cursor to go through all the customers */
 WHILE totalCust > 0
 LOOP
   FETCH custCursor INTO custCustID;
   currCount = 0;

/* inner loop to find & delete max price */
 WHILE currCount < deleteCount
 LOOP
   currentCost = (SELECT coalesce(MAX(T.cost), 0)
                  FROM Tickets T
                  WHERE T.CustID = custCustID AND T.Paid = FALSE);
   totalCost = totalCost + currentCost;

   DELETE FROM Tickets T
          WHERE T.CustID = custCustID
          AND T.Cost = currentCost;

   currCount = currCount + 1;
   END LOOP;

   totalCust = totalCust - 1;
 END LOOP;

 CLOSE custCursor;
 RETURN totalCost;

 END;
 $$ LANGUAGE plpgsql;
