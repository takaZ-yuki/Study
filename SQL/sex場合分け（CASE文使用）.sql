select
  id
  , loginid
  , case sex 
    when '1' then '男' 
    when '2' then '女'
	else 'その他' end as sex
from
  user_mst

