CREATE VIEW ConcertsWithAvaivableTickets as
select t.ticketid,t.concertid,t.price,t.validuntil,c.concertname
from ticket t join concert c on t.concertid = c.concertid
where t.status='available';