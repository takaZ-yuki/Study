select
  id
  , loginid
  , case sex 
    when '1' then '�j' 
    when '2' then '��'
	else '���̑�' end as sex
from
  user_mst

