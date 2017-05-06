/*************************************************************
 * accountテーブル
 ************************************************************/

-- テーブルの削除
-- drop table account;

-- テーブルの作成
create table account (
  id integer
  , username text not null
  , password text not null
  , CONSTRAINT user_pkey PRIMARY KEY (id)
);

comment on table account is '利用書テーブル';
comment on column account.id is 'ID';
comment on column account.username is 'ユーザ名';
comment on column account.password is 'パスワード';
