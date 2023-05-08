CREATE VIEW AvailableTicketsAtPhysicalLocation AS
SELECT Ticket.TicketID, Ticket.ConcertID, Concert.ConcertName, ConcertLocation.VenueName, PhysicalShop.Address, Ticket.Price, Ticket.Status, Ticket.ValidUntil
FROM Ticket
LEFT JOIN PhysicalShop ON Ticket.PhysicalShopID = PhysicalShop.PhysicalShopID
LEFT JOIN Concert ON Ticket.ConcertID = Concert.ConcertID
LEFT JOIN ConcertLocation ON Concert.ConcertLocationID = ConcertLocation.ConcertLocationID;
WHERE Status IN ('available');
