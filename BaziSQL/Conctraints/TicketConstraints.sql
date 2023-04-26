
ALTER TABLE Ticket
ADD CONSTRAINT check_status
CHECK (Status IN ('sold', 'expired', 'available'));

