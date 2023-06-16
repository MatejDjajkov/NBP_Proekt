CREATE OR REPLACE FUNCTION BuyConcertTicket(
  IDConcert INT,
  numberOfTickets INT,
  IDconsumer INT,
  consumerPaymentMethod varchar(255)
)
RETURNS VOID
AS $$
DECLARE
  PurchaseDate DATE := CURRENT_DATE;
  ticketPrice DECIMAL;
  ticketOrderIT INT;
  soldTicketIDs INT[];
BEGIN
  SELECT price INTO ticketPrice FROM ticket WHERE concertid = IDConcert LIMIT 1;

  INSERT INTO ticketorder (consumerid, orderdate, orderstatus, orderamount)
  VALUES (IDconsumer, PurchaseDate, 'completed', ticketPrice * numberOfTickets)
  RETURNING orderid INTO ticketOrderIT;

  INSERT INTO payment (orderid, consumerid, paymentstatus, paymentmethod, paymentdate, paymentamount)
  VALUES (ticketOrderIT, IDconsumer, 'completed', consumerPaymentMethod, PurchaseDate, ticketPrice * numberOfTickets);

 WITH selected_tickets AS (
  UPDATE ticket t1
  SET orderid = ticketOrderIT, status = 'sold'
  FROM (
    SELECT *
    FROM ticket t2
    WHERE t2.concertid = IDConcert AND t2.status = 'available'
    LIMIT numberOfTickets
  ) AS subquery
  WHERE t1.ticketid = subquery.ticketid
  RETURNING t1.ticketid
)
 SELECT array_agg(ticketid) INTO soldTicketIDs FROM selected_tickets;


  INSERT INTO ticketownerhistory (consumerid, ticketid, datefrom, dateto)
  SELECT IDconsumer, ticketID, PurchaseDate, NULL
  FROM unnest(soldTicketIDs) AS ticketID;

END;
$$ LANGUAGE plpgsql;


select BuyConcertTicket(678,2,686,'Credit Card');



-- THIS IS FOR TESTING THIS IS NOT RELEVANT TO THE FUNCTION
select *
from ticketorder
offset 100;

select max(orderid)
from ticketorder;

select *
from ticketorder
where orderid>=8144510;

select *
from ticket
where concertid=678;

select *
from ticketownerhistory
where ticketid=10623003;