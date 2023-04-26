ALTER TABLE ConcertLocation
ADD CONSTRAINT check_lat_long
CHECK (Latitude BETWEEN -90 and 90 AND Longitude BETWEEN -180 and 180);

ALTER TABLE ConcertLocation
ADD CONSTRAINT unique_latitude_longitude
UNIQUE (Latitude, Longitude);