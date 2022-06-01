insert into analysis.tmp_rfm_monetary_value (user_id, monetary_value)
select user_id, NTILE(5) OVER (
    ORDER BY sum(case when o2.key = 'Closed' then payment else 0 end) asc
)   frequency
from analysis.orders o join
analysis.orderstatuses o2 on o.status = o2.id
group by user_id;
