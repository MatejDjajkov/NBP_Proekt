ALTER TABLE MusicGroup
ADD CONSTRAINT check_ActiveStatus
CHECK (ActiveStatus IN ('active', 'disbanded'));

ALTER TABLE MusicGroup
ADD CONSTRAINT check_FormationBeforeConcertDate
CHECK NOT EXISTS (
  SELECT 1
  FROM MusicGroup_Concert mgc
  JOIN Concert c ON c.ConcertID = mgc.ConcertID
  WHERE mgc.MusicGroupID = MusicGroup.MusicGroupID
    AND MusicGroup.FormationDate <= c.Date
);
