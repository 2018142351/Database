#1创建students数据库，在该数据库下创建表stu，并同时创建约束，表结构及约束要求如表1所示。
USE students;
drop TABLE if EXISTS stu;
CREATE TABLE stu (
学号 char(4) not NULL PRIMARY KEY,
姓名 char(8) NULL,
性别 char(2) NULL DEFAULT'男', #DEFAULT是指为此字段设置一个默认值
出生日期 date  NULL
);

#2创建表course，并同时创建约束，表结构及约束要求如表2所示。
USE students;
drop TABLE if EXISTS course;
CREATE TABLE course(
课号 char(4) NOT NULL,
课名 char(20) NULL,
学分 int NULL
);
ALTER TABLE course ADD CONSTRAINT uq_cname UNIQUE(课名);
DESC course;

#3创建表sc，并同时创建约束，表结构及约束要求如表3所示。设置（学号，课号）为主键。
drop TABLE if EXISTS sc ;
CREATE TABLE sc (
学号 char(4) not NULL ,
课号 char(4) NOT NULL,
成绩 DECIMAL(5,2) NULL , 
PRIMARY key(学号,课号),
CONSTRAINT fk_sno FOREIGN KEY(学号) REFERENCES stu(学号)
);
DESC sc;

#4为course表的'课号'列建立主键约束
ALTER TABLE course add CONSTRAINT PRIMARY KEY (课号);

#5为sc表的“课号”列建立外键约束fk_cno，参照course表的“课号”列的取值。要求设定级联更新。
ALTER TABLE sc ADD CONSTRAINT fk_cno FOREIGN KEY(课号) REFERENCES course(课号)
on update cascade on delete cascade;

#6为stu表的“姓名”列建立唯一约束，约束名uq_sname。
ALTER TABLE stu ADD CONSTRAINT uq_sname UNIQUE(姓名);

#插入表记录如下


INSERT INTO course
VALUES('C1','专业英语',3),
('C2','数据库',4),
('C3','大学语文',2);

INSERT INTO stu
VALUES('001','李宇秋','女','1990-1-8'),
('002','周浅','男','1987-12-12');

INSERT INTO sc
VALUES('001','C1',90),
('001','C2',76),
('002','C1',85),
('002','C3',100);

INSERT INTO sc 
VALUES('006','C5',99);
SELECT*FROM sc;
SELECT*FROM course;
SELECT*FROM stu;

#7将course表里的课号’C1’改为’C8’，查看sc表数据。将stu表002改为003，再查看sc表数据。
UPDATE course
SET 课号='C8'
WHERE 课号='C1';
DESC sc;

UPDATE stu 
SET 学号='003'
WHERE 学号='002';
DESC sc;

#8删除stu 表里的’0001’记录。
DELETE FROM stu 
	WHERE 学号='0001';

#9往sc表插入（’0006’,’C5’,99）记录
INSERT INTO sc 
VALUES('0006','C5',99);
SELECT*FROM sc; 

#10删除sc表的外键约束fk_cno，fk_sno
ALTER TABLE sc drop FOREIGN KEY fk_cno;
ALTER TABLE sc drop FOREIGN KEY fk_sno;

#11删除stu表的主键约束
ALTER TABLE stu drop PRIMARY KEY ;

#12删除course表的唯一约束uq_cname
ALTER TABLE course drop INDEX uq_cname;

