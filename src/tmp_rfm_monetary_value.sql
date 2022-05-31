insert into analysis.tmp_rfm_monetary_value (user_id, monetary_value)
select user_id, NTILE(5) OVER (
    ORDER BY sum(payment) ASC
)   frequency
from analysis.orders o
where o.status = (select id from analysis.orderstatuses o2 where key = 'Closed')
group by user_id;
