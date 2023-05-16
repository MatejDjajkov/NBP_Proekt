CREATE view TicketsAtShopLocation as
WITH TicketsLocation (ticketid,physicalshopid,concertid,price) as(
select ticketid,physicalshopid,concertid,price
from ticket
where physicalshopid IS NOT NULL
AND status='available')
select t.ticketid,t.concertid,t.price,c.concertname,c.concertdate,p.physicalshopid,
       p.shopname,p.city,p.state,p.address,p.phonenumber
from TicketsLocation t join physicalshop p on t.physicalshopid=p.physicalshopid
join concert c on c.concertid=t.concertid;