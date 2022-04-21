-- 1、	创建视图v1，查询邮箱种包含w字符的员工名，部门名和工种信息
CREATE or replace view v1
AS
SELECT last_name,department_name,job_title
from employees e
join departments d on e.department_id=d.department_id
join jobs j on e.job_id=j.job_id
WHERE email LIKE '%w%';

SELECT * FROM v1;
-- 2、	创建视图v2，查询各部门的平均工资级别
CREATE OR REPLACE VIEW v2
AS
SELECT AVG(salary) avgsal,department_id
FROM employees
GROUP BY department_id;
SELECT * FROM v2;

SELECT v2.avgsal,grade_level
FROM v2
JOIN job_grades j
ON v2.avgsal BETWEEN lowest_sal AND highest_sal;

-- 3、	通过视图v2，查询平均工资级别最低的部门信息
SELECT * FROM v2 ORDER BY  avgsal  LIMIT  1;

-- 4、	创建视图v3，查询平均工资最低的部门和工资
CREATE OR REPLACE VIEW v3
AS
SELECT * FROM v2
ORDER BY avgsal LIMIT 1;

SELECT * FROM v3;

SELECT v3.*,department_name
from v3
join departments d
on v3.department_id=d.department_id;
-- 5、	创建视图v4，查询电话号码以011开头的员工姓名和工资、邮箱
CREATE OR REPLACE VIEW v4
AS
SELECT last_name,salary,email
FROM employees
WHERE phone_number LIKE '011%';
SELECT * FROM v4;

-- 6、	创建视图v5，查询最高工资高于12000的部门信息及工资
CREATE OR REPLACE VIEW v5
AS
SELECT  department_id,max(salary)
FROM employees
GROUP BY department_id DESC
HAVING max(salary)>12000;
SELECT * FROM v5;


-- 7、	创建视图v6，
-- 查询employees表中last_name,salary和邮箱。
-- 通过视图v6向表中插入记录(‘jie’,39999,’jie@edg.com’)，
-- 再将jie的last_name修改为‘赵礼杰’，
-- 最后删除employees表中last_name包含w的员工。

CREATE OR REPLACE VIEW v6
AS
SELECT last_name,salary,email
FROM employees;

INSERT INTO v6 VALUES ('jie',39999,'jie@edg.com');

UPDATE v6 SET last_name='赵礼杰' WHERE last_name='jie';

DELETE from v6 where last_name like '%w%';

SELECT * FROM v6;


-- 8、	更新视图v4，更新后的视图用来查询电话号码515开头的员工。
CREATE OR REPLACE VIEW v4
AS
SELECT last_name,salary,email
FROM employees
WHERE phone_number LIKE '515%';

SELECT * FROM v4;

-- 9、	删除视图v2。
DROP VIEW v2;

-- 10、	为表jobs在job_id字段上建立唯一索引index_jobid，
-- 在job_title字段上建立普通索引index_jobtitle。
CREATE UNIQUE INDEX index_jobid on jobs(job_id) ;

SHOW INDEX FROM jobs;

ALTER TABLE jobs add INDEX index_jobtitle(job_title) ;

-- 11、在locations表的street_address和postal_code字段上建立多列联合索引index_street_postal。
CREATE INDEX index_street_postal ON locations(street_address,postal_code);

SHOW INDEX FROM locations;


-- 12、	删除jobs表的index_jobtitle索引。
DROP INDEX index_jobtitle ON jobs;

SHOW INDEX FROM jobs;
