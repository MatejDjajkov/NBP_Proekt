ALTER TABLE PhysicalShop
ADD CONSTRAINT check_PhoneNumber
CHECK (PhoneNumber ~ '^\([0-9]{3}\) [0-9]{3}-[0-9]{4}$');

ALTER TABLE PhysicalShop
ADD CONSTRAINT check_lat_long
CHECK (Latitude BETWEEN -90 and 90 AND Longitude BETWEEN -180 and 180);

ALTER TABLE PhysicalShop
ADD CONSTRAINT unq_latitude_longitude
UNIQUE (Latitude, Longitude);