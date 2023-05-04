CREATE VIEW Resale_Tickets AS
SELECT *
FROM Ticket
WHERE Status IN ('available');
