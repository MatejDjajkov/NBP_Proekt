CREATE VIEW PaymentsPerDate as
Select paymentdate,username,paymentamount
from payment
join consumer c on c.consumerid = payment.consumerid
join appuser a on a.userid = c.appuserid
group by paymentdate,username,paymentamount
order by paymentdate;