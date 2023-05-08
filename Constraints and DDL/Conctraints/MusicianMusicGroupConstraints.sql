ALTER TABLE Musician_MusicGroup
ADD CONSTRAINT check_JoinedBeforeLeft
CHECK (
    (Joined IS NULL AND LeftDate IS NULL) OR
    (LeftDate IS NOT NULL AND LeftDate >= Joined) OR
    (Joined IS NOT NULL AND LeftDate IS NULL)
);
