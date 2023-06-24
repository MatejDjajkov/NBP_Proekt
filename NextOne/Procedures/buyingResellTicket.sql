

CREATE OR REPLACE procedure BuyResellTicket(
  consumer INT,
  listing INT
)
AS
    $$
DECLARE
 ticket INT;
 price DECIMAL;
 thisDate DATE :=current_date;
BEGIN
 SELECT ticketid,resellprice INTO ticket,price FROM resalelisting WHERE listingid=listing;

 insert into resellpayment(buyerconsumerid, listingid, resellamount, resellstatus, reselldate)
 values (consumer,listing,price,'completed',thisDate);

 update resalelisting
 set status='sold'
 where listingid=listing;

 update ticketownerhistory
 set dateto=thisDate
 where ticketid=ticket;

 insert into ticketownerhistory(consumerid, ticketid, datefrom, dateto)
 values (consumer,ticket,thisDate,NULL);


END;
$$
LANGUAGE plpgsql;