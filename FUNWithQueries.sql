SELECT TABLE_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Taverns'; 

SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE CHARACTER_MAXIMUM_LENGTH = CHARACTER_OCTET_LENGTH; 

SELECT TABLE_CATALOG, TABLE_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE CHARACTER_MAXIMUM_LENGTH = CHARACTER_OCTET_LENGTH;

SELECT TOP 2 TABLE_CATALOG, TABLE_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE CHARACTER_MAXIMUM_LENGTH = CHARACTER_OCTET_LENGTH; 
/* In SQLServer, you have to use TOP number|percent column_name(s)
                                FROM table_name
                                WHERE condition;
    As opposed to MySQL where you can put LIMIT 3 after any WHERE conditional.*/

SELECT Top 6 TABLE_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE ORDINAL_POSITION >= 3 AND DATA_TYPE = 'varchar';  

SELECT Top 6 TABLE_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE ORDINAL_POSITION >= 3 AND DATA_TYPE = 'int';

SELECT TABLE_CATALOG, TABLE_NAME, COLUMN_NAME  AS 'Flowers for Alegebra' FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME LIKE '%Location_ID%'; 
                                                                                                                        /*When looking for anything similiar to this string,
                                                                                                                        We use LIKE instead of equal as the percent signs are 
                                                                                                                        a sort of range. Putting a equal sign there would
                                                                                                                        result in no information as nothing is exactly like it.*/

SELECT * FROM client WHERE client_name LIKE '%LLC';    /*Like is a special SQL keyword used to match for a pattern such 
                                                        as a string or something like it. The reason we use a % sign is 
                                                        because it stands here for any number of characters then 
														 followed by the rest of our string. ex: John Daily LLC.*/

SELECT client.client_name, client.branch_id FROM client UNION SELECT branch_supplier.supplier_name, branch_supplier.branch_id FROM branch_supplier;


SELECT Top 1 TABLE_NAME AS 'Create Table Taverns (' FROM INFORMATION_SCHEMA WHERE COLUMN_NAME = 1 AND COLUMN_NAME = 'Taverns';

SELECT Top 1 TABLE_NAME AS 'Create Table Taverns (' FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = 1 AND COLUMN_NAME = 'Taverns' 
UNION SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Taverns';


SELECT Top 1 TABLE_NAME AS 'Create Table Taverns (' FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = 1 AND COLUMN_NAME = 'Taverns' 
UNION SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Taverns' 
UNION SELECT TOP 1 COLUMN_NAME AS ');' FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = ');';


/*
In simple terms, joins combine data into new columns. If two tables are joined together, then the data from the first table is shown 

in one set of column alongside the second table’s column in the same row.

Unions combine data into new rows. If two tables are “unioned” together, then the data from the first table is in one set 

of rows, and the data from the second table in another set. The rows are in the same result.

Here is a visual depiction of a join. Table A and B’s columns are combined into a single result.
*/

SELECT Top 1 TABLE_NAME AS 'Create Table Taverns (' FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = 1 AND COLUMN_NAME = 'Taverns' 
UNION SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Taverns' 
UNION SELECT TOP 1 COLUMN_NAME AS 'Name varchar(100)' FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = ');' UNION ALL SELECT ')';

/*Teachers Solution*/ 

SELECT CONCAT('CREATE TABLE ',TABLE_NAME, ' (') as queryPiece FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Taverns' 
UNION ALL SELECT CONCAT(cols.COLUMN_NAME, ' ', cols.DATA_TYPE, (CASE WHEN CHARACTER_MAXIMUM_LENGTH IS NOT NULL 
Then CONCAT('(', CAST(CHARACTER_MAXIMUM_LENGTH as varchar(100)), ')') Else '' END), ',') as queryPiece FROM INFORMATION_SCHEMA.COLUMNS as cols WHERE TABLE_NAME = 'Taverns' 
UNION ALL SELECT ')'; 