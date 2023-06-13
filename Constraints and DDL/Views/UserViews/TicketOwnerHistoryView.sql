CREATE VIEW ticketsthatusersown as
SELECT th.consumerid,
       th.ticketid,
       th.datefrom,
       th.dateto,
       t.concertid,
       t.validuntil,
       c.concertname,
       c.concertdate
FROM ticketownerhistory th
         JOIN ticket t ON th.ticketid = t.ticketid
         JOIN concert c ON t.concertid = c.concertid;

select ticketid,datefrom,concertid,concertname,concertdate
from ticketsthatusersown
where consumerid=45680
and validuntil >CURRENT_DATE
and dateto IS NULL;
