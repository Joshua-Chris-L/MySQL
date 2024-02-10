SELECT 
    first_name, last_name
FROM
    employees;
    
SELECT 
    *
FROM
    employees;
    
SELECT 
    dept_no
FROM
    departments;

SELECT 
    *
FROM
    departments;
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis';

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' AND gender = 'M';

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' AND gender = 'F';

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis'
        OR first_name = 'Elvis';
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie'
        OR first_name = 'Aruna';

SELECT 
    *
FROM
    employees
WHERE
    last_name = 'Denis'
        AND (gender = 'M' OR gender = 'F');
        
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND (first_name = 'Kellie'
        OR first_name = 'Aruna');
        
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Cathie' , 'Mark', 'Nathan');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('Cathie' , 'Mark', 'Nathan');


SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Denis', 'Elvis');

SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('John' , 'Mark', 'Jacob');

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mark%');
SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE ('2000%');
SELECT 
    *
FROM
    employees
WHERE
    emp_no LIKE ('1000_');

SELECT * FROM employees WHERE first_name Like ('%Jack%');
SELECT * FROM employees WHERE first_name NOT Like ('%Jack%');
SELECT * FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '2000-01-01';
SELECT * FROM employees WHERE hire_date NOT BETWEEN '1990-01-01' AND '2000-01-01';


SELECT * FROM salaries;
SELECT * FROM salaries WHERE salary BETWEEN '66000' AND '70000';
SELECT * FROM salaries WHERE emp_no NOT BETWEEN '10004' AND '10012';
SELECT * FROM departments WHERE dept_no BETWEEN 'd003' AND 'd006';
SELECT dept_name FROM departments WHERE dept_no BETWEEN 'd003' AND 'd006';
SELECT * FROM employees WHERE first_name IS NOT NULL;
SELECT * FROM employees WHERE first_name IS NULL;
SELECT * FROM employees WHERE first_name <> 'Mark';
SELECT * FROM employees WHERE first_name != 'Mark';
SELECT * FROM employees WHERE first_name != 'Mark';
SELECT * FROM employees WHERE gender = 'F' AND hire_date > '2000-01-01';
SELECT * FROM salaries WHERE salary > 150000;
SELECT DISTINCT gender FROM employees;
SELECT DISTINCT hire_date FROM employees;
# 1/21/2024
SELECT COUNT(emp_no) FROM employees;
SELECT COUNT(first_name) FROM employees;
SELECT COUNT( DISTINCT first_name) FROM employees;
SELECT * FROM salaries;
SELECT * FROM employees ORDER BY first_name;
SELECT * FROM employees ORDER BY emp_no DESC; 
SELECT * FROM employees ORDER BY first_name, last_name; 
SELECT * FROM employees ORDER BY hire_date DESC; 
SELECT first_name FROM employees GROUP BY first_name;
SELECT DISTINCT first_name FROM employees;
SELECT COUNT(first_name) FROM employees GROUP BY first_name;
SELECT 
    first_name, COUNT(first_name)
FROM
    employees;
#GROUP BY first_name
#ORDER BY first_name;

############ LEFT JOIN ##############
############ 1/29/2024 ##############
SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    dm.dept_no,
    dm.from_date
FROM
    employees e
        LEFT JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
WHERE
    e.last_name = 'Markovitch'
ORDER BY dm.dept_no DESC , e.emp_no;

############### Right JOin ##################
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        RIGHT JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY dept_no;

######### 
SELECT * FROM dept_manager_dup;
SELECT * FROM departments_dup;
SELECT * FROM  titles;
############ Using Where Clause to obtain similar results ################
SELECT 
 m.dept_no, m.emp_no, d.dept_name
 FROM 
	dept_manager_dup m,
    departments_dup d
WHERE 
m.dept_no = d.dept_no
ORDER BY m.dept_no;

############################### Test #######################################
SELECT 
e.first_name, e.last_name, e.hire_date, d.emp_no, d.dept_no
FROM
	employees e
JOIN
dept_emp d ON e.emp_no = d.emp_no
ORDER BY e.emp_no;

SELECT 
    e.emp_no, e.first_name, e.last_name, s.salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    s.salary > 145000;

############## practice #################
SELECT 
e.first_name, e.last_name, e.hire_date, t.title
FROM 
 employees e 
 JOIN 
  titles t ON e.emp_no = t.emp_no
WHERE 
e.first_name = "Margareta" AND e.last_name = "Markovitch";

######################## Cross Join  #############################
SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
ORDER BY dm.emp_no , d.dept_no;

SELECT 
    dm.*, d.*
FROM
    dept_manager dm,
    departments d
ORDER BY dm.emp_no , d.dept_no;

SELECT 
    dm.*, d.*
FROM
    dept_manager dm
    JOIN
    departments d
ORDER BY dm.emp_no , d.dept_no;

SELECT 
    d.*, dm.*
FROM
    departments d
        CROSS JOIN
    dept_manager dm
WHERE
    d.dept_no <> dm.dept_no
ORDER BY dm.emp_no , d.dept_no;

################# CROSS JOIN ####################
SELECT 
dm.*, d.*
FROM 
departments d
CROSS JOIN 
dept_manager dm;


SELECT * FROM departments;
SELECT * FROM dept_manager;

#################################### 1/30/2024  ########################################
SELECT e.gender, AVG(s.salary) AS average_salary
FROM employees e
JOIN 
salaries s ON e.emp_n  = s.emp_no
GROUP BY gender;

SELECT
e.first_name, e.last_name, e.hire_date, m.from_date, d.dept_name
FROM
employees e
	JOIN 
dept_manager m ON e.emp_no = m.emp_no
	JOIN
departments d ON m.dept_no = d.dept_no;


SELECT 
    d.dept_name, AVG(salary) AS average_salary
FROM
    departments d
        JOIN
    dept_manager m ON d.dept_no = m.dept_no
        JOIN
    salaries s ON m.emp_no = s.emp_no
GROUP BY d.dept_name
HAVING average_salary > 60000
ORDER BY  average_salary DESC;

###################### 1/30/2024 ########################
SELECT * FROM  employees;
SELECT * FROM  dept_manager;


####################### Practice ########################
SELECT e.gender, COUNT(dm.emp_no)
FROM 
employees e 
JOIN
dept_manager dm ON e.emp_no = dm.emp_no
GROUP BY gender;

DROP TABLE IF EXISTS employees_dup;
CREATE TABLE employees_dup (
emp_no int(11),
birth_date date,
first_name varchar(14),
last_name varchar(16),
gender enum('M', 'F'),
hire_date date
);

INSERT INTO employees_dup
SELECT
	e.*
FROM 
	employees e
LIMIT 20;

############################# continued- 1/31/2024 #############
SELECT * FROM employees_dup;
SELECT * FROM dept_manager;

INSERT INTO employees_dup VALUES
('10001', '1953-09-02', 'Georgi', 'Facello', 'M', '1986-06-26');

######### Union All ###########################################
SELECT 
	e.emp_no,
    e.first_name,
    e.last_name,
    NULL AS dept_no,
    NULL AS from_date
FROM
	employees_dup e
WHERE 
	e.emp_no = 10001
UNION ALL SELECT
	NULL AS emp_no,
	NULL AS first_name,
    NULL AS last_name,
    m.dept_no,
    m.from_date
FROM 
	dept_manager m;

############## Union ########################################
SELECT 
	e.emp_no,
    e.first_name,
    e.last_name,
    NULL AS dept_no,
    NULL AS from_date
FROM
	employees_dup e
WHERE 
	e.emp_no = 10001
UNION SELECT
	NULL AS emp_no,
	NULL AS first_name,
    NULL AS last_name,
    m.dept_no,
    m.from_date
FROM 
	dept_manager m;

#################### Union All and Union Diff ##############

SELECT 
    *
FROM
    (SELECT 
            e.emp_no,
            e.first_name,
            e.last_name,
            NULL AS dept_no,
            NULL AS from_date
    FROM
        employees e
    WHERE
        last_name = 'Denis' UNION SELECT 
            NULL AS emp_no,
            NULL AS first_name,
            NULL AS last_name,
            dm.dept_no,
            dm.from_date
    FROM
        dept_manager dm) AS a
ORDER BY -a.emp_no DESC;

##################### Inner and Outer Query ################
SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager dm);

SELECT * FROM  dept_manager;
SELECT * FROM employees;


SELECT 
    *
FROM
    dept_manager
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            employees
        WHERE
            hire_date BETWEEN '1990-01-01' AND '1995-01-01');
		
SELECT e.first_name, e.last_name
FROM 
employees e WHERE 
EXISTS (
	SELECT * FROM  
		dept_manager dm
        WHERE dm.emp_no = e.emp_no );
        
########### ASS ###############
SELECT * FROM employees;
SELECT * FROM titles;

SELECT 
    *
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            titles t
        WHERE
            e.emp_no = t.emp_no AND t.title='Assistant Engineer');
            
#################################### A ###########################
SELECT A.* FROM (SELECT 
    e.emp_no AS employee_ID,
    MIN(de.dept_no) AS department_code,
    (SELECT 
            emp_no
        FROM
            dept_manager
        WHERE
            emp_no = 110022) AS manager_ID
FROM 
employees e 
JOIN dept_emp de ON e.emp_no = de.emp_no
WHERE e.emp_no <= 10020
GROUP BY e.emp_no
ORDER BY e.emp_no) AS A 
UNION  
SELECT B.* FROM (SELECT 
    e.emp_no AS employee_ID,
    MIN(de.dept_no) AS department_code,
    (SELECT 
            emp_no
        FROM
            dept_manager
        WHERE
            emp_no = 110039) AS manager_ID
FROM 
employees e 
JOIN dept_emp de ON e.emp_no = de.emp_no
WHERE e.emp_no > 10020
GROUP BY e.emp_no
ORDER BY e.emp_no 
LIMIT 20 ) AS B;

########################## 1/02/2024 #########################
USE employees;
DROP PROCEDURE IF EXISTS select_employees;

DELIMITER $$
CREATE PROCEDURE select_employees()
BEGIN
	SELECT * FROM employees
    LIMIT 1000;
END $$

DELIMITER ;

####################### call a procedure
call employees.select_employees();
call select_employees();

################# Class Work #########################
DELIMITER $$
CREATE PROCEDURE average_salaries()
BEGIN
	SELECT AVG(salary) FROM salaries;
END $$
DELIMITER ;

call average_salaries;
call average_salaries();
call employees.average_salaries;
call employees.average_salaries();

######################## Procedure With Parameter #################
USE employees;
DROP PROCEDURE IF EXISTS  emp_salary;

DELIMITER $$
USE employees $$
CREATE PROCEDURE emp_salary(IN p_emp_no INTEGER)
BEGIN
	SELECT
		e.first_name, e.last_name, s.salary, s.from_date, s.to_date
    FROM 
		employees e 
			JOIN
		salaries s ON e.emp_no = s.emp_no
	WHERE
		e.emp_no = p_emp_no;
END $$
DELIMITER ;

############################ Out Parameter Structure ##############################
DELIMITER $$
CREATE PROCEDURE emp_salary_out(IN p_emp_no INTEGER, OUT p_avg_salary DECIMAL(10, 2))
BEGIN
	SELECT
		AVG(s.salary)
	INTO p_avg_salary 
    FROM 
		employees e 
			JOIN
		salaries s ON e.emp_no = s.emp_no
	WHERE
		e.emp_no = p_emp_no ;
END $$
DELIMITER ;

############################# 2/4/2024 ################################
SET @v_avg_salary = 0; ##### Create a variable
CALL emp_salary_out(11300, @v_avg_salary); ######### Pass the variable
SELECT @v_avg_salary; ######## Select the output

############################## Assignment ###########################
SET @v_emp_no = 0;
CALL emp_infoo('Aruna', 'Journel', @v_emp_no);
SELECT @v_emp_no;

################## Function as a Routine ##########################
USE employees;
DROP function IF EXISTS f_emp_avg_salary;
DELIMITER $$
CREATE FUNCTION  f_emp_avg_salary (p_emp_no INTEGER) RETURNS DECIMAL(10, 2)
DETERMINISTIC NO SQL READS SQL DATA  ######### Fixed an error problem
BEGIN
	DECLARE v_avg_salary DECIMAL(10, 2);
    SELECT
		AVG(s.salary)
	INTO v_avg_salary FROM 
		employees e 
			JOIN
		salaries s ON e.emp_no = s.emp_no
	WHERE 
		e.emp_no = p_emp_no;
	RETURN v_avg_salary;
END $$
DELIMITER ;

SELECT f_emp_avg_salary(11300);

################################# Assignment ###########################################
DROP function IF EXISTS f_emp_avg_salary;
DELIMITER  $$
CREATE FUNCTION f_emp_info (p_first_name VARCHAR(250), p_last_name VARCHAR(250))  RETURNS DECIMAL (10, 2)
DETERMINISTIC NO SQL READS SQL DATA
BEGIN
	DECLARE v_salary DECIMAL (10, 2);
    DECLARE v_max_from_date date;
    SELECT 
		MAX(from_date)
        INTO v_max_from_date FROM 
    employees e
		JOIN
	salaries s ON e.emp_no = s.emp_no
    WHERE
		e.first_name = p_first_name AND e.last_name = p_last_name;
	SELECT 
		s.salary into v_salary FROM
	employees e 
    JOIN 
    salaries s ON e.emp_no = s.emp_no
    WHERE 
		e.first_name = p_first_name AND e.last_name = P_last_name
        AND s.from_date = v_max_from_date;
	RETURN v_salary;
END $$
DELIMITER ;

SELECT f_emp_info('Georgi', 'Facello');

############################# Using Function as a Select statement #####################
SET @v_emp_no = 11300;
SELECT 
	emp_no,
    first_name,
    last_name,
    f_emp_avg_salary(@v_emp_no) AS avg_salary
FROM
	employees
WHERE
	emp_no = @v_emp_no;     

SELECT * FROM employees; #### Georgi Facello

#######################################  2/5/ 2024 ####################################
################################## The Case Statement ################################
SELECT
	emp_no,
    first_name,
    last_name,
    CASE
		WHEN gender = 'M' THEN 'MALE'
        ELSE 'FEMALE'
	END AS gender
FROM employees;

SELECT 
	e.emp_no,
    e.first_name,
    e.last_name,
    CASE
		WHEN dm.emp_no IS NOT NULL THEN 'Manager'
        ELSE 'Employee'
	END AS is_manager
FROM 
	employees e
		LEFT JOIN
	dept_manager dm ON dm.emp_no = e.emp_no
    WHERE
		e.emp_no > 109990;

SELECT 
	emp_no,
    first_name,
    last_name,
    IF(gender= 'M', 'Male', 'Female') AS gender
FROM 
 employees;
 
 SELECT
	dm.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_difference,
    CASE
		WHEN  MAX(s.salary) - MIN(s.salary) > 30000 THEN 'Salary was raised by more than $30,000'
		WHEN MAX(s.salary) - MIN(s.salary) BETWEEN 20000 AND 30000 THEN 'Salary was raised by more than  $20,000 but less than $30,000'
		ELSE 'Salary was raised by less than $20,000'
	END AS salary_increase
FROM
	dept_manager dm
		JOIN
	employees e ON e.emp_no = dm.emp_no
		JOIN
	salaries s ON s.emp_no = dm.emp_no
Group BY s.emp_no;

SELECT 
e.emp_no,
e.first_name,
e.last_name,
CASE
	WHEN e.emp_no = dm.emp_no THEN 'Manager'
	ELSE 'Employee'
END AS descrption
FROM 
  employees e 
	LEFT JOIN
  dept_manager dm ON e.emp_no = dm.emp_no
WHERE e.emp_no > 109990;

################### Window Function Ranking ####################
SELECT

emp_no,

first_name,

ROW_NUMBER() OVER w AS row_num

FROM

employees

WINDOW w AS (PARTITION BY first_name ORDER BY emp_no);
    
##################################
SELECT a.emp_no, MIN(salary) AS min_salary FROM ( SELECT
	emp_no, salary, ROW_NUMBER() OVER w AS row_num
		FROM
	salaries
WINDOW w AS (PARTITION BY emp_no ORDER BY salary)) a

GROUP BY emp_no;

########################################################
SELECT 
    dm.emp_no, (COUNT(salary)) AS no_of_salary_contracts
FROM
    dept_manager dm
        JOIN
    salaries s ON dm.emp_no = s.emp_no
GROUP BY emp_no
ORDER BY emp_no;
#########################################################
SELECT
	emp_no,
	salary,
RANK() OVER w AS rank_num
	FROM
salaries
WHERE emp_no = 10560
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);
##############################################################
#################### 02/06/2024 ##############################
SELECT 
	d.dept_no,
    d.dept_name,
    dm.emp_no,
    RANK() OVER w AS department_salary_ranking,
    s.salary,
    s.from_date AS salary_from_date,
    s.to_date AS salary_to_date,
    dm.from_date AS dept_manager_from_date,
    dm.to_date AS dept_manager_to_date
	FROM 
dept_manager dm 
	JOIN 
salaries s ON s.emp_no = dm.emp_no
	AND s.from_date BETWEEN dm.from_date AND dm.to_date
    AND s.to_date BETWEEN dm.from_date AND dm.to_date
	JOIN
departments d ON d.dept_no = dm.dept_no
WINDOW w AS (PARTITION BY dm.dept_no ORDER BY s.salary DESC);


#################  Assignment ##################################
SELECT 
	e.emp_no,
	s.salary,
	RANK() OVER w AS department_salary_ranking
FROM 
	employees e
JOIN
	salaries s ON s.emp_no = e.emp_no
WHERE 
	e.emp_no BETWEEN 10499 AND 10601
WINDOW w AS (PARTITION BY e.emp_no ORDER BY s.salary DESC);


####################################################################
SELECT
	s.salary, e.emp_no,
    DENSE_RANK() OVER w AS department_salary_ranking
FROM 
	employees e 
    JOIN
    salaries s ON e.emp_no = s.emp_no
    AND (YEAR(s.from_date) - YEAR(e.hire_date)) >= 5
	WHERE e.emp_no BETWEEN 10500 AND 10600
WINDOW w AS (PARTITION BY e.emp_no ORDER BY s.salary DESC);

######################## LAG AND LEAD OF SALARY #####################
SELECT 
	emp_no,
    salary,
    LAG(salary) OVER w AS previous_salary,
    LEAD(salary) OVER w AS next_salary,
    salary - LAG(salary) OVER w AS diff_salary_current_previous,
    LEAD(salary) OVER w - salary AS diff_salary_next_current
FROM
	salaries
WHERE emp_no = 10001
WINDOW w AS (ORDER BY salary);

###################### ASS #######################################
SELECT 
	e.emp_no,
	s.salary, 
    LAG(salary) OVER w AS previous_salary,
    LEAD(salary) OVER w AS next_salary,
    s.salary - LAG(salary) OVER w AS diff_salary_current_previous,
    LEAD(salary) OVER w - s.salary AS diff_salary_next_current
FROM
	employees e
		JOIN
    salaries s  ON e.emp_no = s.emp_no
WHERE salary > 80000 AND e.emp_no BETWEEN 10500 AND 10600
WINDOW w AS ( PARTITION BY e.emp_no ORDER BY salary);
	

SELECT
	emp_no,
    salary,
    LAG(salary) OVER w AS previous_salary,
	LAG(salary, 2) OVER w AS 1_before_previous_salary,
	LEAD(salary) OVER w AS next_salary,
    LEAD(salary, 2) OVER w AS 1_after_next_salary
FROM
	salaries
WINDOW w AS (PARTITION BY emp_no ORDER BY salary)
LIMIT 1000;

############################# Agregate Function, MySQL #######################
SELECT SYSDATE();

############### ERROR PROBLEM regarding to contract date signed by employees #############
SELECT
	emp_no, salary, from_date, to_date
FROM
	salaries
WHERE 
	to_date >  SYSDATE();

######################## Only Full Group Mode Error ##################
SELECT 
	emp_no, salary, MAX(from_date), to_date
FROM
	salaries
WHERE
	to_date > SYSDATE()
GROUP BY emp_no; 

################################ Latest Salary Value ###########################################
SELECT 
	s1.emp_no, s.salary, s.from_date, s.to_date
FROM
	salaries s 
		JOIN
	( SELECT emp_no, MAX(from_date) AS from_date
		FROM 
			salaries
        GROUP BY emp_no ) s1 ON s.emp_no = s1.emp_no
WHERE 
	s.to_date > SYSDATE() AND s.from_date = s1.from_date;

###################### ASS ##########################################################
SELECT 
	s1.emp_no, s.salary, s.from_date, s.to_date
FROM
	salaries s 
		JOIN
	( SELECT emp_no, MIN(from_date) AS from_date
		FROM 
			salaries
        GROUP BY emp_no) s1 ON s.emp_no = s1.emp_no
WHERE 
	s.from_date = s1.from_date;
    
############################ Latest Department of Employeee #############################################
SELECT de.emp_no, de.dept_no, de.from_date, de.to_date
FROM
	dept_emp de
	JOIN
    (SELECT
		emp_no, MAX(from_date) AS from_date
        FROM 
         dept_emp
		GROUP BY emp_no) de1 ON de1.emp_no = de.emp_no
WHERE
	de.to_date > SYSDATE()
			AND de.from_date = de1.from_date;
            
######################################### Window Agregate Function   ######################################################
SELECT de2.emp_no, d.dept_name, s2.salary, AVG(s2.salary) OVER w AS average_salary_per_department
	FROM
    (SELECT 
			de.emp_no, de.dept_no, de.from_date, de.to_date
		FROM
			dept_emp de
				JOIN
			(SELECT 
				emp_no, MAX(from_date) AS from_date
			FROM
				dept_emp
			GROUP BY emp_no) de1 ON de1.emp_no = de.emp_no
		WHERE
			de.to_date > SYSDATE()
				AND de.from_date = de1.from_date) de2
	JOIN 
     (SELECT 
			s1.emp_no, s.salary, s.from_date, s.to_date
		FROM
			salaries s
				JOIN
			(SELECT 
				emp_no, MIN(from_date) AS from_date
			FROM
				salaries
			GROUP BY emp_no) s1 ON s.emp_no = s1.emp_no
		WHERE
			s.from_date = s1.from_date) s2 ON s2.emp_no = de2.emp_no
			JOIN
            departments d ON d.dept_no = de2.dept_no
GROUP BY de2.emp_no, d.dept_name
WINDOW w AS (PARTITION BY de2.dept_no)
ORDER BY de2.emp_no;
###########################################################################################

SELECT 
	s1.emp_no, s.salary, s.from_date, s.to_date
FROM
	salaries s 
		JOIN
	(SELECT emp_no, MAX(from_date) AS from_date
		FROM 
			salaries
        GROUP BY emp_no ) s1 ON s.emp_no = s1.emp_no
WHERE 
	s.to_date BETWEEN '2000-01-01' AND  '2002-01-01'
    AND s.from_date = s1.from_date;

###############################################################################################
SELECT 
    AVG(salary) AS avg_salary
FROM
    salaries;




















