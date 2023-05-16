CREATE VIEW ConcertLocationView as
select c.concertid,c.concertname,c.concertdate,c2.concertlocationid,c2.venuename,c2.longitude,c2.latitude,c2.address,c2.state,c2.city
from concert c join concertlocation c2 on c.concertlocationid = c2.concertlocationid;