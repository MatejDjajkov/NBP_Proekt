CREATE VIEW calendarview as
SELECT calendar.calendarid,
       calendar.concertlocationid,
       calendar.calendardate,
       calendar.timeslot,
       c.concertid,
       c.concertname
FROM calendar
LEFT JOIN concert c ON calendar.concertid = c.concertid;

select *
from calendarview
where concertlocationid=2 and calendardate='2022-03-02';