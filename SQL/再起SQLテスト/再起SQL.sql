with recursive r as (
	    select
			*
	    from
			department
	    where
			name = '�V�X�e���J����'

    union all

	    select
			department.*
	    from
			r, department
	    where
			department.parent_id = r.id
)
select * from r;
