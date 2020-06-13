/*
Name: Merga Tafa
CSC 355 
Section 510
Assignment 4
SubmissionDate 02/05/ 2020
*/
--1, Display the number of employee who make greater or equal to 90,000

SELECT count(salary), AVG(salary)
	FROM EMPLOYEE
	Where salary >= 90000;
--2, Displays the largest salary in each department with their name ordered by department number

SELECT Dnumber, Dname, Max(salary)
	from department Inner JOIN employee ON department.Dnumber=employee.Dno
   	GROUP BY department.Dnumber, Dname
	ORDER BY department.Dnumber;
--3, It displays the salaries of all male in development department and their salary in ascending order

SELECT last, salary
	from EMPLOYEE
    	INNER JOIN department
   	ON EMPLOYEE.Dno= department.Dnumber
   	where GENDER ='M' AND Dname= 'Development'
	ORDER BY salary ASC;

--4,  It displays the smallest salary in automation project

SELECT MIN(salary)
	from EMPLOYEE
    	INNER JOIN ASSIGNMENT
   	ON   EMPLOYEE.EID= assignment.employeeid
	   
   	WHERE  assignment.projectno =11;
--5, This desplays the project  Ahmed  Salman works on and the total hours he assigned to each project

SELECT  PNAME ,  SUM(hours)
	from  (ASSIGNMENT

	 INNER JOIN  PROJECT ON ASSIGNMENT.PROJECTNO = PROJECT.PNUMBER)
	INNER JOIN employee ON ASSIGNMENT.EMPLOYEEID = EMPLOYEE.EID
	where FIRST='Ahmed' AND LAST='Salman'
	GROUP BY PNAME
	ORDER BY PNAME;
	
	
--6 Display all employee who assigned to three or more project with their ID number

SELECT EmployeeID, Count(PROJECTNO)
    From ASSIGNMENT 
	LEFT OUTER JOIN employee
	ON ASSIGNMENT.EMPLOYEEID = EMPLOYEE.EID
	
	GROUP BY EMPLOYEEID
	HAVING Count(PROJECTNO) >=3;

--7, Display employee ID and full name who has son and along with their son's age

SELECT  EMPLOYEEID, FIRST, LAST, dependent.First, age
	from dependent
	
	where  dependent.First IN(select First
	 			from dependent
				 where relationship='Son') 
				                           
	ORDER BY AGE DESC;
	

			
--8,This Displays the number of project numbers and names with their total hours ordered by  their hourly desending

SELECT COUNT(PROJECTNO) as pnumber, COUNT(Pname) as pname, SUM(hours) as hours
	from (ASSIGNMENT 
		INNER JOIN PROJECT ON ASSIGNMENT.PROJECTNO = PROJECT.Pnumber)
	INNER JOIN employee on ASSIGNMENT.EMPLOYEEID = EMPLOYEE.EID
	where Plocation='Pittsburgh'
	GROUP BY PROJECTNO
	ORDER BY HOURS DESC;

	
