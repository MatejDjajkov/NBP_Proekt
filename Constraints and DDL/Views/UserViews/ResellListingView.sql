CREATE VIEW reselllistings as
SELECT resalelisting.listingid,
       resalelisting.exparationdate,
       t.ticketid,
       resalelisting.resellprice,
       resalelisting.status,
       resalelisting.sellerconsumerid,
       a.userid,
       a.username,
       t.concertid,
       c2.concertname,
       c2.concertdate
FROM resalelisting
         JOIN consumer c ON resalelisting.sellerconsumerid = c.consumerid
         JOIN appuser a ON a.userid = c.appuserid
         JOIN ticket t ON resalelisting.ticketid = t.ticketid
         JOIN concert c2 ON t.concertid = c2.concertid;

select *
from resalelisting
where status='available';