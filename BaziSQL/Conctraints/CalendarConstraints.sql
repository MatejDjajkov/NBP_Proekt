ALTER TABLE Calendar
ADD CONSTRAINT check_TimeSlot
CHECK (TimeSlot >= 0 AND TimeSlot <= 23);