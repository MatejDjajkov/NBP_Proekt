CREATE VIEW SalaAvailability AS
SELECT c.CalendarID, c.CalendarDate, c.TimeSlot
FROM Calendar c
JOIN Concert co ON co.ConcertID = c.ConcertID
LEFT JOIN Ticket t ON t.ConcertID = c.ConcertID AND t.ValidUntil >= c.CalendarDate
WHERE co.ConcertDate = '2023-05-04'
GROUP BY c.CalendarID, c.CalendarDate, c.TimeSlot
HAVING COUNT(t.TicketID) < (SELECT Capacity FROM ConcertLocation cl WHERE cl.ConcertLocationID = co.ConcertLocationID);

<--Change the date if you want to see availability for another date-->