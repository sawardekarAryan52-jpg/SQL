# Clauses
-- We are using clauses to make the query more informative 
/*
Basic Syntax for the clauses is

Select * from table where condition; 
*/



# WHERE CLAUSE --------------------------------------
/*
The WHERE clause is used to filter records based on specified conditions. 
It allows you to specify criteria that the data must meet for it to be included 
in the result set.

The following shows the syntax of the WHERE clause:
SELECT 
    select_list
FROM
    table_name
WHERE
    search_condition;
    
# Operator Description
=	Equal to. You can use it with almost any data types.
<> or !=	Not equal to ==
<	Less than. You typically use it with numeric and date/time data types.
>	Greater than.
<=	Less than or equal to
>=	Greater than or equal to

# filtering operators
1. AND
2. OR
3. LIKE
4. IN 
5. BETWEEN
6. IS NULL 
7. NOT
    
*/

# find all employees whose job titles are Sales Rep
select * from employees
where jobTitle like "Sales Rep";

# find employees whose job titles are Sales Rep and office codes is 1
select * from employees
where jobTitle = "Sales Rep" and officeCode = 1;

# finds employees whose job title is Sales Rep or employees who 
#locate in the office with office code 1
select * from employees
where jobTitle = "Sales Rep" or officeCode = 1;

#Fetch the contact first name of customers having their names starting with C
select * from customers
where contactFirstName like "c%";

#Filter the data where the 2nd character in employees first name is "i"
select * from employees
where firstName like "_i%";

# Filter the employee name starting with T and ending with M consisting 1 
#character  in between them
select * from employees
where firstName like "T_M";

#find all the customers  whose customer numbers are in the range of 104 to 120
select * from customers
where customerNumber between 104 and 120;

# find the employees where the jobtitles can be either VP Sales, VP Marketing or President
select * from employees
where jobTitle in ("VP Sales","VP Marketing","President");


#  MySQL GROUP BY clause ----------------------
 /*
 
 GROUP BY Clause: The GROUP BY clause is used to group rows that have the same 
 values in one or more columns. 
 It is often used in conjunction with aggregate functions to perform calculations 
 on groups of data
 SELECT 
    c1, c2,..., cn, aggregate_function(ci)
FROM
    table
WHERE
    where_conditions
GROUP BY c1 , c2,...,cn;
 */
 # select the items from the orderdetails table. 
 #calculate the subtotal for each order
 select * from orderdetails;
select orderNumber, productCode, quantityOrdered*priceEach as Subtotal
from orderdetails;
 
 #return the order numbers and the total amount of each ordernumber.
select orderNumber, sum(quantityOrdered*priceEach) as `Total amount`
from orderdetails
group by ordernumber;
 
 #extract year from order date, count order per year
 select year(orderdate) as Years, count(*) as OrderNumbers
 from orders
 group by years;
 
 # Find the maximum quantity in stock in each productline.
 select productLine, MAX(quantityinstock) as MaxQuantity
 from products
 group by productLine;
 
 #Calculate the total payment done by each customers
 select customerNumber, sum(amount) as Total_payment
 from payments
 group by customernumber;
 
 #Count how many employees work in each officecode.
 select officeCode, count(employeeNumber)
 from employees
 group by officeCode;
 
 #Find the total quantities ordered by each ordernumber.
 select ordernumber, sum(quantityordered) as total
 from orderdetails
 group by orderNumber;
 

 # HAVING Clause ----------------------
/*
HAVING Clause: The HAVING clause is used to filter records in a GROUP BY 
query based on conditions.
It works similarly to the WHERE clause but operates on grouped data 
rather than individual rows. 
The following illustrates the syntax of the HAVING clause:

SELECT 
    select_list
FROM 
    table_name
WHERE 
    search_condition
GROUP BY 
    group_by_expression
HAVING 
    group_condition;
*/ 

#find which ordernumbers have the total sales greater than 100K
select orderNumber, sum(quantityOrdered*priceeach) as sales
from orderdetails
group by ordernumber
having sales > 60000;

# find orders that have total amount having greater than 50K and contain more than 600 quantities ordered.
select quantityOrdered, sum(quantityOrdered*priceeach) as total
from orderdetails
group by quantityOrdered
having total > 50000 and quantityOrdered > 50;

select ordernumber, sum(quantityOrdered*priceeach) as sales, sum(quantityOrdered) as total
from orderdetails
group by orderNumber
having sales>50000 and total>600;

#Find the offices who have 5 or more than 5 employees working in it.
select officeCode, count(officeCode) as `No of employees`
from employees 
group by officecode
having count(*) >= 5;

#Find the productlines where the maximum quantity in stock is more than 7000
select productline, max(quantityInStock) as `Stocks`
from products
group by productline
having `Stocks` > 7000;


select year(orderdate) as years, status, count(*) as `count of orders`
from orders
where year(orderdate) = 2003
group by year(orderdate), status
having `count of orders` = 1;

# DISTINCT CLAUSE ---------------------------------------------
/*
The DISTINCT clause is used in SQL to return only unique values from 
a column or group of columns. 
This can be useful in a variety of situations, such as:

To get a list of all the unique values in a column.
To remove duplicate rows from a result set.
To compare the unique values in two or more columns.
To calculate aggregate functions on unique values.

Here is the syntax of the DISTINCT clause:
SELECT DISTINCT
    select_list
FROM
    table_name;
*/    

# select unique last names from the customer table
select distinct contactlastname from customers;

select contactlastname, count(contactLastName)
from customers
group by contactlastname
having count(contactlastname)>1;

# get a unique combination of first name as well as the last name from the customers table.
select distinct contactfirstname, contactLastName
from customers;


## ORDER BY CLAUSE - USED TO SORT THE DATA EITHER 
# INTO ASCENDING OR DESCENDING ORDER.

/*
Syntax for ORDER BY

SELECT col1, col2, col3,....
FROM tablename
ORDER BY col1 ASC|DESC, col2 ASC|DESC;

*/

/*
Sort the first name in descending order from the customer table & 
provide the first name, last name & phone no in the output.
*/
select contactfirstname, contactlastname, phone
from customers
order by contactFirstName desc;

 
# Sort the employee ids & their emails  into descending order
select employeenumber, email
from employees
order by employeeNumber desc, email desc; 

# Select customer name, contact no., postal code in the output.Sort the customer names in alphabatical  order
select customername, phone, postalcode
from customers
order by customerName
limit 7 offset 3;

#practice
/* 
SELECT distinct dname, max(sal)
FROM employees
WHERE dloc = "num"
GROUP BY dname
HAVING max(sal)>3000
ORDER BY dname asc/desc
LIMIT 1, OFFSET 2;
*/ 
