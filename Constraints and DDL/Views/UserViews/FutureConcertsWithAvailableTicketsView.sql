CREATE VIEW FutureConcerts AS
SELECT c.ConcertName, cl.VenueName, cl.City, cl.State, cal.CalendarDate, COUNT(t.TicketID) AS AvailableTickets
FROM Concert c
JOIN ConcertLocation cl ON c.ConcertLocationID = cl.ConcertLocationID
JOIN Calendar cal ON c.ConcertID = cal.ConcertID
LEFT JOIN Ticket t ON c.ConcertID = t.ConcertID AND t.Status = 'Available' AND t.ValidUntil >= NOW()::DATE
GROUP BY c.ConcertName, cl.VenueName, cl.City, cl.State, cal.CalendarDate
HAVING COUNT(t.TicketID) > 0
ORDER BY cal.CalendarDate;
