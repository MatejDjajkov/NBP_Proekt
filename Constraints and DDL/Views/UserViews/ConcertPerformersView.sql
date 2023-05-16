CREATE VIEW ConcertPerformers AS
SELECT con.concertid,con.concertname,mus.musicgroupid,mus.groupname,mss.musicianid,mss.stagename
from concert con join musicgroup_concert mc on con.concertid = mc.concertid
JOIN musicgroup mus on mc.musicgroupid = mus.musicgroupid
left JOIN solomusician_concert sc on con.concertid = sc.concertid
left join solomusician s on sc.solomusicianid = s.solomusicianid
left join musician mss on s.musicianid=mss.musicianid;

