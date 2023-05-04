CREATE VIEW concert_tickets AS
SELECT c.ConcertName, COUNT(CASE WHEN t.Status = 'sold' THEN 1 END) AS PurchasedTickets,
  COUNT(CASE WHEN t.Status = 'expired' THEN 1 END) AS ExpiredTickets,
  COUNT(CASE WHEN t.Status = 'available' THEN 1 END) AS FreeTickets
FROM Concert c
JOIN Ticket t ON t.ConcertID = c.ConcertID
WHERE c.ConcertDate = '2023-05-05'
GROUP BY c.ConcertID;

<--Change date to see ticket analysis for another date>