insert into analysis.tmp_rfm_frequency (user_id, frequency)
select user_id, NTILE(5) OVER (
    ORDER BY count(case when o2.key = 'Closed' then 1 end)  ASC
)   frequency
from analysis.orders o join
analysis.orderstatuses o2 on o.status = o2.id
group by user_id;
