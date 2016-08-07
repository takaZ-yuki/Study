select
  name
  , count(case when sex = '1' then id else 0 end) as '’j'
  , count(case when sex = '2' then id else 0 end) as '—' 
from
  user_mst 
group by
  name

