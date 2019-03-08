CREATE TABLE employee (
    emp_id INT PRIMARY KEY,  /*Notice we are only putting the PRIMARY KEY, more on that later.*/
    first_name VARCHAR(40),
    last_name VARCHAR(40), 
    birth_day DATE,
    sex VARCHAR(1),
    salary INT,         
    super_id INT,     /*We cannot make super_id or branch_id FOREIGN KEYS yet as the tables don't exist.*/ 
    branch_id INT     /*For now we will just create these columns and make their respective tables later.
                        Those tables will contain the PRIMARY KEYS for the reference.*/
);

CREATE TABLE branch (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(40),
    mgr_id INT,
    mgr_start_date DATE,
    FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
    /*See line 18, we can make any number of foreign keys. However, the key it references must exist
    in another table, in this case mgr_id reference the column emp_id, which is the primary key of table
    employee. */
);

/*The reason this line of code works is because the FOREIGN KEY super_id references the column emp_id 
which is the PRIMARY KEY but also the table containing it exists so you will not have any errors.*/

ALTER TABLE employee ADD FOREIGN KEY(super_id) REFERENCES employee(emp_id) ON DELETE SET NULL; 

/*This code works the same as lines 24-25, again we see branch_id as the PRIMARY KEY and the column can 
be referenced by a FOREIGN KEY.*/

ALTER TABLE employee ADD FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL; 

/*FOREIGN KEYS reference PRIMARY KEYS in there respective tables.*/

CREATE TABLE client (
    client_id INT PRIMARY KEY,
    client_name VARCHAR(40),
    branch_id INT, 
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
    /*branch_id in table client has been made a FOREIGN KEY which will reference the 
    PRIMARY KEY of branch_id in table branch.*/
); 

CREATE TABLE works_with (
    emp_id INT,
    client_id INT, 
    total_sales INT,
    PRIMARY KEY(emp_id, client_id),  /*This is a COMPOSITE PRIMARY KEY, meaning two values 
                                        placed together which creates a unique value. 
                                        This is how you make a COMOSITE KEY
                                        which also doubles as a primary.*/
    FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
    FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

/*Composite keys
In database design, a composite key is a candidate key that consists of two or more attributes 
(table columns) that uniquely identify an entity occurrence (table row). A compound key is a 
composite key for which each attribute that makes up the key is a simple (foreign) key in its 
own right.

A table can have many candidate keys but only one primary key. The primary key cannot be null. 
In this example, only FirstName is a single-column candidate key, because it is the only column 
that is unique and not null. A composite primary key is a primary key consisting of more than
 one column.
*/
/*When making a database to make a sole PRIMARY KEY, you write it on the same line you call the column.
To make a composite PRIMARY KEY, you call the columns below in parenthesis.*/

CREATE TABLE branch_supplier (
    branch_id INT,
    supplier_name VARCHAR(40),
    supply_name VARCHAR(40),
    PRIMARY KEY(branch_id, supplier_name),
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);

--ON DELETE queries, ON DELETE SET NULL & ON DELTETE SET CASCADE.

/*ON DELETE SET NULL is where we delete any value deleted in the row will now have
  a value of NULL. ON DELETE SET CASCADE is where if we delete a value in a row, we 
  delete the whole row and everything scales accordingly.*/
