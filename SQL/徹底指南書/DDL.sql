/* 既存のコード体系を新しい体系に変換して集計 */
CREATE TABLE PopTbl
(pref_name VARCHAR(32) PRIMARY KEY,
 population INTEGER NOT NULL);

INSERT INTO PopTbl VALUES('徳島', 100);
INSERT INTO PopTbl VALUES('香川', 200);
INSERT INTO PopTbl VALUES('愛媛', 150);
INSERT INTO PopTbl VALUES('高知', 200);
INSERT INTO PopTbl VALUES('福岡', 300);
INSERT INTO PopTbl VALUES('佐賀', 100);
INSERT INTO PopTbl VALUES('長崎', 200);
INSERT INTO PopTbl VALUES('東京', 400);
INSERT INTO PopTbl VALUES('群馬', 50);


/* 異なる条件の集計を1つのSQLで行う */
CREATE TABLE PopTbl2
(pref_name VARCHAR(32),
 sex CHAR(1) NOT NULL,
 population INTEGER NOT NULL,
    PRIMARY KEY(pref_name, sex));

INSERT INTO PopTbl2 VALUES('徳島', '1',	60 );
INSERT INTO PopTbl2 VALUES('徳島', '2',	40 );
INSERT INTO PopTbl2 VALUES('香川', '1',	100);
INSERT INTO PopTbl2 VALUES('香川', '2',	100);
INSERT INTO PopTbl2 VALUES('愛媛', '1',	100);
INSERT INTO PopTbl2 VALUES('愛媛', '2',	50 );
INSERT INTO PopTbl2 VALUES('高知', '1',	100);
INSERT INTO PopTbl2 VALUES('高知', '2',	100);
INSERT INTO PopTbl2 VALUES('福岡', '1',	100);
INSERT INTO PopTbl2 VALUES('福岡', '2',	200);
INSERT INTO PopTbl2 VALUES('佐賀', '1',	20 );
INSERT INTO PopTbl2 VALUES('佐賀', '2',	80 );
INSERT INTO PopTbl2 VALUES('長崎', '1',	125);
INSERT INTO PopTbl2 VALUES('長崎', '2',	125);
INSERT INTO PopTbl2 VALUES('東京', '1',	250);
INSERT INTO PopTbl2 VALUES('東京', '2',	150);


/* CHECK制約で複数の列の条件関係を定義する */
CREATE TABLE TestSal
(sex CHAR(1) ,
 salary INTEGER,
    CONSTRAINT check_salary CHECK
             ( CASE WHEN sex = '2'
                    THEN CASE WHEN salary <= 200000
                              THEN 1 ELSE 0 END
                    ELSE 1 END = 1 ));

INSERT INTO TestSal VALUES(1, 200000);
INSERT INTO TestSal VALUES(1, 300000);
INSERT INTO TestSal VALUES(1, NULL);
INSERT INTO TestSal VALUES(2, 200000);
-- INSERT INTO TestSal VALUES(2, 300000);  --error
-- INSERT INTO TestSal VALUES(2, NULL);
-- INSERT INTO TestSal VALUES(1, 300000);


/* 条件を分岐させたUPDATE */
CREATE TABLE SomeTable
(p_key CHAR(1) PRIMARY KEY,
 col_1 INTEGER NOT NULL, 
 col_2 CHAR(2) NOT NULL);

INSERT INTO SomeTable VALUES('a', 1, 'あ');
INSERT INTO SomeTable VALUES('b', 2, 'い');
INSERT INTO SomeTable VALUES('c', 3, 'う');


/* テーブル同士のマッチング */
CREATE TABLE CourseMaster
(course_id   INTEGER PRIMARY KEY,
 course_name VARCHAR(32) NOT NULL);

INSERT INTO CourseMaster VALUES(1, '経理入門');
INSERT INTO CourseMaster VALUES(2, '財務知識');
INSERT INTO CourseMaster VALUES(3, '簿記検定');
INSERT INTO CourseMaster VALUES(4, '税理士');

CREATE TABLE OpenCourses
(month       INTEGER ,
 course_id   INTEGER ,
    PRIMARY KEY(month, course_id));

INSERT INTO OpenCourses VALUES(200706, 1);
INSERT INTO OpenCourses VALUES(200706, 3);
INSERT INTO OpenCourses VALUES(200706, 4);
INSERT INTO OpenCourses VALUES(200707, 4);
INSERT INTO OpenCourses VALUES(200708, 2);
INSERT INTO OpenCourses VALUES(200708, 4);


/* CASE式の中で集約関数を使う */
CREATE TABLE StudentClub
(std_id  INTEGER,
 club_id INTEGER,
 club_name VARCHAR(32),
 main_club_flg CHAR(1),
 PRIMARY KEY (std_id, club_id));

INSERT INTO StudentClub VALUES(100, 1, '野球',        'Y');
INSERT INTO StudentClub VALUES(100, 2, '吹奏楽',      'N');
INSERT INTO StudentClub VALUES(200, 2, '吹奏楽',      'N');
INSERT INTO StudentClub VALUES(200, 3, 'バドミントン','Y');
INSERT INTO StudentClub VALUES(200, 4, 'サッカー',    'N');
INSERT INTO StudentClub VALUES(300, 4, 'サッカー',    'N');
INSERT INTO StudentClub VALUES(400, 5, '水泳',        'N');
INSERT INTO StudentClub VALUES(500, 6, '囲碁',        'N');

CREATE TABLE Products
(name VARCHAR(16) PRIMARY KEY,
 price INTEGER NOT NULL);

--重複順列・順列・組み合わせ
INSERT INTO Products VALUES('りんご',	100);
INSERT INTO Products VALUES('みかん',	50);
INSERT INTO Products VALUES('バナナ',	80);

--部分的に不一致なキーの検索
CREATE TABLE Addresses
(name VARCHAR(32),
 family_id INTEGER,
 address VARCHAR(32),
 PRIMARY KEY(name, family_id));

INSERT INTO Addresses VALUES('前田 義明', '100', '東京都港区虎ノ門3-2-29');
INSERT INTO Addresses VALUES('前田 由美', '100', '東京都港区虎ノ門3-2-92');
INSERT INTO Addresses VALUES('加藤 茶',   '200', '東京都新宿区西新宿2-8-1');
INSERT INTO Addresses VALUES('加藤 勝',   '200', '東京都新宿区西新宿2-8-1');
INSERT INTO Addresses VALUES('ホームズ',  '300', 'ベーカー街221B');
INSERT INTO Addresses VALUES('ワトソン',  '400', 'ベーカー街221B');

--ランキング
DELETE FROM Products;
INSERT INTO Products VALUES('りんご',	50);
INSERT INTO Products VALUES('みかん',	100);
INSERT INTO Products VALUES('ぶどう',	50);
INSERT INTO Products VALUES('スイカ',	80);
INSERT INTO Products VALUES('レモン',	30);
INSERT INTO Products VALUES('バナナ',	50);

--非集約テスト用
DELETE FROM Products;
INSERT INTO Products VALUES('みかん',	100);
INSERT INTO Products VALUES('ぶどう',	50);
INSERT INTO Products VALUES('スイカ',	80);
INSERT INTO Products VALUES('レモン',	30);

/* 実践編：１. 比較述語とNULL　その１：排中律が成立しない */
CREATE TABLE Students
(name VARCHAR(16) PRIMARY KEY,
 age  INTEGER );

INSERT INTO Students VALUES('ブラウン', 22);
INSERT INTO Students VALUES('ラリー',   19);
INSERT INTO Students VALUES('ジョン',   NULL);
INSERT INTO Students VALUES('ボギー', 21);


/* 実践編：３. NOT IN とNOT EXISTS は同値ではない */
CREATE TABLE Class_A
(name VARCHAR(16) PRIMARY KEY,
 age  INTEGER,
 city VARCHAR(16) NOT NULL );

CREATE TABLE Class_B
(name VARCHAR(16) PRIMARY KEY,
 age  INTEGER,
 city VARCHAR(16) NOT NULL );

INSERT INTO Class_A VALUES('ブラウン', 22, '東京');
INSERT INTO Class_A VALUES('ラリー',   19, '埼玉');
INSERT INTO Class_A VALUES('ボギー',   21, '千葉');

INSERT INTO Class_B VALUES('斎藤',  22,   '東京');
INSERT INTO Class_B VALUES('田尻',  23,   '東京');
INSERT INTO Class_B VALUES('山田',  NULL, '東京');
INSERT INTO Class_B VALUES('和泉',  18,   '千葉');
INSERT INTO Class_B VALUES('武田',  20,   '千葉');
INSERT INTO Class_B VALUES('石川',  19,   '神奈川');


/* 実践編：4．限定述語とNULL */
DELETE FROM Class_A;
INSERT INTO Class_A VALUES('ブラウン', 22, '東京');
INSERT INTO Class_A VALUES('ラリー',   19, '埼玉');
INSERT INTO Class_A VALUES('ボギー',   21, '千葉');

DELETE FROM Class_B;
INSERT INTO Class_B VALUES('斎藤', 22, '東京');
INSERT INTO Class_B VALUES('田尻', 23, '東京');
INSERT INTO Class_B VALUES('山田', 20, '東京');
INSERT INTO Class_B VALUES('和泉', 18, '千葉');
INSERT INTO Class_B VALUES('武田', 20, '千葉');
INSERT INTO Class_B VALUES('石川', 19, '神奈川');


/* 実践編：5．限定述語と極値関数は同値ではない */
DELETE FROM Class_B;
INSERT INTO Class_B VALUES('和泉', 18, '千葉');
INSERT INTO Class_B VALUES('武田', 20, '千葉');
INSERT INTO Class_B VALUES('石川', 19, '神奈川');

/* データの歯抜けを探す */
CREATE TABLE SeqTbl
(seq  INTEGER PRIMARY KEY,
 name VARCHAR(16) NOT NULL);

INSERT INTO SeqTbl VALUES(1,	'ディック');
INSERT INTO SeqTbl VALUES(2,	'アン');
INSERT INTO SeqTbl VALUES(3,	'ライル');
INSERT INTO SeqTbl VALUES(5,	'カー');
INSERT INTO SeqTbl VALUES(6,	'マリー');
INSERT INTO SeqTbl VALUES(8,	'ベン');


/* HAVING 句でサブクエリ：最頻値を求める(メジアンも同じサンプルを使用) */
CREATE TABLE Graduates
(name   VARCHAR(16) PRIMARY KEY,
 income INTEGER NOT NULL);

INSERT INTO Graduates VALUES('サンプソン', 400000);
INSERT INTO Graduates VALUES('マイク',     30000);
INSERT INTO Graduates VALUES('ホワイト',   20000);
INSERT INTO Graduates VALUES('アーノルド', 20000);
INSERT INTO Graduates VALUES('スミス',     20000);
INSERT INTO Graduates VALUES('ロレンス',   15000);
INSERT INTO Graduates VALUES('ハドソン',   15000);
INSERT INTO Graduates VALUES('ケント',     10000);
INSERT INTO Graduates VALUES('ベッカー',   10000);
INSERT INTO Graduates VALUES('スコット',   10000);


/* NULL を含まない集合を探す */
CREATE TABLE Students
(student_id   INTEGER PRIMARY KEY,
 dpt          VARCHAR(16) NOT NULL,
 sbmt_date    DATE);

INSERT INTO Students VALUES(100,  '理学部',   '2005-10-10');
INSERT INTO Students VALUES(101,  '理学部',   '2005-09-22');
INSERT INTO Students VALUES(102,  '文学部',   NULL);
INSERT INTO Students VALUES(103,  '文学部',   '2005-09-10');
INSERT INTO Students VALUES(200,  '文学部',   '2005-09-22');
INSERT INTO Students VALUES(201,  '工学部',   NULL);
INSERT INTO Students VALUES(202,  '経済学部', '2005-09-25');


/* 関係除算でバスケット解析 */
CREATE TABLE Items
(item VARCHAR(16) PRIMARY KEY);
 
CREATE TABLE ShopItems
(shop VARCHAR(16),
 item VARCHAR(16),
    PRIMARY KEY(shop, item));

INSERT INTO Items VALUES('ビール');
INSERT INTO Items VALUES('紙オムツ');
INSERT INTO Items VALUES('自転車');

INSERT INTO ShopItems VALUES('仙台',  'ビール');
INSERT INTO ShopItems VALUES('仙台',  '紙オムツ');
INSERT INTO ShopItems VALUES('仙台',  '自転車');
INSERT INTO ShopItems VALUES('仙台',  'カーテン');
INSERT INTO ShopItems VALUES('東京',  'ビール');
INSERT INTO ShopItems VALUES('東京',  '紙オムツ');
INSERT INTO ShopItems VALUES('東京',  '自転車');
INSERT INTO ShopItems VALUES('大阪',  'テレビ');
INSERT INTO ShopItems VALUES('大阪',  '紙オムツ');
INSERT INTO ShopItems VALUES('大阪',  '自転車');

/* 外部結合で行列変換　その1（行→列）：クロス表を作る */
CREATE TABLE Courses
(name   VARCHAR(32), 
 course VARCHAR(32), 
 PRIMARY KEY(name, course));

INSERT INTO Courses VALUES('赤井', 'SQL入門');
INSERT INTO Courses VALUES('赤井', 'UNIX基礎');
INSERT INTO Courses VALUES('鈴木', 'SQL入門');
INSERT INTO Courses VALUES('工藤', 'SQL入門');
INSERT INTO Courses VALUES('工藤', 'Java中級');
INSERT INTO Courses VALUES('吉田', 'UNIX基礎');
INSERT INTO Courses VALUES('渡辺', 'SQL入門');

/* 外部結合で行列変換　その2（列→行）：繰り返し項目を1 列にまとめる */
CREATE TABLE Personnel
 (employee   varchar(32), 
  child_1    varchar(32), 
  child_2    varchar(32), 
  child_3    varchar(32), 
  PRIMARY KEY(employee));

INSERT INTO Personnel VALUES('赤井', '一郎', '二郎', '三郎');
INSERT INTO Personnel VALUES('工藤', '春子', '夏子', NULL);
INSERT INTO Personnel VALUES('鈴木', '夏子', NULL,   NULL);
INSERT INTO Personnel VALUES('吉田', NULL,   NULL,   NULL);

/* クロス表で入れ子の表側を作る */
CREATE TABLE TblSex
(sex_cd   char(1), 
 sex varchar(5), 
 PRIMARY KEY(sex_cd));

CREATE TABLE TblAge 
(age_class char(1), 
 age_range varchar(30), 
 PRIMARY KEY(age_class));

CREATE TABLE TblPop 
(pref_name  varchar(30), 
 age_class  char(1), 
 sex_cd     char(1), 
 population integer, 
 PRIMARY KEY(pref_name, age_class,sex_cd));

INSERT INTO TblSex (sex_cd, sex ) VALUES('m',	'男');
INSERT INTO TblSex (sex_cd, sex ) VALUES('f',	'女');

INSERT INTO TblAge (age_class, age_range ) VALUES('1',	'21～30歳');
INSERT INTO TblAge (age_class, age_range ) VALUES('2',	'31～40歳');
INSERT INTO TblAge (age_class, age_range ) VALUES('3',	'41～50歳');

INSERT INTO TblPop VALUES('秋田', '1', 'm', 400 );
INSERT INTO TblPop VALUES('秋田', '3', 'm', 1000 );
INSERT INTO TblPop VALUES('秋田', '1', 'f', 800 );
INSERT INTO TblPop VALUES('秋田', '3', 'f', 1000 );
INSERT INTO TblPop VALUES('青森', '1', 'm', 700 );
INSERT INTO TblPop VALUES('青森', '1', 'f', 500 );
INSERT INTO TblPop VALUES('青森', '3', 'f', 800 );
INSERT INTO TblPop VALUES('東京', '1', 'm', 900 );
INSERT INTO TblPop VALUES('東京', '1', 'f', 1500 );
INSERT INTO TblPop VALUES('東京', '3', 'f', 1200 );
INSERT INTO TblPop VALUES('千葉', '1', 'm', 900 );
INSERT INTO TblPop VALUES('千葉', '1', 'f', 1000 );
INSERT INTO TblPop VALUES('千葉', '3', 'f', 900 );

/* 掛け算としての結合 */
CREATE TABLE Items
 (item_no INTEGER PRIMARY KEY,
  item    VARCHAR(32) NOT NULL);

INSERT INTO Items VALUES(10, 'FD');
INSERT INTO Items VALUES(20, 'CD-R');
INSERT INTO Items VALUES(30, 'MO');
INSERT INTO Items VALUES(40, 'DVD');

CREATE TABLE SalesHistory
 (sale_date DATE NOT NULL,
  item_no   INTEGER NOT NULL,
  quantity  INTEGER NOT NULL,
  PRIMARY KEY(sale_date, item_no));

INSERT INTO SalesHistory VALUES('2007-10-01',  10,  4);
INSERT INTO SalesHistory VALUES('2007-10-01',  20, 10);
INSERT INTO SalesHistory VALUES('2007-10-01',  30,  3);
INSERT INTO SalesHistory VALUES('2007-10-03',  10, 32);
INSERT INTO SalesHistory VALUES('2007-10-03',  30, 12);
INSERT INTO SalesHistory VALUES('2007-10-04',  20, 22);
INSERT INTO SalesHistory VALUES('2007-10-04',  30,  7);

/* 完全外部結合 */
CREATE TABLE Class_A
(id char(1), 
 name varchar(30), 
 PRIMARY KEY(id));

CREATE TABLE Class_B
(id   char(1), 
 name varchar(30), 
 PRIMARY KEY(id));

INSERT INTO Class_A (id, name) VALUES('1', '田中');
INSERT INTO Class_A (id, name) VALUES('2', '鈴木');
INSERT INTO Class_A (id, name) VALUES('3', '伊集院');

INSERT INTO Class_B (id, name) VALUES('1', '田中');
INSERT INTO Class_B (id, name) VALUES('2', '鈴木');
INSERT INTO Class_B (id, name) VALUES('4', '西園寺');

--成長・後退・現状維持
CREATE TABLE Sales
(year INTEGER NOT NULL , 
 sale INTEGER NOT NULL ,
 PRIMARY KEY (year));

INSERT INTO Sales VALUES (1990, 50);
INSERT INTO Sales VALUES (1991, 51);
INSERT INTO Sales VALUES (1992, 52);
INSERT INTO Sales VALUES (1993, 52);
INSERT INTO Sales VALUES (1994, 50);
INSERT INTO Sales VALUES (1995, 50);
INSERT INTO Sales VALUES (1996, 49);
INSERT INTO Sales VALUES (1997, 55);

--時系列に歯抜けがある場合：直近と比較
CREATE TABLE Sales2
(year INTEGER NOT NULL , 
 sale INTEGER NOT NULL , 
 PRIMARY KEY (year));

INSERT INTO Sales2 VALUES (1990, 50);
INSERT INTO Sales2 VALUES (1992, 50);
INSERT INTO Sales2 VALUES (1993, 52);
INSERT INTO Sales2 VALUES (1994, 55);
INSERT INTO Sales2 VALUES (1997, 55);

--移動累計と移動平均
CREATE TABLE Accounts
(prc_date DATE NOT NULL , 
 prc_amt  INTEGER NOT NULL , 
 PRIMARY KEY (prc_date)) ;

INSERT INTO Accounts VALUES ('2006-10-26',  12000 );
INSERT INTO Accounts VALUES ('2006-10-28',   2500 );
INSERT INTO Accounts VALUES ('2006-10-31', -15000 );
INSERT INTO Accounts VALUES ('2006-11-03',  34000 );
INSERT INTO Accounts VALUES ('2006-11-04',  -5000 );
INSERT INTO Accounts VALUES ('2006-11-06',   7200 );
INSERT INTO Accounts VALUES ('2006-11-11',  11000 );

--オーバーラップする期間を調べる
CREATE TABLE Reservations
(reserver    VARCHAR(30) PRIMARY KEY,
 start_date  DATE  NOT NULL,
 end_date    DATE  NOT NULL);

INSERT INTO Reservations VALUES('木村', '2006-10-26', '2006-10-27');
INSERT INTO Reservations VALUES('荒木', '2006-10-28', '2006-10-31');
INSERT INTO Reservations VALUES('堀',   '2006-10-31', '2006-11-01');
INSERT INTO Reservations VALUES('山本', '2006-11-03', '2006-11-04');
INSERT INTO Reservations VALUES('内田', '2006-11-03', '2006-11-05');
INSERT INTO Reservations VALUES('水谷', '2006-11-06', '2006-11-06');

--山本氏の投宿日が4日の場合
DELETE FROM Reservations WHERE reserver = '山本';
INSERT INTO Reservations VALUES('山本', '2006-11-04', '2006-11-04');

/* テーブル同士のコンペア　集合の相等性チェック */
CREATE TABLE Tbl_A
 (keycol  CHAR(1) PRIMARY KEY,
  col_1   INTEGER , 
  col_2   INTEGER, 
  col_3   INTEGER);

CREATE TABLE Tbl_B
 (keycol  CHAR(1) PRIMARY KEY,
  col_1   INTEGER, 
  col_2   INTEGER, 
  col_3   INTEGER);

/* 等しいテーブル同士のケース */
DELETE FROM Tbl_A;
INSERT INTO Tbl_A VALUES('A', 2, 3, 4);
INSERT INTO Tbl_A VALUES('B', 0, 7, 9);
INSERT INTO Tbl_A VALUES('C', 5, 1, 6);

DELETE FROM Tbl_B;
INSERT INTO Tbl_B VALUES('A', 2, 3, 4);
INSERT INTO Tbl_B VALUES('B', 0, 7, 9);
INSERT INTO Tbl_B VALUES('C', 5, 1, 6);


/* 「B」の行が相違するケース */
DELETE FROM Tbl_A;
INSERT INTO Tbl_A VALUES('A', 2, 3, 4);
INSERT INTO Tbl_A VALUES('B', 0, 7, 9);
INSERT INTO Tbl_A VALUES('C', 5, 1, 6);

DELETE FROM Tbl_B;
INSERT INTO Tbl_B VALUES('A', 2, 3, 4);
INSERT INTO Tbl_B VALUES('B', 0, 7, 8);
INSERT INTO Tbl_B VALUES('C', 5, 1, 6);


/* NULLを含むケース（等しい） */
DELETE FROM Tbl_A;
INSERT INTO Tbl_A VALUES('A', NULL, 3, 4);
INSERT INTO Tbl_A VALUES('B', 0, 7, 9);
INSERT INTO Tbl_A VALUES('C', NULL, NULL, NULL);

DELETE FROM Tbl_B;
INSERT INTO Tbl_B VALUES('A', NULL, 3, 4);
INSERT INTO Tbl_B VALUES('B', 0, 7, 9);
INSERT INTO Tbl_B VALUES('C', NULL, NULL, NULL);


/* NULLを含むケース（「C」の行が異なる） */
DELETE FROM Tbl_A;
INSERT INTO Tbl_A VALUES('A', NULL, 3, 4);
INSERT INTO Tbl_A VALUES('B', 0, 7, 9);
INSERT INTO Tbl_A VALUES('C', NULL, NULL, NULL);

DELETE FROM Tbl_B;
INSERT INTO Tbl_B VALUES('A', NULL, 3, 4);
INSERT INTO Tbl_B VALUES('B', 0, 7, 9);
INSERT INTO Tbl_B VALUES('C', 0, NULL, NULL);


/* 3. 差集合で関係除算を表現する */
CREATE TABLE Skills 
(skill VARCHAR(32),
 PRIMARY KEY(skill));

CREATE TABLE EmpSkills 
(emp   VARCHAR(32), 
 skill VARCHAR(32),
 PRIMARY KEY(emp, skill));

INSERT INTO Skills VALUES('Oracle');
INSERT INTO Skills VALUES('UNIX');
INSERT INTO Skills VALUES('Java');

INSERT INTO EmpSkills VALUES('相田', 'Oracle');
INSERT INTO EmpSkills VALUES('相田', 'UNIX');
INSERT INTO EmpSkills VALUES('相田', 'Java');
INSERT INTO EmpSkills VALUES('相田', 'C#');
INSERT INTO EmpSkills VALUES('神崎', 'Oracle');
INSERT INTO EmpSkills VALUES('神崎', 'UNIX');
INSERT INTO EmpSkills VALUES('神崎', 'Java');
INSERT INTO EmpSkills VALUES('平井', 'UNIX');
INSERT INTO EmpSkills VALUES('平井', 'Oracle');
INSERT INTO EmpSkills VALUES('平井', 'PHP');
INSERT INTO EmpSkills VALUES('平井', 'Perl');
INSERT INTO EmpSkills VALUES('平井', 'C++');
INSERT INTO EmpSkills VALUES('若田部', 'Perl');
INSERT INTO EmpSkills VALUES('渡来', 'Oracle');

/* 4. 等しい部分集合を見つける */
CREATE TABLE SupParts
(sup  CHAR(32) NOT NULL,
 part CHAR(32) NOT NULL,
 PRIMARY KEY(sup, part));

INSERT INTO SupParts VALUES('A',  'ボルト');
INSERT INTO SupParts VALUES('A',  'ナット');
INSERT INTO SupParts VALUES('A',  'パイプ');
INSERT INTO SupParts VALUES('B',  'ボルト');
INSERT INTO SupParts VALUES('B',  'パイプ');
INSERT INTO SupParts VALUES('C',  'ボルト');
INSERT INTO SupParts VALUES('C',  'ナット');
INSERT INTO SupParts VALUES('C',  'パイプ');
INSERT INTO SupParts VALUES('D',  'ボルト');
INSERT INTO SupParts VALUES('D',  'パイプ');
INSERT INTO SupParts VALUES('E',  'ヒューズ');
INSERT INTO SupParts VALUES('E',  'ナット');
INSERT INTO SupParts VALUES('E',  'パイプ');
INSERT INTO SupParts VALUES('F',  'ヒューズ');

/* 5. 重複行を削除する高速なクエリ
PostgreSQLでは「with oids」をCREATE TABLE文の最後に追加すること */
CREATE TABLE Products
(name  CHAR(16),
 price INTEGER);

INSERT INTO Products VALUES('りんご',  50);
INSERT INTO Products VALUES('みかん', 100);
INSERT INTO Products VALUES('みかん', 100);
INSERT INTO Products VALUES('みかん', 100);
INSERT INTO Products VALUES('バナナ',  80);

/* テーブルに存在「しない」データを探す */
CREATE TABLE Meetings
(meeting CHAR(32) NOT NULL,
 person  CHAR(32) NOT NULL,
 PRIMARY KEY (meeting, person));

INSERT INTO Meetings VALUES('第１回', '伊藤');
INSERT INTO Meetings VALUES('第１回', '水島');
INSERT INTO Meetings VALUES('第１回', '坂東');
INSERT INTO Meetings VALUES('第２回', '伊藤');
INSERT INTO Meetings VALUES('第２回', '宮田');
INSERT INTO Meetings VALUES('第３回', '坂東');
INSERT INTO Meetings VALUES('第３回', '水島');
INSERT INTO Meetings VALUES('第３回', '宮田');

/* 全称量化　その１：肯定⇔二重否定の変換に慣れよう */
CREATE TABLE TestScores
(student_id INTEGER,
 subject    VARCHAR(32) ,
 score      INTEGER,
  PRIMARY KEY(student_id, subject));

INSERT INTO TestScores VALUES(100, '算数',100);
INSERT INTO TestScores VALUES(100, '国語',80);
INSERT INTO TestScores VALUES(100, '理科',80);
INSERT INTO TestScores VALUES(200, '算数',80);
INSERT INTO TestScores VALUES(200, '国語',95);
INSERT INTO TestScores VALUES(300, '算数',40);
INSERT INTO TestScores VALUES(300, '国語',90);
INSERT INTO TestScores VALUES(300, '社会',55);
INSERT INTO TestScores VALUES(400, '算数',80);

/* 全称量化　その２：集合VS 述語――凄いのはどっちだ？ */
CREATE TABLE Projects
(project_id VARCHAR(32),
 step_nbr   INTEGER ,
 status     VARCHAR(32),
  PRIMARY KEY(project_id, step_nbr));

INSERT INTO Projects VALUES('AA100', 0, '完了');
INSERT INTO Projects VALUES('AA100', 1, '待機');
INSERT INTO Projects VALUES('AA100', 2, '待機');
INSERT INTO Projects VALUES('B200',  0, '待機');
INSERT INTO Projects VALUES('B200',  1, '待機');
INSERT INTO Projects VALUES('CS300', 0, '完了');
INSERT INTO Projects VALUES('CS300', 1, '完了');
INSERT INTO Projects VALUES('CS300', 2, '待機');
INSERT INTO Projects VALUES('CS300', 3, '待機');
INSERT INTO Projects VALUES('DY400', 0, '完了');
INSERT INTO Projects VALUES('DY400', 1, '完了');
INSERT INTO Projects VALUES('DY400', 2, '完了');

/* 列に対する量化：オール１の行を探せ */
CREATE TABLE ArrayTbl
 (keycol CHAR(1) PRIMARY KEY,
  col1  INTEGER,
  col2  INTEGER,
  col3  INTEGER,
  col4  INTEGER,
  col5  INTEGER,
  col6  INTEGER,
  col7  INTEGER,
  col8  INTEGER,
  col9  INTEGER,
  col10 INTEGER);

--オールNULL
INSERT INTO ArrayTbl VALUES('A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ArrayTbl VALUES('B', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
--オール1
INSERT INTO ArrayTbl VALUES('C', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
--少なくとも一つは9
INSERT INTO ArrayTbl VALUES('D', NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ArrayTbl VALUES('E', NULL, 3, NULL, 1, 9, NULL, NULL, 9, NULL, NULL);

--連番を作ろう
CREATE TABLE Digits
 (digit INTEGER PRIMARY KEY); 

INSERT INTO Digits VALUES (0);
INSERT INTO Digits VALUES (1);
INSERT INTO Digits VALUES (2);
INSERT INTO Digits VALUES (3);
INSERT INTO Digits VALUES (4);
INSERT INTO Digits VALUES (5);
INSERT INTO Digits VALUES (6);
INSERT INTO Digits VALUES (7);
INSERT INTO Digits VALUES (8);
INSERT INTO Digits VALUES (9);

--欠番を全部求める
CREATE TABLE SeqTbl
 (seq INTEGER PRIMARY KEY); 

INSERT INTO SeqTbl VALUES (1);
INSERT INTO SeqTbl VALUES (2);
INSERT INTO SeqTbl VALUES (4);
INSERT INTO SeqTbl VALUES (5);
INSERT INTO SeqTbl VALUES (6);
INSERT INTO SeqTbl VALUES (7);
INSERT INTO SeqTbl VALUES (8);
INSERT INTO SeqTbl VALUES (11);
INSERT INTO SeqTbl VALUES (12);

--3人なんですけど、座れますか？
CREATE TABLE Seats
(seat   INTEGER NOT NULL  PRIMARY KEY,
 status CHAR(2) NOT NULL
 CHECK (status IN ('空', '占')) ); 

INSERT INTO Seats VALUES (1,  '占');
INSERT INTO Seats VALUES (2,  '占');
INSERT INTO Seats VALUES (3,  '空');
INSERT INTO Seats VALUES (4,  '空');
INSERT INTO Seats VALUES (5,  '空');
INSERT INTO Seats VALUES (6,  '占');
INSERT INTO Seats VALUES (7,  '空');
INSERT INTO Seats VALUES (8,  '空');
INSERT INTO Seats VALUES (9,  '空');
INSERT INTO Seats VALUES (10, '空');
INSERT INTO Seats VALUES (11, '空');
INSERT INTO Seats VALUES (12, '占');
INSERT INTO Seats VALUES (13, '占');
INSERT INTO Seats VALUES (14, '空');
INSERT INTO Seats VALUES (15, '空');

--折り返しも考慮
CREATE TABLE Seats2
 ( seat   INTEGER NOT NULL  PRIMARY KEY,
   row_id CHAR(1) NOT NULL,
   status CHAR(2) NOT NULL
     CHECK (status IN ('空', '占')) ); 

INSERT INTO Seats2 VALUES (1, 'A', '占');
INSERT INTO Seats2 VALUES (2, 'A', '占');
INSERT INTO Seats2 VALUES (3, 'A', '空');
INSERT INTO Seats2 VALUES (4, 'A', '空');
INSERT INTO Seats2 VALUES (5, 'A', '空');
INSERT INTO Seats2 VALUES (6, 'B', '占');
INSERT INTO Seats2 VALUES (7, 'B', '占');
INSERT INTO Seats2 VALUES (8, 'B', '空');
INSERT INTO Seats2 VALUES (9, 'B', '空');
INSERT INTO Seats2 VALUES (10,'B', '空');
INSERT INTO Seats2 VALUES (11,'C', '空');
INSERT INTO Seats2 VALUES (12,'C', '空');
INSERT INTO Seats2 VALUES (13,'C', '空');
INSERT INTO Seats2 VALUES (14,'C', '占');
INSERT INTO Seats2 VALUES (15,'C', '空');

--最大何人まで座れますか？
CREATE TABLE Seats3
 ( seat   INTEGER NOT NULL  PRIMARY KEY,
   status CHAR(2) NOT NULL
     CHECK (status IN ('空', '占')) ); 

INSERT INTO Seats3 VALUES (1,  '占');
INSERT INTO Seats3 VALUES (2,  '空');
INSERT INTO Seats3 VALUES (3,  '空');
INSERT INTO Seats3 VALUES (4,  '空');
INSERT INTO Seats3 VALUES (5,  '空');
INSERT INTO Seats3 VALUES (6,  '占');
INSERT INTO Seats3 VALUES (7,  '空');
INSERT INTO Seats3 VALUES (8,  '占');
INSERT INTO Seats3 VALUES (9,  '空');
INSERT INTO Seats3 VALUES (10, '空');

--単調増加と単調減少
CREATE TABLE MyStock
 (deal_date  DATE PRIMARY KEY,
  price      INTEGER ); 

INSERT INTO MyStock VALUES ('2007-01-06', 1000);
INSERT INTO MyStock VALUES ('2007-01-08', 1050);
INSERT INTO MyStock VALUES ('2007-01-09', 1050);
INSERT INTO MyStock VALUES ('2007-01-12', 900);
INSERT INTO MyStock VALUES ('2007-01-13', 880);
INSERT INTO MyStock VALUES ('2007-01-14', 870);
INSERT INTO MyStock VALUES ('2007-01-16', 920);
INSERT INTO MyStock VALUES ('2007-01-17', 1000);

/* 連番を作ろう（2進数から10進数へ変換）*/
CREATE TABLE Digits
 (digit INTEGER PRIMARY KEY); 

INSERT INTO Digits VALUES (0);
INSERT INTO Digits VALUES (1);

/* 0～31まで取得 */
SELECT D1.digit + D2.digit * 2 + D3.digit * 4 + D4.digit * 8 + D5.digit * 16 AS seq
  FROM Digits D1, Digits D2, Digits D3, Digits D4, Digits D5
 ORDER BY seq;
 
 --各隊、総員点呼！
CREATE TABLE Teams
(member  CHAR(12) NOT NULL PRIMARY KEY,
 team_id INTEGER  NOT NULL,
 status  CHAR(8)  NOT NULL);

INSERT INTO Teams VALUES('ジョー',   1, '待機');
INSERT INTO Teams VALUES('ケン',     1, '出動中');
INSERT INTO Teams VALUES('ミック',   1, '待機');
INSERT INTO Teams VALUES('カレン',   2, '出動中');
INSERT INTO Teams VALUES('キース',   2, '休暇');
INSERT INTO Teams VALUES('ジャン',   3, '待機');
INSERT INTO Teams VALUES('ハート',   3, '待機');
INSERT INTO Teams VALUES('ディック', 3, '待機');
INSERT INTO Teams VALUES('ベス',     4, '待機');
INSERT INTO Teams VALUES('アレン',   5, '出動中');
INSERT INTO Teams VALUES('ロバート', 5, '休暇');
INSERT INTO Teams VALUES('ケーガン', 5, '待機');

--一意集合と多重集合
CREATE TABLE Materials
(center         CHAR(12) NOT NULL,
 receive_date   DATE     NOT NULL,
 material       CHAR(12) NOT NULL,
 PRIMARY KEY(center, receive_date));

INSERT INTO Materials VALUES('東京'	,'2007-4-01',	'錫');
INSERT INTO Materials VALUES('東京'	,'2007-4-12',	'亜鉛');
INSERT INTO Materials VALUES('東京'	,'2007-5-17',	'アルミニウム');
INSERT INTO Materials VALUES('東京'	,'2007-5-20',	'亜鉛');
INSERT INTO Materials VALUES('大阪'	,'2007-4-20',	'銅');
INSERT INTO Materials VALUES('大阪'	,'2007-4-22',	'ニッケル');
INSERT INTO Materials VALUES('大阪'	,'2007-4-29',	'鉛');
INSERT INTO Materials VALUES('名古屋',	'2007-3-15',	'チタン');
INSERT INTO Materials VALUES('名古屋',	'2007-4-01',	'炭素鋼');
INSERT INTO Materials VALUES('名古屋',	'2007-4-24',	'炭素鋼');
INSERT INTO Materials VALUES('名古屋',	'2007-5-02',	'マグネシウム');
INSERT INTO Materials VALUES('名古屋',	'2007-5-10',	'チタン');
INSERT INTO Materials VALUES('福岡'	,'2007-5-10',	'亜鉛');
INSERT INTO Materials VALUES('福岡'	,'2007-5-28',	'錫');

--欠番を探せ：発展版
CREATE TABLE SeqTbl
( seq INTEGER NOT NULL PRIMARY KEY);

--歯抜けなし：開始値が1
DELETE FROM SeqTbl;
INSERT INTO SeqTbl VALUES(1);
INSERT INTO SeqTbl VALUES(2);
INSERT INTO SeqTbl VALUES(3);
INSERT INTO SeqTbl VALUES(4);
INSERT INTO SeqTbl VALUES(5);

--歯抜けあり：開始値が1
DELETE FROM SeqTbl;
INSERT INTO SeqTbl VALUES(1);
INSERT INTO SeqTbl VALUES(2);
INSERT INTO SeqTbl VALUES(4);
INSERT INTO SeqTbl VALUES(5);
INSERT INTO SeqTbl VALUES(8);

--歯抜けなし：開始値が1ではない
DELETE FROM SeqTbl;
INSERT INTO SeqTbl VALUES(3);
INSERT INTO SeqTbl VALUES(4);
INSERT INTO SeqTbl VALUES(5);
INSERT INTO SeqTbl VALUES(6);
INSERT INTO SeqTbl VALUES(7);

--歯抜けあり：開始値が1ではない
DELETE FROM SeqTbl;
INSERT INTO SeqTbl VALUES(3);
INSERT INTO SeqTbl VALUES(4);
INSERT INTO SeqTbl VALUES(7);
INSERT INTO SeqTbl VALUES(8);
INSERT INTO SeqTbl VALUES(10);

--集合にきめ細かな条件を設定する
CREATE TABLE TestResults
(student CHAR(12) NOT NULL PRIMARY KEY,
 class   CHAR(1)  NOT NULL,
 sex     CHAR(1)  NOT NULL,
 score   INTEGER  NOT NULL);

INSERT INTO TestResults VALUES('001', 'A', '男', 100);
INSERT INTO TestResults VALUES('002', 'A', '女', 100);
INSERT INTO TestResults VALUES('003', 'A', '女',  49);
INSERT INTO TestResults VALUES('004', 'A', '男',  30);
INSERT INTO TestResults VALUES('005', 'B', '女', 100);
INSERT INTO TestResults VALUES('006', 'B', '男',  92);
INSERT INTO TestResults VALUES('007', 'B', '男',  80);
INSERT INTO TestResults VALUES('008', 'B', '男',  80);
INSERT INTO TestResults VALUES('009', 'B', '女',  10);
INSERT INTO TestResults VALUES('010', 'C', '男',  92);
INSERT INTO TestResults VALUES('011', 'C', '男',  80);
INSERT INTO TestResults VALUES('012', 'C', '女',  21);
INSERT INTO TestResults VALUES('013', 'D', '女', 100);
INSERT INTO TestResults VALUES('014', 'D', '女',   0);
INSERT INTO TestResults VALUES('015', 'D', '女',   0);

CREATE TABLE Teams
(member VARCHAR(32) PRIMARY KEY,
 team   CHAR(1)     NOT NULL,
 age    INTEGER     NOT NULL);

INSERT INTO Teams VALUES('大木',	'A',	28);
INSERT INTO Teams VALUES('逸見',	'A',	19);
INSERT INTO Teams VALUES('新藤',	'A',	23);
INSERT INTO Teams VALUES('山田',	'B',	40);
INSERT INTO Teams VALUES('久本',	'B',	29);
INSERT INTO Teams VALUES('橋田',	'C',	30);
INSERT INTO Teams VALUES('野々宮',      'D',	28);
INSERT INTO Teams VALUES('鬼塚',	'D',	28);
INSERT INTO Teams VALUES('加藤',	'D',	24);
INSERT INTO Teams VALUES('新城',	'D',	22);

CREATE TABLE Natural
(num INTEGER  NOT NULL PRIMARY KEY);

INSERT INTO Natural VALUES(0);
INSERT INTO Natural VALUES(1);
INSERT INTO Natural VALUES(2);
INSERT INTO Natural VALUES(3);
INSERT INTO Natural VALUES(4);
INSERT INTO Natural VALUES(5);
INSERT INTO Natural VALUES(6);
INSERT INTO Natural VALUES(7);
INSERT INTO Natural VALUES(8);
INSERT INTO Natural VALUES(9);
INSERT INTO Natural VALUES(10);

/* 演習問題1-1：複数列の最大値（1-3とも兼用） */
CREATE TABLE Greatests
(key CHAR(1) PRIMARY KEY,
 x   INTEGER NOT NULL,
 y   INTEGER NOT NULL,
 z   INTEGER NOT NULL);

INSERT INTO Greatests VALUES('A', 1, 2, 3);
INSERT INTO Greatests VALUES('B', 5, 5, 2);
INSERT INTO Greatests VALUES('C', 4, 7, 1);
INSERT INTO Greatests VALUES('D', 3, 3, 8);

/* 演習問題2-2：地域ごとのランキング */
CREATE TABLE DistrictProducts
(district  VARCHAR(16) NOT NULL,
 name      VARCHAR(16) NOT NULL,
 price     INTEGER NOT NULL,
 PRIMARY KEY(district, name));

INSERT INTO DistrictProducts VALUES('東北', 'みかん',	100);
INSERT INTO DistrictProducts VALUES('東北', 'りんご',	50);
INSERT INTO DistrictProducts VALUES('東北', 'ぶどう',	50);
INSERT INTO DistrictProducts VALUES('東北', 'レモン',	30);
INSERT INTO DistrictProducts VALUES('関東', 'レモン',	100);
INSERT INTO DistrictProducts VALUES('関東', 'パイン',	100);
INSERT INTO DistrictProducts VALUES('関東', 'りんご',	100);
INSERT INTO DistrictProducts VALUES('関東', 'ぶどう',	70);
INSERT INTO DistrictProducts VALUES('関西', 'レモン',	70);
INSERT INTO DistrictProducts VALUES('関西', 'スイカ',	30);
INSERT INTO DistrictProducts VALUES('関西', 'りんご',	20);

/* 演習問題2-3：ランキングの更新 */
CREATE TABLE DistrictProducts2
(district  VARCHAR(16) NOT NULL,
 name      VARCHAR(16) NOT NULL,
 price     INTEGER NOT NULL,
 ranking   INTEGER,
 PRIMARY KEY(district, name));

INSERT INTO DistrictProducts2 VALUES('東北', 'みかん',	100, NULL);
INSERT INTO DistrictProducts2 VALUES('東北', 'りんご',	50 , NULL);
INSERT INTO DistrictProducts2 VALUES('東北', 'ぶどう',	50 , NULL);
INSERT INTO DistrictProducts2 VALUES('東北', 'レモン',	30 , NULL);
INSERT INTO DistrictProducts2 VALUES('関東', 'レモン',	100, NULL);
INSERT INTO DistrictProducts2 VALUES('関東', 'パイン',	100, NULL);
INSERT INTO DistrictProducts2 VALUES('関東', 'りんご',	100, NULL);
INSERT INTO DistrictProducts2 VALUES('関東', 'ぶどう',	70 , NULL);
INSERT INTO DistrictProducts2 VALUES('関西', 'レモン',	70 , NULL);
INSERT INTO DistrictProducts2 VALUES('関西', 'スイカ',	30 , NULL);
INSERT INTO DistrictProducts2 VALUES('関西', 'りんご',	20 , NULL);

/* 8-1：配列テーブル――行持ちの場合 */
CREATE TABLE ArrayTbl2
 (key   CHAR(1) NOT NULL,
    i   INTEGER NOT NULL,
  val   INTEGER,
  PRIMARY KEY (key, i));

/* AはオールNULL、Bは一つだけ非NULL、Cはオール非NULL */
INSERT INTO ArrayTbl2 VALUES('A', 1, NULL);
INSERT INTO ArrayTbl2 VALUES('A', 2, NULL);
INSERT INTO ArrayTbl2 VALUES('A', 3, NULL);
INSERT INTO ArrayTbl2 VALUES('A', 4, NULL);
INSERT INTO ArrayTbl2 VALUES('A', 5, NULL);
INSERT INTO ArrayTbl2 VALUES('A', 6, NULL);
INSERT INTO ArrayTbl2 VALUES('A', 7, NULL);
INSERT INTO ArrayTbl2 VALUES('A', 8, NULL);
INSERT INTO ArrayTbl2 VALUES('A', 9, NULL);
INSERT INTO ArrayTbl2 VALUES('A',10, NULL);
INSERT INTO ArrayTbl2 VALUES('B', 1, 3);
INSERT INTO ArrayTbl2 VALUES('B', 2, NULL);
INSERT INTO ArrayTbl2 VALUES('B', 3, NULL);
INSERT INTO ArrayTbl2 VALUES('B', 4, NULL);
INSERT INTO ArrayTbl2 VALUES('B', 5, NULL);
INSERT INTO ArrayTbl2 VALUES('B', 6, NULL);
INSERT INTO ArrayTbl2 VALUES('B', 7, NULL);
INSERT INTO ArrayTbl2 VALUES('B', 8, NULL);
INSERT INTO ArrayTbl2 VALUES('B', 9, NULL);
INSERT INTO ArrayTbl2 VALUES('B',10, NULL);
INSERT INTO ArrayTbl2 VALUES('C', 1, 1);
INSERT INTO ArrayTbl2 VALUES('C', 2, 1);
INSERT INTO ArrayTbl2 VALUES('C', 3, 1);
INSERT INTO ArrayTbl2 VALUES('C', 4, 1);
INSERT INTO ArrayTbl2 VALUES('C', 5, 1);
INSERT INTO ArrayTbl2 VALUES('C', 6, 1);
INSERT INTO ArrayTbl2 VALUES('C', 7, 1);
INSERT INTO ArrayTbl2 VALUES('C', 8, 1);
INSERT INTO ArrayTbl2 VALUES('C', 9, 1);
INSERT INTO ArrayTbl2 VALUES('C',10, 1);

/* 10-1：一意集合と多重集合の一般化 */
CREATE TABLE Materials2
(center VARCHAR(32) NOT NULL,
 receive_date DATE  NOT NULL,
 material VARCHAR(32) NOT NULL,
 orgland  VARCHAR(32) NOT NULL,
 PRIMARY KEY(center, receive_date, material));

INSERT INTO Materials2 VALUES('東京',   '2007-04-01', '錫', 		'チリ');
INSERT INTO Materials2 VALUES('東京',   '2007-04-12', '亜鉛', 		'タイ');
INSERT INTO Materials2 VALUES('東京',   '2007-05-17', 'アルミニウム', 	'ブラジル');
INSERT INTO Materials2 VALUES('東京',   '2007-05-20', '亜鉛', 		'タイ');
INSERT INTO Materials2 VALUES('大阪',   '2007-04-20', '銅', 		'オーストラリア');
INSERT INTO Materials2 VALUES('大阪',   '2007-04-22', 'ニッケル', 	'南アフリカ');
INSERT INTO Materials2 VALUES('大阪',   '2007-04-29', '鉛', 		'インド');
INSERT INTO Materials2 VALUES('名古屋', '2007-03-15', 'チタン', 	'ボリビア');
INSERT INTO Materials2 VALUES('名古屋', '2007-04-01', '炭素鋼', 	'チリ');
INSERT INTO Materials2 VALUES('名古屋', '2007-04-24', '炭素鋼', 	'アルゼンチン');
INSERT INTO Materials2 VALUES('名古屋', '2007-05-02', 'マグネシウム', 	'チリ');
INSERT INTO Materials2 VALUES('名古屋', '2007-05-10', 'チタン', 	'タイ');
INSERT INTO Materials2 VALUES('福岡',   '2007-05-10', '亜鉛', 		'アメリカ');
INSERT INTO Materials2 VALUES('福岡',   '2007-05-28', '錫',		'ロシア');

/* 演習問題10-2：行によって条件が異なる特性関数 */
CREATE TABLE TestScores
 (student_id INTEGER NOT NULL,
  subject    VARCHAR(16) NOT NULL,
  score      INTEGER NOT NULL,
    PRIMARY KEY (student_id, subject));

INSERT INTO TestScores VALUES(100, '算数', 100);
INSERT INTO TestScores VALUES(100, '国語', 80);
INSERT INTO TestScores VALUES(100, '理科', 80);
INSERT INTO TestScores VALUES(200, '算数', 80);
INSERT INTO TestScores VALUES(200, '国語', 95);
INSERT INTO TestScores VALUES(300, '算数', 40);
INSERT INTO TestScores VALUES(300, '国語', 50);
INSERT INTO TestScores VALUES(300, '社会', 55);
INSERT INTO TestScores VALUES(400, '算数', 80);


