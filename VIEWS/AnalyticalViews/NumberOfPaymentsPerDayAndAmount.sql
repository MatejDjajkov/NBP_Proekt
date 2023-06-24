CREATE VIEW PaymentsPerDate as
Select paymentdate,username,SUM(paymentamount) as total
from payment
join consumer c on c.consumerid = payment.consumerid
join appuser a on a.userid = c.appuserid
group by paymentdate,username
order by paymentdate;

drop view PaymentsPerDate;
select paymentdate,username,total
from PaymentsPerDate
where paymentdate>='2021-01-01'
and paymentdate<='2021-01-02';