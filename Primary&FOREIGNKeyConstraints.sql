--Working with PRIMARY KEY & FOREIGN KEY constraints
/*To make the relationship between two or more than two tables.

CONDITIONS: 
1) One table contains a primary key and another table will contain the foreign key.

2) A common column in both tables.

3) The common column datatype must be the same in both tables.
*/

CREATE TABLE department ( --treated as the parent table 
    deptno INT PRIMARY KEY,
    deptname VARCHAR(40),
    deptlocation VARCHAR(40)
);

INSERT department VALUES (10,'DBA','HYD'),
                        (20,'SAP','Mumbai'),
                        (30,'HR','Pune'); 

SELECT * FROM department; 

CREATE TABLE employee ( --treated as child table of department
    empid INT, 
    empname VARCHAR(40),
    salary DECIMAL, 
    deptno INT,
    FOREIGN KEY(deptno) REFERENCES department(deptno) /*calling the foreign key.*/ 
);

SELECT * FROM employee;

INSERT employee VALUES(101, 'ADAMS', 56000.00, 10);

INSERT employee VALUES(102, 'JAMES', 45000.00, 20);

INSERT employee VALUES(103, 'SCOTT', 37000.00, 30);

/*Remember you cannot insert any value that isn't 10, 20, 30 for the department table's deptno, 
you only set there to be 10, 20, and 30 in the parent table department.

The foreign key must fall within the constraints of the column it references.*/