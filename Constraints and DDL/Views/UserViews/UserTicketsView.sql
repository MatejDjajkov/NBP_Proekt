CREATE VIEW UserTickets AS
SELECT t.TicketID, c.ConcertName, cl.VenueName, c.ConcertDate, t.Status
FROM Ticket t
JOIN Concert c ON t.ConcertID = c.ConcertID
JOIN ConcertLocation cl ON c.ConcertLocationID = cl.ConcertLocationID
JOIN ConcertOrganisationCompany coc ON t.ConcertOrganisationID = coc.CompanyID
JOIN TicketOrder tor ON t.OrderID = tor.OrderID
JOIN Consumer con ON tor.ConsumerID = con.ConsumerID
JOIN AppUser au ON con.AppUserID = au.UserID
WHERE au.UserID = [USER ID];

<-- Replace USER ID with the ID you want to find -->

SELECT * FROM UserTickets;
