CREATE VIEW ConcertTicketStatus AS
SELECT
  c.concertid,
  c.concertname,
  c.concertdate,
  COUNT(t.ticketid) AS total_tickets,
  COUNT(CASE WHEN t.status = 'expired' THEN 1 END) AS total_expired_tickets,
  COUNT(CASE WHEN t.status = 'sold' THEN 1 END) AS total_sold_tickets,
  COUNT(CASE WHEN t.status = 'available' THEN 1 END) AS total_available_tickets
FROM
  concert c
  JOIN ticket t ON c.concertid = t.concertid
GROUP BY
  c.concertid,
  c.concertdate;

select *
from ConcertTicketStatus;