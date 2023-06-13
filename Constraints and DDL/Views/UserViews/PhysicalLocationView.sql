CREATE VIEW availableticketslocation as
SELECT t.ticketid,
       t.physicalshopid,
       p.shopname,
       t.concertid,
       t.price,
       t.status,
       t.validuntil,
       c.concertname,
       c.concertdate
FROM ticket t
         JOIN physicalshop p ON t.physicalshopid = p.physicalshopid
         JOIN concert c ON t.concertid = c.concertid;

select *
from availableticketslocation
where physicalshopid=11
and status='available';