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

select *
from concertswithavailabletickets
where status='available';