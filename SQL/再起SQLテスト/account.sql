/*************************************************************
 * account�e�[�u��
 ************************************************************/

-- �e�[�u���̍폜
-- drop table account;

-- �e�[�u���̍쐬
create table account (
  id integer
  , username text not null
  , password text not null
  , CONSTRAINT user_pkey PRIMARY KEY (id)
);

comment on table account is '���p���e�[�u��';
comment on column account.id is 'ID';
comment on column account.username is '���[�U��';
comment on column account.password is '�p�X���[�h';
