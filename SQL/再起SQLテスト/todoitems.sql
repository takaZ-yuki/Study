/*************************************************************
 * Todo�p�̃e�[�u��
 ************************************************************/

-- Todo�e�[�u���폜
drop table todoitems;

-- Todo�e�[�u���쐬
CREATE TABLE todoitems( 
  id serial NOT NULL
  , title text
  , done boolean
  , CONSTRAINT todoitems_pkey PRIMARY KEY (id)
);

-- Todo�e�[�u���p�R�����g
comment on table todoitems is 'Todo�p�e�[�u��';
comment on column todoitems.id is 'ID';
comment on column todoitems.title is '�^�C�g��';
comment on column todoitems.done is '�����ς݂��ǂ����̃t���O';
