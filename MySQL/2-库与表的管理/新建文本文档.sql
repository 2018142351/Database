CREATE DATABASE if not EXISTS studentdb;
use studentdb;

drop TABLE if EXISTS student_info;
CREATE TABLE student_info(
学号 char(4) not NULL PRIMARY KEY ,
姓名 char(8) not NULL,
性别 char(2),
出生日期 DATE,
家庭住址 VARCHAR(50)
);
desc student_info;

drop TABLE if EXISTS curriculum;
CREATE TABLE  curriculum(
课程编号 char(4) not NULL PRIMARY KEY,
课程名称 VARCHAR(50) ,
学分 INT
);
DESC curriculum;

drop TABLE if EXISTS grade;
CREATE TABLE  grade(
学号 char(4) not NULL,
课程编号 char(4) not NULL,
分数 INT,
PRIMARY key(学号,课程编号)
);
desc grade;

delete from student_info;
INSERT into student_info
values('0001','张青平','男','2000-10-01','衡阳市东风路77号'),
('0002','刘东阳','男','1998-12-09','东阳市八一北路33号'),
('0003','马晓夏','女','1995-05-12','长岭市五一路763号'),
('0004','钱忠理','男','1994-09-23','滨海市洞庭大道279号'),
('0005','孙海洋','男','1995-04-03','长岛市解放路27号'),
('0006','郭小斌','男','1997-11-10','南山市红旗路113号'),
('0007','肖月玲','女','1996-12-07','东方市南京路11号'),
('0008','张玲珑','女','1997-12-24','滨江市新建路97号');
SELECT * from student_info;

DELETE from curriculum;
INSERT into curriculum (课程编号,课程名称,学分)
values('0001','计算机应用基础',2),
('0002','C语言程序设计',2);
SELECT * from curriculum;

delete from grade;
INSERT into grade(学号,课程编号,分数)
values('0001', '0001', 80) ,
('0001', '0002', 91),
('0001', '0003', 88),
('0001', '0004', 85),
('0001', '0005', 77);
SELECT * from grade;

#ALTER TABLE CURRICULUM CHANGE  课程名称 课程名称 VARCHAR(50) NOT NULL;
ALTER TABLE curriculum MODIFY 课程名称 VARCHAR(50)not null;
desc curriculum;

ALTER TABLE grade MODIFY 分数 decimal(5,2);
desc grade;

ALTER TABLE student_info ADD 备注 VARCHAR(50);
desc student_info;

Create database if not EXISTS studb;

Use studb;
drop table if EXISTS stu;
Create table stu LIKE studentdb.student_info;
SELECT * from stu;

Use studb;
drop table if EXISTS stu;
Create table  stu  select *from studentdb.student_info ;
SELECT * from stu;


Delete from stu where 学号='0004';
SELECT * from stu;

update stu set 家庭住址='滨江市新建路96号' where 学号='0002';
SELECT * from stu;

Alter table stu drop 备注;
desc stu;

Drop table stu;

Drop database studb;
