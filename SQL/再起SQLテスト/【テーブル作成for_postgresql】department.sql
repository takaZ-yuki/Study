/*************************
 * ��Ђ̑g�D�e�[�u��
 *************************/
--drop table department;

create table department(
	id          character varying(10) primary key
	, parent_id character varying(10)
	, name      character varying(10)
);
