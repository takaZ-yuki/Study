with recursive r as (
	    select
			*
	    from
			department
	    where
			name = 'システム開発部'

    union all

	    select
			department.*
	    from
			r, department
	    where
			department.parent_id = r.id
)
select * from r;
