-- 1-1查询工资大于12000的员工姓名和工资
select last_name,salary
from employees
where salary>12000;
-- 1-2查询员工号为176的员工的姓名、部门号和年薪
select last_name,department_id,salary*12
from employees
where employee_id=176;
-- 1-3查询工资不在5000到12000的员工的姓名和工资，按工资降序 ?
select last_name,salary
from employees
where salary<5000 OR  salary>12000
ORDER BY salary desc;
-- 1-4选择20或者50号部门工作的员工姓名和工资
select last_name,salary,department_id
from employees
where department_id=20 or department_id=50;
-- 1-5选择没有管理者的员工姓名和job_id
select last_name,job_id
from employees
where manager_id is null;

-- 1-6选择公司中有奖金的员工姓名、工资及奖金级别
select last_name,salary,commission_pct
from employees
where commission_pct is not null;
-- 1-7选择员工姓名第3个字母是a的员工姓名
select last_name
from employees
where last_name like '__a%';
-- 1-8选择姓名中有字母a和e的员工姓名
select last_name
from employees
where last_name like '%a%' and last_name like '%e%';
-- 1-9显示first_name以e结尾的员工信息
select first_name
from employees
where first_name like '%e';
-- 1-10显示empployees表中全部的job_id，要求不重复
select DISTINCT job_id
from employees;
-- 1-11 查询员工工资的最大值、最小值、平均值
select MAX(salary)
from employees;

select MIN(salary)
from employees;

SELECT AVG(salary)
FROM employees;

-- 1-12 查询部门编号为90的员工个数
select department_id
from employees
where department_id=90;

-- 1-13 查询最高工资高于8000的工种的最高工资
select max_salary,job_id
from jobs
where max_salary>8000
ORDER BY max_salary desc;
-- 2-1查询和Zlotkey相同部门的员工姓名和工资
select last_name,salary,department_id
from employees
where last_name='Zlotkey' and department_id=80;

-- 2-2查询工资比公司平均工资高的员工的员工号，姓名和工资
select employee_id,last_name,salary
from employees
where salary>(
SELECT AVG(salary)
FROM employees
);
-- 2-3查询和姓名中包含u的员工在相同部门的员工的员工号和姓名 
select employee_id,last_name,department_id
from employees
where last_name like '%u%';

select department_id,employee_id,last_name
from employees
where department_id=(
last_name like '%u%');
-- 2-4查询在部门的location_id为1700的部门工作的员工的员工号
select department_id,department_name,location_id
from departments
where location_id=1700;
-- 2-5查询管理者是K_ing的员工姓名和工资
select last_name,first_name,salary,job_id
from employees
where last_name='K_ing' and  manager_id is not null;
-- (我不知道您说的boss还是经理，就做了两个，第一个是经理的，第二个是boss和经理的)
select last_name,first_name,salary,job_id
from employees
where last_name='K_ing';

-- 2-6查询工资最高的员工的姓名，要求first_name和last_name显示为一列，列名为姓.名。
select concat(first_name,'.',last_name) as '姓.名'
from employees
where salary=(
select max(salary) 
from employees);