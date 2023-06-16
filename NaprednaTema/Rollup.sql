DROP TABLE analytics.onlineorderhistory;
DROP TABLE analytics.physicalshophistory;
DROP table analytics.historyreselltable;


CREATE TABLE analytics.OnlineOrderHistory as
WITH materialized as (
select extract(year from t.orderdate) as Year ,extract (month from t.orderdate) as Month ,t2.concertid,sum(price) as revenue
from ticketorder  t
join ticket t2 on t.orderid = t2.orderid
where t.orderstatus='completed'
group by  rollup (extract(year from t.orderdate),extract (month from t.orderdate),t2.concertid)
order by Year,Month,t2.concertid)
SELECT m.Year,m.Month,m.concertid,c.concertname,m.revenue
from materialized m
left join concert c on m.concertid=c.concertid;

CREATE TABLE analytics.PhysicalShopHistory as
WITH materialized as (
select t.physicalshopid,t.concertid,sum(price) as revenue
from ticket t
join physicalshop t2 on t.physicalshopid=t2.physicalshopid
where t.status='sold'
group by rollup (t.physicalshopid,t.concertid)
order by t.physicalshopid,t.concertid)
SELECT p.physicalshopid,shopname,c.concertid,concertname,revenue
from materialized m left join physicalshop p on m.physicalshopid=p.physicalshopid
left join concert c on m.concertid=c.concertid;



CREATE TABLE analytics.HistoryResellTable as
With materialized as(
select extract(year from reselldate) as Year,extract(month from reselldate) as Month,concertid,count(*) as ResellNumbers
from resalelisting rl
join resellpayment rp on rl.listingid = rp.listingid
join ticket t on rl.ticketid = t.ticketid
where rl.status='sold'
group by rollup (extract(year from reselldate),extract(month from reselldate),t.concertid)
order by Year,Month,t.concertid)
SELECT m.Year,m.Month,m.concertid,c.concertname,m.ResellNumbers
from materialized m
left join concert c on m.concertid=c.concertid;

