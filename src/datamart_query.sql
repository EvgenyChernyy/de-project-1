insert into analysis.dm_rfm_segments (user_id, recency, frequency, monetary_value)
select trr.user_id, trr.recency, trf.frequency, trmv.monetary_value
from analysis.tmp_rfm_recency trr join
analysis.tmp_rfm_frequency trf on trr.user_id = trf.user_id join
analysis.tmp_rfm_monetary_value trmv on trmv.user_id = trf.user_id
order by trr.user_id asc;

user_id	recency	frequency	monetary_value
0	5	3	4
1	2	3	3
2	4	3	5
3	4	3	3
4	2	3	3
5	1	5	5
6	5	3	5
7	2	3	2
8	5	1	3
9	5	2	2
