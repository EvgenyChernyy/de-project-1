insert into analysis.tmp_rfm_frequency (user_id, frequency)
select user_id, NTILE(5) OVER (
    ORDER BY count(*) ASC
)   frequency
from analysis.orders o
where o.status = (select id from analysis.orderstatuses o2 where key = 'Closed')
group by user_id;
