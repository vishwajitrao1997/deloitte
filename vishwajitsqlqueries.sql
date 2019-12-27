select e.employee_id,e.first_name,e.manager_id,m.first_name
from employees e, employees m
where e.manager_id=m.employee_id;

select *
from employees
where (salary>10000);

select first_name,hire_date
from employees
where (hire_date>'01-JAN-02' and hire_date<'31-DEC-04')
ORDER BY(hire_date);

select e.first_name,d.department_id,d.department_name,l.location_id
from employees e,departments d, locations l
where (e.department_id=d.department_id) and (d.location_id=l.location_id);

select e.first_name, e.hire_date
from employees e,jobs j, job_history r
where (e.employee_id=r.employee_id)and (r.job_id=j.job_id) and (j.job_id='IT_PROG' or j.job_id='SA_REP');
 --4
 select *
 from employees
 where (hire_date>'01-JAN-08')
 --5
 select * from employees where (employee_id='160'   or employee_id='150');
 --6
 select first_name,last_name,commission_pct,hire_date
 from employees
 where (salary<10000);
 --7
 select job_title,(max_salary-min_salary)
 from jobs
 where(max_salary between 10000 and 20000)
 --8
 select first_name,round(salary)
 from employees
 --9
 select job_title
 from jobs 
 order by job_title desc;
 --10
 select * from employees
 where (first_name like 'S%' and last_name like 'S%')
 --11
 select * from employees where hire_date like '%-MAY-%';
 --12
 Select * from employees 
 where (commission_pct is null) and salary between 5000 and 10000 and department_id='30';
 --13
 select first_name, add_months(hire_date,1) from employees
 --14
 select e.first_name, extract(year from to_date(j.end_date,'DD-MON-RR'))-EXTRACT(year from to_date(j.start_date,'dd-mon-rr')) as experience 
 from employees e join job_history j using(employee_id);
 --15
 select first_name from employees where hire_date like '%-%-01'
 --16
 select initcap(first_name),initcap(last_name)from employees;
--17
    select substr(job_title,1,(instr(job_title,' ')-1)) from jobs;
    --18
    select length(first_name)
    from employees
    where last_name like '__b%'
--19
Display first name in upper case and email address in lower case for employees 
where the first name and email address are same irrespective of the case.
 select upper(first_name),lower(last_name)
 from employees
 where (lower(first_name)=lower(email))
 

 --20
 select * from employees where hire_date like '%-%-19'; 
  --21
select (extract(year from to_date('26-12-19','dd-mm-rr'))- extract(year from to_date('01-01-11','dd-mm-rr'))) 
--23
Select manager_id,count(employee_id) from employees group by manager_id;

--24
select employee_id,start_date from job_history;

--25
select count(*) from employees where EXTRACT(DAY FROM
   TO_DATE(hire_date, 'DD-MON-RR'))>15;
   
--26
SELECT COUNTRY_ID,  COUNT(*)  FROM LOCATIONS GROUP BY COUNTRY_ID;

--27
--Display average salary of employees in each department who have commission percentage.
select avg(salary),department_id from employees where commission_pct is not null group by department_id;  


--28
SELECT JOB_ID, COUNT(*), SUM(SALARY), MAX(SALARY)-MIN(SALARY) SALARY FROM EMPLOYEES GROUP BY JOB_ID;

--29
SELECT JOB_ID, AVG(SALARY) FROM EMPLOYEES GROUP BY JOB_ID HAVING AVG(SALARY)>10000

--30
SELECT TO_CHAR(HIRE_DATE,'YYYY') FROM EMPLOYEES GROUP BY TO_CHAR(HIRE_DATE,'YYYY') HAVING COUNT(EMPLOYEE_ID) > 10

--31
SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE COMMISSION_PCT IS NOT NULL GROUP BY DEPARTMENT_ID HAVING COUNT(COMMISSION_PCT)>5

--32
SELECT EMPLOYEE_ID FROM JOB_HISTORY GROUP BY EMPLOYEE_ID HAVING COUNT(*) > 1

--33
SELECT JOB_ID FROM JOB_HISTORY WHERE END_DATE-START_DATE > 100 GROUP BY JOB_ID HAVING COUNT(*)>3

--34
SELECT DEPARTMENT_ID, TO_CHAR(HIRE_DATE,'YYYY'), COUNT(EMPLOYEE_ID) FROM EMPLOYEES GROUP BY DEPARTMENT_ID, TO_CHAR(HIRE_DATE, 'YYYY') ORDER BY DEPARTMENT_ID

--35
SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES GROUP BY DEPARTMENT_ID, MANAGER_ID HAVING COUNT(EMPLOYEE_ID) > 5

--36
UPDATE EMPLOYEES SET SALARY = 8000 WHERE EMPLOYEE_ID = 115 AND SALARY < 6000

--37
INSERT INTO EMPLOYEES  (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE,JOB_ID, SALARY, DEPARTMENT_ID) 
VALUES (999, 'Ishaan', 'Vishwa','jj','123456798', SYSDATE, 'IT_PROG', 9000, 30)

--38
UPDATE EMPLOYEES SET JOB_ID= 'IT_PROG' WHERE EMPLOYEE_ID=110 AND DEPARTMENT_ID=10 AND NOT JOB_ID LIKE 'IT%' 

--39
INSERT INTO DEPARTMENTS (30,'XYZ',120,1200)

--40
select d.department_name,count(e.employee_id) from employees  e join departments d using(department_id) group by department_name
order by d.department_name;

--41
Select job_id,end_date-start_date from job_history natural join jobs where department_id=30;

--42
select d.department_name,e.first_name from employees e join departments d using(department_id) order by department_name;

--43
select d.department_name,e.first_name,l.city from departments d join employees e using(department_id) join locations l using(location_id);

--44
select l.country_id,l.city,d.department_name from departments d join locations l using(location_id);

--45
SELECT JOB_TITLE, DEPARTMENT_NAME, LAST_NAME, START_DATE FROM JOB_HISTORY JOIN JOBS USING (JOB_ID) JOIN DEPARTMENTS USING (DEPARTMENT_ID) JOIN  EMPLOYEES USING (EMPLOYEE_ID) WHERE TO_CHAR(START_DATE,'YYYY') BETWEEN 2000 AND 2005

--46
SELECT JOB_TITLE, AVG(SALARY) FROM EMPLOYEES NATURAL JOIN JOBS GROUP BY JOB_TITLE

--47
SELECT JOB_TITLE, FIRST_NAME, MAX_SALARY-SALARY DIFFERENCE FROM EMPLOYEES NATURAL JOIN JOBS

--48
SELECT JOB_TITLE, FIRST_NAME, MAX_SALARY-SALARY DIFFERENCE FROM EMPLOYEES NATURAL JOIN JOBS WHERE DEPARTMENT_ID  = 30

--49
SELECT J.* FROM  JOB_HISTORY J JOIN EMPLOYEES E ON (J.EMPLOYEE_ID = E.EMPLOYEE_ID) WHERE SALARY > 15000

--50
SELECT DEPARTMENT_NAME, FIRST_NAME, SALARY FROM DEPARTMENTS D JOIN EMPLOYEES E ON (D.MANAGER_ID=E.MANAGER_ID) WHERE  (SYSDATE-HIRE_DATE) / 365 >5 

--51
SELECT FIRST_NAME FROM  EMPLOYEES E JOIN EMPLOYEES F ON (E.MANAGER_ID=F.EMPLOYEE_ID) WHERE E.HIRE_DATE <F.HIRE_DATE

--52
SELECT FIRST_NAME, JOB_TITLE FROM EMPLOYEES E JOIN JOB_HISTORY  JH ON (JH.EMPLOYEE_ID = E.EMPLOYEE_ID) JOIN JOBS J  ON( JH.JOB_ID = J.JOB_ID) 
WHERE  MONTHS_BETWEEN(END_DATE,START_DATE)  < 6 

--53
SELECT FIRST_NAME, COUNTRY_NAME FROM EMPLOYEES JOIN DEPARTMENTS USING(DEPARTMENT_ID) JOIN LOCATIONS USING( LOCATION_ID) JOIN COUNTRIES USING(COUNTRY_ID)

--54
SELECT DEPARTMENT_NAME, AVG(SALARY), COUNT(COMMISSION_PCT) FROM DEPARTMENTS JOIN EMPLOYEES USING (DEPARTMENT_ID) GROUP BY DEPARTMENT_NAME

--55
SELECT TO_CHAR(HIRE_DATE,'MON-YY') FROM EMPLOYEES JOIN DEPARTMENTS USING (DEPARTMENT_ID) JOIN  LOCATIONS USING (LOCATION_ID) WHERE  CITY = 'Sydney'
GROUP BY TO_CHAR(HIRE_DATE,'MON-YY') HAVING COUNT(*) > 5

--56
SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID IN ( SELECT DEPARTMENT_ID FROM EMPLOYEES GROUP BY DEPARTMENT_ID HAVING MAX(SALARY)>10000)

-57
SELECT * FROM DEPARTMENTS WHERE MANAGER_ID IN (SELECT EMPLOYEE_ID FROM EMPLOYEES WHERE FIRST_NAME='SMITH')

-58
SELECT * FROM JOBS WHERE JOB_ID IN (SELECT JOB_ID FROM EMPLOYEES WHERE TO_CHAR(HIRE_DATE,'YYYY')=TO_CHAR(SYSDATE,'YYYY'))

--59
SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID NOT IN (SELECT EMPLOYEE_ID FROM JOB_HISTORY)

--60
SELECT JOB_TITLE, AVG(SALARY) FROM JOBS NATURAL JOIN EMPLOYEES GROUP BY JOB_TITLE WHERE EMPLOYEE_ID IN (SELECT EMPLOYEE_ID FROM JOB_HISTORY)

--61
SELECT FIRST_NAME FROM EMPLOYEES WHERE EMPLOYEE_ID IN (SELECT MANAGER_ID FROM EMPLOYEES GROUP BY MANAGER_ID HAVING COUNT(*)>5)

--62
SELECT FIRST_NAME, JOB_TITLE, START_DATE, END_DATE
FROM JOB_HISTORY JH JOIN JOBS J USING (JOB_ID) JOIN EMPLOYEES E  ON ( JH.EMPLOYEE_ID = E.EMPLOYEE_ID)
WHERE COMMISSION_PCT IS NULL

--63
SELECT  * FROM DEPARTMENTSWHERE DEPARTMENT_ID NOT IN ( SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE FLOOR((SYSDATE-HIRE_DATE)/365) < 2) 

--64
SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE EMPLOYEE_ID IN (SELECT EMPLOYEE_ID FROM JOB_HISTORY) GROUP BY DEPARTMENT_ID HAVING MAX(SALARY) >10000)

--65
SELECT * FROM JOBS WHERE JOB_ID IN (SELECT JOB_ID FROM EMPLOYEES WHERE EMPLOYEE_ID IN (SELECT EMPLOYEE_ID FROM JOB_HISTORY WHERE JOB_ID='IT_PROG'))

--66
SELECT DEPARTMENT_ID,FIRST_NAME, SALARY FROM EMPLOYEES OUTER WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES WHERE DEPARTMENT_ID =OUTER.DEPARTMENT_ID)

--67
SELECT CITY FROM LOCATIONS WHERE LOCATION_ID = (SELECT LOCATION_ID FROM DEPARTMENTS WHERE DEPARTMENT_ID =(SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE EMPLOYEE_ID=105))

--68
select l.city
from employees e, departments d, locations l
where (e.department_id=d.department_id) and (d.location_id=l.location_id) and(e.employee_id='105');








