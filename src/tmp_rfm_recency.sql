insert into analysis.tmp_rfm_recency (user_id, recency)
select user_id, NTILE(5) OVER (
    ORDER BY current_date-max(case when o2.key = 'Closed' then order_ts else null end) desc nulls first
)   recency
from analysis.orders o join
analysis.orderstatuses o2 on o.status = o2.id
group by user_id;
