CREATE VIEW ConcertPerformers AS
SELECT
  c.ConcertID,
  cg.GroupName AS MusicGroup,
  sm.FirstName || ' ' || sm.LastName AS SoloMusician
FROM
  Concert c
LEFT JOIN
  MusicGroup_Concert mgc ON c.ConcertID = mgc.ConcertID
LEFT JOIN
  MusicGroup cg ON mgc.MusicGroupID = cg.MusicGroupID
LEFT JOIN
  SoloMusician_Concert smc ON c.ConcertID = smc.ConcertID
LEFT JOIN
  SoloMusician sm ON smc.SoloMusicianID = sm.SoloMusicianID;
<------------------------------>
SELECT * FROM ConcertPerformers;
