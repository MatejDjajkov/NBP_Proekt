ALTER TABLE ResaleListing
ADD CONSTRAINT valid_listing_status
CHECK (Status IN ('expired', 'sold', 'available'));