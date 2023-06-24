CREATE VIEW concertswithavailabletickets as
SELECT t.ticketid,
       t.physicalshopid,
       t.orderid,
       t.status,
       t.price,
       c.concertid,
       c.concertname,
       c.concertdate
FROM ticket t
JOIN concert c ON t.concertid = c.concertid;

select ticketid, concertid,price,concertname,concertdate
from concertswithavailabletickets
where status='available'
and physicalshopid IS NULL;

select address,state,city,shopname,phonenumber
from physicalshop
where physicalshopid=2;

select