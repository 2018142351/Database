-- 5.创建测试表test，包含一个字段date_time，字段类型varchar(50)；
-- 创建触发器test_trig，实现在stu表中每插入一条学生记录后，
-- 则自动在test表中追加一条插入成功时的日期时间。
-- now()函数用来获取当前的日期和时间。
DROP TABLE test;
CREATE TABLE test(
data_time VARCHAR(50) 
)
DROP TRIGGER test_trig;
CREATE TRIGGER test_trig BEFORE 
INSERT ON stu FOR EACH ROW
BEGIN
INSERT INTO test
VALUES (now());
END

INSERT INTO stu
VALUES('0112','黄子豪','男','2002-05-10');

SELECT * FROM test;

-- 6.在course表上创建触发器del_trig，
-- 当course表上删除一门课程时，级联删除sc表该课程的记录。
-- 删除course表的一条记录，查看sc表相应记录是否被自动删除。

DROP TRIGGER del_trig;
CREATE TRIGGER del_trig after 
DELETE ON course for each row 
BEGIN
DELETE FROM sc WHERE 课号=old.课号;
END


-- 1.使用myemployees数据库中的表
-- （1）创建一个存储过程proc1，
-- 查询工号为128的员工的姓名、部门编号和工资。
-- 调用存储过程proc1
SELECT last_name,department_id,salary
FROM employees
WHERE employee_id=128;
-- （2）创建一个存储过程proc2，当输入部门编号时，
-- 求这个部门的员工人数。执行存储过程proc3，任意输入部门编号。
delimiter $$
drop PROCEDURE proc2;
CREATE PROCEDURE proc2(in d int)
BEGIN
SELECT count(*)
FROM employees
WHERE department_id=d;
END $$
SET @d=20;
SELECT @d;
CALL proc2(@d);


-- （3）创建存储过程proc3，当任意输入一个部门名时，
-- 可以查看其部门员工的最高工资、最低工资、平均工资。
-- 调用存储过程proc2，查看IT部门的情况。
CREATE PROCEDURE proc3(
in dname char(3),
out max int,
out min int,
out avg int )
BEGIN
SELECT max(salary),MIN(salary),avg(salary)
into max,min,avg 
from employees,departments 
where employees.department_id=departments.department_id
AND departments.department_name=dname;
END

SET @dname='IT';                                                   
CALL proc3(@dname, @max,@min,@avg);
SELECT @dname, @max,@min,@avg;

-- （4）创建存储过程proc4,功能是输入两个数，将两个数翻倍输出。
-- 利用inout参数。
CREATE PROCEDURE proc4(INOUT x int,INOUT y int)
BEGIN
SET x=x*2;
SET y=y*2;
END
SET @x=6;
SET @y=4;
CALL proc4(@x,@y);
SELECT @x;
SELECT @y;




