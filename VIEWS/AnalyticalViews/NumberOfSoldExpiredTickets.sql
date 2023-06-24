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

select concertid,concertname,concertdate,total_tickets,total_expired_tickets,total_sold_tickets,total_available_tickets
from ConcertTicketStatus;

select physicalshopid,shopname,concertid,concertname,revenue
from analytics.physicalshophistory;

select year,month,concertid,concertname,revenue
from analytics.onlineorderhistory;


select year,month,concertid,concertname,resellnumbers
from analytics.historyreselltable;