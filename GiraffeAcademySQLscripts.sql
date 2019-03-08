CREATE TABLE student(
	student_id INT,
	name VARCHAR(20),
	major VARCHAR(20),
	PRIMARY KEY(student_id)
);

DESCRIBE student; /*DESCRIBE will return the structure of the table in question*/

DROP TABLE student; /*DROP TABLE, This line of code deletes a table*/

ALTER TABLE student ADD gpa DECIMAL(3, 2); /*ALTER is a statement used to edit a column, perhaps a row, maybe, in this instance it adds to the table a column of gpa with a value of no whole numbers, decimal. 
											This adds a parameter of the decimanl either being 3 or 2	*/
											
ALTER TABLE student DROP COLUMN gpa;      /*Here we see the statment DROP being used to DROP only one column at a time. A good way to delete specific data.*/

INSERT INTO student VALUES(1, 'Jack', 'Biology', 3.20),		/*We use the statement INSERT to put data into a table, but we need to know which table, use statement INTO, which specifies the route used. */
						  (2, 'Kate', 'Sociology', 4.00),		/* table student. To write the actual values we place them in parenthesis, (), student_id is an INT so 1 is used, */
						  (3, 'Claire', 'English', 3.65),					/*name is a VARCHAR(20) so 'Jack' is used,*/
						  (4, 'Jack', 'Biology', 3.20),					/*major is a VARCHAR(20) so 'Biology' is used.*/
						  (5, 'Mike', 'Comp. Sci.', 2.80);				/*Here we can put many values into the rows of our table with this syntax. 
														  The final row of parenthesis has no comma but a semi colon to close the data block.
														  Remember when inserting data, column count, muust match row count unless stated otherwise. In this case we must have 4 row valuess to match our 4 columns.*/
														  
														  
SELECT * FROM student WHERE student_id = 1;			/*The statement SELECT can choose any data you want, * symbol means all, so all data, */

INSERT INTO student(student_id, name) VALUES(6, 'Randy');    /*With this INSERT statement, I can specify the parameters as what only to add to the table, so in this case I only define (student_id, name)
																therefore SQL will ignore all other columns and rows and only add the ones defined.
																A student with an id of 6 and a name of Randy. 
																With the parameters et we don't have to worry about column count matching rows.*/

CREATE TABLE student(
	student_id INT,
	name VARCHAR(20) NOT NULL,			/* By placing a NOT NULL parameneter the table will not accept a blank value as an insert or entry*/
	major VARCHAR(20) UNIQUE,			/* By placing statement UNIQUE it states that everything that gets entered into the row of the column must be different or have one instance.*/ 
	gpa DECIMAL(3, 2),
	PRIMARY KEY(student_id)
);



CREATE TABLE student(
	student_id INT,
	name VARCHAR(20) NOT NULL,	
	major VARCHAR(20) DEFAULT 'undecided',		/*By having the statement DEFAULT, it places a string of whatever value we set  */
	gpa DECIMAL(3, 2),
	PRIMARY KEY(student_id)
);

INSERT INTO student(student_id, name, gpa) VALUES(1, 'Jack', 3.20),		
											(2, 'Kate', 4.00),		
											(3, 'Claire', 3.65),					
											(4, 'Jack', 3.20),	  /*cannot have a major VALUE of 'Biology', as it already exists.*/				
											(5, 'Mike', 2.80);

ALTER TABLE student DROP COLUMN major;   /* Let's say you made an error with a column and need to remove it. In order to make any changes ALTER TABLE statement must be written first, followed by table name then the statements needed.
											In this case it is DROP COLUMN as we want to delete column 'major'.*/

										
CREATE TABLE student(
	student_id INT AUTO_INCREMENT,			/*This increments the student ID number by 1 so you don't have to provide a number, it could be blank. */
	name VARCHAR(20) NOT NULL,	
	major VARCHAR(20) DEFAULT 'undecided',		/*By having the statement DEFAULT, it places a string of whatever value we set  */
	gpa DECIMAL(3, 2),
	PRIMARY KEY(student_id)
);

INSERT INTO student(name, gpa) VALUES('Jack', 3.20),	/*In this case you won't have to add student_id as a parameter. AUTO increment feature already does that for us.*/	
									 ('Kate', 4.00),		
									 ('Claire', 3.65),					
									 ('Jack', 3.20),	  /*cannot have a major VALUE of 'Biology', as it already exists.*/				
									 ('Mike', 2.80);


INSERT INTO student(name, major, gpa) VALUES('Bob', 'Biology', 3.20),		
						  					('Gene', 'Gender Studies', 4.00),		
						  					('Clark', 'Analytics', 3.65),					
						  					('Jill', 'Biology', 3.20),					
						  					('Marlboro', 'Biology', 2.90);

											
SELECT * FROM student;											/*In order to update your fields first you must write this line of code which selects everything from your table student.*/
UPDATE student SET major = 'Bio' WHERE major = 'Biology'; 		/*The statement UPDATE will change something, SET is a command used in conjunction with UPDATE and specifies which columns and values need to be updated in a table.
																  WHERE is a command that specifies the location of a particular column or row that needs to be selected.
																  simply put here major is equal to the string 'Biology'.*/

SELECT * FROM student;											
UPDATE student SET major = 'Mental illness research' WHERE major = 'Gender Studies';

SELECT * FROM student;											
UPDATE student SET major = 'Computer Science' WHERE major = 'undecided' OR major = 'Analytics';   /*OR command is a logic operator, either or.*/

SELECT * FROM student;											
UPDATE student SET name = 'Tom', major = 'Islamic Studies', gpa = 2.95 WHERE student_id = 4;


DELETE FROM student;			/*DELETE FROM this particular table will only delete the rows but leave the structure intact.*/

DELETE FROM student WHERE student_id = 5; 	/*This will delete a row with the student_id of 5.*/

DELETE FROM student WHERE name = 'Tom' AND major = 'undecided';    /*AND command acts similiar to the OR command except with AND both conditions must be true or else it won't work. */

SELECT * FROM student; /*This selects all information in the table students.*/

SELECT name FROM student; /*This selects the name column & row combination only from table student.*/

SELECT student.name, student.major, student.gpa FROM student;    /*Writing student.name means it'll state the table that you got the name from, in this case its student. You can then add a comma after each dataset you want returned.*/ 

SELECT student.name, student.major, student.gpa FROM student ORDER BY name;   /*ORDER BY command simply lists all information alphabetically by name. You could really make it by any colum you wanted. By default all data is
																				returned in ascending order unless it is specified otherwise.*/
SELECT student.name, student.major, student.gpa FROM student ORDER BY gpa;
SELECT student.name, student.major, student.gpa FROM student ORDER BY major;
SELECT student.name, student.major, student.gpa FROM student ORDER BY student_id; 	/*It'd be redundant.*/

SELECT student.name, student.major, student.gpa FROM student ORDER BY student_id DESC; 	/*DESC statement means decending order which places the largest first then descends.*/
SELECT student.name, student.major, student.gpa FROM student ORDER BY student_id ASC;  /*ASC statement stands for ascending order. Smallest to largest. It ascends. */


SELECT student.major, student.gpa  FROM student ORDER BY gpa ASC;   /*Remember the order in which it goes by is determined the column stated after ORDER BY, in case you are unsure of something. */

SELECT student.major, student.gpa, student.name  FROM student ORDER BY gpa DESC LIMIT 5;    /*The LIMIT statement tells us we can only be alotted 5 results. We are checking for the 5 best students based on GPA.*/ 


SELECT * FROM student WHERE major = "Biology"; 

SELECT * FROM student WHERE major = "Computer Science" OR major = "Nuclear Physics" ORDER BY gpa;

SELECT * FROM student WHERE major = "Computer Science" OR major = "Nuclear Physics" ORDER BY gpa DESC LIMIT 3; 	/*This displays all students with a major of computer science or nuclear physics which have the three highest GPAs.*/

SELECT student.name, student.major FROM student WHERE gpa = 3.20 ORDER BY major DESC;   /*This displays all student names an majors who have a gpa of 3.20 and lists those names+majors in descending order.*/
 
SELECT name, major FROM student WHERE major = 'Computer Science' OR name = 'Clarke';



SELECT * FROM student WHERE student_id <= 3;

-- <, >, <=, >=, =, <>, AND, OR, in SQL <> means not equal to, != is still not equal to

SELECT * FROM student WHERE student_id != 3;

SELECT * FROM student WHERE student_id <= 7 AND name != 'Frank';

SELECT * FROM student WHERE name IN ('Claire', 'Kate', 'Mike');   /*IN statement means that for all values which contain these strings.*/

SELECT * FROM student WHERE major IN ('Biology', 'Nuclear Physics', 'Computer Science');

SELECT * FROM student WHERE major IN ('Biology', 'Nuclear Physics', 'Computer Science') AND name IN ('Jack', 'Marlton', 'Clark', 'Kate', 'Jill'); 			/*Here's how you get two of these. */


Database Schema - Dunder Mifflin

CREATE TABLE employee ( emp_id INT PRIMARY KEY,
                       first_name VARCHAR(40),
                       last_name VARCHAR(40),
                       birth_date DATE,
					   sex VARCHAR(1),
					   salary INT,
					   super_id INT,			/*At some point these will be defined as foreign keys*/			
					   branch_id INT			/*At some point these will be defined as foreign keys*/
);
					  
CREATE TABLE branch ( branch_id INT PRIMARY KEY,
					 branch_name VARCHAR(40),
					 mgr_id INT,
					 mgr_start_date DATE,
					 FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL			/*The FOREIGN KEY(mgr_id) will point to the table employee with the value being (emp_id) which is what it points to.*/ 
);

ALTER TABLE employee ADD FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL; 	/*What is done here is we made the branch_id of table employee a foreign key which refers to the table branch's column branch_id.*/

ALTER TABLE employee ADD FOREIGN KEY(super_id) REFERENCES employee(emp_id) ON DELETE SET NULL; 		/*What is done here is we made the super_id of table employee a foreign key which refers to the table employee's column emp_id.*/


CREATE TABLE client ( client_id INT PRIMARY KEY,
					  client_name VARCHAR(40),
					  branch_id INT,
					  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL 
);

CREATE TABLE works_with ( emp_id INT,
						  client_id INT,
						  total_sales INT,
						  PRIMARY KEY(emp_id, client_id),
						  FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
						  FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
); 

CREATE TABLE branch_supplier ( branch_id INT,
                               supplier_name VARCHAR(40),
                               supply_type VARCHAR(40),
                               PRIMARY KEY(branch_id, supplier_name),
                               FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);

-- Corporate
INSERT INTO employee VALUES(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);

INSERT INTO branch VALUES(1, 'Corporate', 100, '2006-02-09');

UPDATE employee
SET branch_id = 1
WHERE emp_id = 100;

INSERT INTO employee VALUES(101, 'Jan', 'Levinson', '19-05-11', 'F', 110000, NULL, 1); 

-- Scranton 
INSERT INTO employee VALUES(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL); 

INSERT INTO branch VALUES(2, 'Scranton', 102, '1992-04-06');

UPDATE employee SET branch_id = 2 WHERE emp_id = 102;

INSERT INTO employee VALUES(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2);
INSERT INTO employee VALUES(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2);
INSERT INTO employee VALUES(105, 'Stanely', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);

--Stamford
INSERT INTO employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);

INSERT INTO branch VALUES(3, 'Stamford', 106, '1998-02-13');

UPDATE employee SET branch_id = 3 WHERE emp_id = 106;

INSERT INTO employee VALUES(107, 'Amdy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3),
						   (108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);

-- BRANCH SUPPLIER
INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper'),
									(2, 'Uni-ball', 'Writing Utensils'),
									(3, 'Patriot Paper', 'Paper'),
									(2, 'J.T. Forms & Labels', 'Custom Forms'),
									(3, 'Uni-ball', 'Writing Utensils'),
									(3, 'Hammer Mill', 'Paper'),
									(3, 'Stamford Lables', 'Custom Forms');

-- CLIENT
INSERT INTO client VALUES(400, 'Dunmore Highschool', 2),
						 (401, 'Lackawana Country', 2),
						 (402, 'FedEx', 3),
						 (403, 'John Daly Law, LLC', 3),
						 (404, 'Scranton Whitepages', 2),
						 (405, 'Times Newspaper', 3),
						 (406, 'FedEx', 2);

-- WORKS_WITH
INSERT INTO works_with VALUES(105, 400, 55000),
							 (102, 401, 267000),
							 (108, 402, 22500),
							 (107, 403, 5000),
							 (108, 403, 12000),
							 (105, 404, 33000),
							 (107, 405, 26000),
							 (102, 406, 15000),
							 (105, 406, 130000);

--Queries for Dunder Mifflin
SELECT * FROM employee; 

SELECT * FROM client;

SELECT * FROM employee ORDER BY salary DESC;  

SELECT employee.sex, employee.first_name, employee.last_name FROM employee; 

SELECT * FROM employee ORDER BY employee.sex, employee.first_name, employee.last_name DESC; 

SELECT * FROM employee LIMIT 5;

SELECT employee.first_name, employee.last_name FROM employee; 

SELECT employee.first_name AS forename, employee.last_name AS surename FROM employee; 

SELECT DISTINCT sex FROM employee; 

SELECT DISTINCT branch_id FROM employee; 

--SQL Function
SELECT COUNT(emp_id) FROM employee;

SELECT COUNT(super_id) FROM employee;

--Finds all employees who are female and born after 1970
SELECT COUNT(emp_id) FROM employee WHERE employee.sex = 'F' AND birth_date > '1970-01-01'; 

--Find avg of all employee's salaries 
SELECT AVG(salary) FROM employee; 

SELECT AVG(salary) FROM employee WHERE sex = 'M';  /*The average of only male employees*/

--Find sum of all employee's salaries
SELECT SUM(salary) FROM employee; 

--Find all employees
SELECT COUNT(sex) FROM employee;

SELECT COUNT(first_name) FROM employee; /*Does do the same thing as 'sex' as any column that signifies and entity could be this.*/

--Find out how many males and females there are 
SELECT COUNT(sex), sex FROM employee GROUP BY sex;     /*Groups information by sex, how many entries there are, it aggregates data, GROUP BY function.*/ 

--Find the total sales of each salesman
SELECT SUM(total_sales), emp_id FROM works_with GROUP BY emp_id; /*For this query, we select the sum of total_sales column, from there we put a comma because we are checking another column in the same table so we must syntax it this way.
																   then we say WHERE is this data coming FROM, the table is works_with and we GROUP BY emp_id, which we can use emp_id as a primary key and can reference many different tables.*/

--Find out how much each client spends
SELECT SUM(total_sales), client_id FROM works_with GROUP BY client_id; 		/*It is written about the same as the last query.*/

--Wildcards, they define different patterns we want to match specific pieces of data to, grab data that matches a prompt.  
--syntax
		/* % = any # characters, _ = one character */

--Find any clients who are an LLC 
SELECT * FROM client WHERE client_name LIKE '%LLC';    /*Like is a special SQL keyword used to match for a pattern such as a string or something like it. The reason we use a % sign is because it stands here for any number of characters then 
														 followed by the rest of our string. ex: John Daily LLC.*/
														 
--Find any branch supplier that are in the label business
SELECT * FROM branch_supplier WHERE supplier_name LIKE '%Labels%';  /*We use two percent signs in case there's something before and after Labels.*/

--Find all employees born in October
SELECT * FROM employee WHERE birth_date LIKE '_____-10%';  		/*underscore represents any single type of chracter. In this instance we have 4 underscore characters to represent 4 characters, - for the dash, followed by our 10 for October
																	  then a % for anything proceeding.*/
SELECT * FROM employee WHERE birth_date LIKE '%10%';			/* This also works but you should watch out in case you need to have only 4 specific places for the date.*/

--Find any clients that are schools
SELECT * FROM client WHERE client_name LIKE '%school%';

--Union, is a special SQL operator which combines the results of (multiple/maybe just two) Select statements into one. 	/*A join allows you to relate similar data in different tables.*/ 
																										/*A union returns the results of two different queries as a single recordset. 
																										Joins and unions can be used to combine data from one or more tables. ... 
																										The rows are in the same result.*/ 

--Find a list of employee and branch names	
SELECT first_name FROM employee UNION SELECT branch_name FROM branch;		/*The union statement lets me combine two select statements.*/
																			/*This works because you have similiar strings being joined and the column row count matches. */

SELECT first_name FROM employee UNION SELECT branch_name FROM branch UNION SELECT client_name FROM client;

--Find a list of all clients and branch suppliers names
SELECT client.client_name, client.branch_id FROM client UNION SELECT branch_supplier.supplier_name, branch_supplier.branch_id FROM branch_supplier;		
																											/*You can put as many columns as you wish but remember, the columns must match the rows on both sides of the union statement.*/
																											/*We use branch_id as it is a foreign key as well as a primary key in their respective tables, it simply gives us a numerical identifier.*/

--Find a list of all money spent or earned by the company
SELECT employee.salary, employee.emp_id FROM employee UNION SELECT works_with.total_sales, works_with.emp_id FROM works_with;


--JOINS, combines data from two or more different tables. Specifically it combines rows from two or more tables based on related columns. 

INSERT INTO branch VALUES(4, 'Buffalo', NULL, NULL);

--Find all branches and the names of their managers
SELECT employee.emp_id, employee.first_name, branch.branch_name FROM employee JOIN branch ON employee.emp_id = branch.mgr_id; 	/*The related columns here are the employee ID's. We are using columns from two different tables before the JOIN statement.
																																  The JOIN combines the employee table and the branch table together. It joins them on a specific column*/
																																/*This JOIN statement works by searching for the employee ID and seeing if there is a manager ID that it is equal to 
																																  across the different branches.*/

--There are four types of JOINs, we have already seen one of them, INNER JOIN combines branches from the employee table and branch table when they have a shared column. Whenever employee.emp_id = branch.mgr_id, the result is returned to us.
--LEFT JOINs we include all rows from the left table, so whatever is written to the left of JOIN will show up. 

SELECT employee.emp_id, employee.first_name, branch.branch_name FROM employee LEFT JOIN branch ON employee.emp_id = branch.mgr_id;  /* As you can see all employees were returned with those not equalling a mgr_id to be NULL in row on the branch column.*/
  

--RIGHT JOINs we include everything written to the right of the JOIN, so any value there from that table will show up.
SELECT employee.emp_id, employee.first_name, branch.branch_name FROM employee RIGHT JOIN branch ON employee.emp_id = branch.mgr_id;  /*Here we find that no employees were found for the Buffalo branch as none exist on the table 'branch'. */

--Nested Queries, a query where multiple select statemnents exist.

--Find name of all employees who have sold over 30,000 to a single client.
SELECT works_with.emp_id FROM works_with WHERE works_with.total_sales > 30000; 


SELECT employee.first_name, employee.last_name FROM employee WHERE employee.emp_id IN 
																					( SELECT works_with.emp_id FROM works_with WHERE works_with.total_sales > 30000 ); /*IN is a statement as previously used in order to get things contained within the parenthesis
																																										but here we can actually put another SELECT statement here, creating a nested query.*/

/*Find all clients who are handled by the branch that Michael Scott manages, Assume you know Michael's ID.*/

SELECT client.client_name FROM client WHERE client.branch_id = (SELECT branch.branch_id FROM branch WHERE branch.mgr_id = 102 LIMIT 1); /*Remember when doing these SQL queries, are always taken in order of whats in the 
																																		  parenthesis first then the rest follows. We use a LIMIT of 1 in case Scott managed more than 1 office.*/


--ON DELETE queries, ON DELETE SET NULL & ON DELTETE SET CASCADE.

/*ON DELETE SET NULL is where we delete any value deleted in the row will now have a value of NULL.
  ON DELETE SET CASCADE is where if we delete a value in a row, we delete the whole row and everything scales accordingly.*/
  
DELETE FROM employee WHERE emp_id = 102; 

SELECT * FROM branch; 
SELECT * FROM employee;

DELETE FROM branch WHERE branch_id = 2;

SELECT * FROM branch_supplier; 

--TRIGGER, a block of SQL code which defines an action that should happen when a certain operation happens on the database.
DELIMITER $$
CREATE	
	TRIGGER my_trigger BEFORE INSERT
	ON employee
	FOR EACH ROW BEGIN
		INSERT INTO trigger_test VALUES('added new employee');
	END$$
DELIMITER ;

INSERT INTO employee VALUES(109, 'Oscar', 'Martinez', '1968-02-19', 'M', 69000, 106, 3);

SELECT * FROM trigger_test;

DELIMITER $$
CREATE	
	TRIGGER my_trigger BEFORE INSERT
	ON employee
	FOR EACH ROW BEGIN
		INSERT INTO trigger_test VALUES(NEW.first_name);
	END$$
DELIMITER ;

SELECT * FROM trigger_test;

INSERT INTO employee VALUES(110, 'Kevin', 'Malone', '1978-02-19', 'M', 69000, 106, 3);

DELIMITER $$
CREATE
	TRIGGER my_trigger BEFORE INSERT 
	ON employee
	FOR EACH ROW BEGIN
		IF NEW.sex = 'M' THEN
			INSERT INTO trigger_test VALUES('added male employee');
		ELSEIF NEW.sex = 'F' THEN
			INSERT INTO trigger_test VALUES('added female employee');
		ELSE
			INSERT INTO trigger_test VALUES('added other employees');
		END IF;
	END$$
DELIMITER ;

INSERT INTO employee VALUES(111, 'Pam', 'Beesly', '1988-02-19', 'F', 69000, 106, 3);

SELECT * FROM trigger_test;
