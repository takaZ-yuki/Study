/*************************************************************
 * authorities�e�[�u��
 ************************************************************/

-- �e�[�u���̍폜
-- drop table authorities;

-- �e�[�u���̍쐬
create table authorities (
  id integer,
  authority text,
  FOREIGN KEY (id) REFERENCES account(id),
  CONSTRAINT authorities_pkey PRIMARY KEY (id, authority)
);

comment on table authorities is '���p���e�[�u��';
comment on column authorities.id is 'ID';
comment on column authorities.authority is '����';

