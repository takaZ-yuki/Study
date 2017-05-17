/*************************************************************
 * authoritiesテーブル
 ************************************************************/

-- テーブルの削除
-- drop table authorities;

-- テーブルの作成
create table authorities (
  id integer,
  authority text,
  FOREIGN KEY (id) REFERENCES account(id),
  CONSTRAINT authorities_pkey PRIMARY KEY (id, authority)
);

comment on table authorities is '利用書テーブル';
comment on column authorities.id is 'ID';
comment on column authorities.authority is '権限';

