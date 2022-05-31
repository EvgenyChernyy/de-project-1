insert into analysis.tmp_rfm_recency (user_id, recency)
select user_id, NTILE(5) OVER (
    ORDER BY current_date-max(order_ts) ASC
)   recency
from analysis.orders o
where o.status = (select id from analysis.orderstatuses o2 where key = 'Closed')
group by user_id;
