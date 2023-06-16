CREATE VIEW paymentuserdetails as
SELECT c.consumerid,
       c.registrationdate,
       p.paymentid,
       p.paymentstatus,
       p.paymentmethod,
       p.paymentdate,
       p.paymentamount
FROM consumer c
         JOIN payment p ON c.consumerid = p.consumerid;

select *
from paymentuserdetails
where consumerid=45680
order by paymentdate;