
ALTER TABLE Ticket
ADD CONSTRAINT check_status
CHECK (Status IN ('sold', 'expired', 'available'));

ALTER TABLE Ticket
ADD CONSTRAINT check_ValidUntilBeforeDate
CHECK (ValidUntil <= (SELECT "Date" FROM Concert WHERE ConcertID = Ticket.ConcertID));


