ALTER TABLE TicketOwnerHistory
ADD CONSTRAINT check_FromBeforeTo
CHECK (
    ("From" IS NULL AND "To" IS NULL) OR
    ("To" IS NOT NULL AND "To" >= "From") OR
    (Joined IS NOT NULL AND LeftDate IS NULL)
);