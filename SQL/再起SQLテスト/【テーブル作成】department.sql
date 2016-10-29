/*************************
 * 会社の組織テーブル
 *************************/
--drop table department;

create table department(
	id          NVARCHAR(10) primary key
	, parent_id NVARCHAR(10)
	, name      NVARCHAR(10)
);
