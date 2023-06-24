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
from consumer c
join payment p on c.consumerid = p.consumerid
join resellpayment r on c.consumerid = r.buyerconsumerid;

select paymentdate,paymentamount,paymentmethod,paymentstatus
from paymentuserdetails
where consumerid=68
order by paymentdate DESC ;

create index on payment(consumerid);