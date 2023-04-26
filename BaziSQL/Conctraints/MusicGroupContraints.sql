ALTER TABLE MusicGroup
ADD CONSTRAINT check_ActiveStatus
CHECK (ActiveStatus IN ('active', 'disbanded'));
