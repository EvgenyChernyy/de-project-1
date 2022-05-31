CREATE OR REPLACE VIEW analysis.orders
AS
select o2.order_id,
	   o2.order_ts,
	   o2.user_id,
	   o2.bonus_payment,
	   o2.payment,
	   o2."cost",
	   o2.bonus_grant,
	   t.status
from
	production.orders o2 join
	(
		select
	  			distinct order_id,
	  			first_value(status_id) over (partition by order_id order by dttm desc) status
		  from production.orderstatuslog o) t on t.order_id = o2.order_id
