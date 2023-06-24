CREATE VIEW concertperformers as
SELECT con.concertid,
       con.concertname,
       mus.musicgroupid,
       mus.groupname,
       mss.musicianid,
       mss.stagename
FROM concert con
         JOIN musicgroup_concert mc ON con.concertid = mc.concertid
         JOIN musicgroup mus ON mc.musicgroupid = mus.musicgroupid
         LEFT JOIN solomusician_concert sc ON con.concertid = sc.concertid
         LEFT JOIN solomusician s ON sc.solomusicianid = s.solomusicianid
         LEFT JOIN musician mss ON s.musicianid = mss.musicianid;

select *
from concertperformers
where concertid=600;

select venuename,state,city,address
from concert
join concertlocation c on concert.concertlocationid = c.concertlocationid
where concertid=677;

select groupname,stagename
from concertperformers
where concertid=670;