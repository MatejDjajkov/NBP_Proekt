ALTER TABLE ResaleListing
ADD CONSTRAINT valid_listing_status
CHECK (Status IN ('expired', 'sold', 'available'));

ALTER TABLE ResaleListing
ADD CONSTRAINT check_ExpirationBeforeValidUntil
CHECK (ExpirationDate <= (SELECT ValidUntil FROM Ticket WHERE TicketID = ResaleListing.TicketID));
