/*************************************************************
 * Todo用のテーブル
 ************************************************************/

-- Todoテーブル削除
drop table todoitems;

-- Todoテーブル作成
CREATE TABLE todoitems( 
  id serial NOT NULL
  , title text
  , done boolean
  , CONSTRAINT todoitems_pkey PRIMARY KEY (id)
);

-- Todoテーブル用コメント
comment on table todoitems is 'Todo用テーブル';
comment on column todoitems.id is 'ID';
comment on column todoitems.title is 'タイトル';
comment on column todoitems.done is '完了済みかどうかのフラグ';
