CREATE VIEW activity AS
SELECT dates.formatted_date AS Date,
       COUNT(DISTINCT c.consumerid) AS registeredUsers,
       COUNT(DISTINCT rp.resellpaymentid) AS resales,
       COUNT(DISTINCT p.paymentid) AS onlinePayments
FROM
  (SELECT generate_series('2015-04-28'::date, current_date, '1 day')::date AS formatted_date) AS dates
LEFT JOIN consumer c ON dates.formatted_date = c.registrationdate
LEFT JOIN resellpayment rp ON dates.formatted_date = rp.reselldate
LEFT JOIN payment p ON dates.formatted_date = p.paymentdate
GROUP BY dates.formatted_date
ORDER BY Date;

drop view activity;




select date,registeredUsers,resales,onlinePayments
from activity
where Date>='2015-04-28'
and Date <='2015-05-01';


select registrationdate
from consumer;