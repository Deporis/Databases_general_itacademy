USE sql_store;

SELECT * #costumer_id, first_name, like this we select directly the columns
FROM customers # like this we specify the table we want to query
-- WHERE customer_id = 1 #to search a spific id data on the tables
# if we want to avoid a intire line, we use '--'
ORDER BY first_name 
# El orden de los clauses es importante, siempre empezamos con un SELECT --> FROM --> WHERE --> ORDER BY

#SELECT CLAUSE ------------------------------------------------------------------------------------

SELECT 
	name,
    unit_price,
    unit_price * 1.1 AS new_price
FROM products

SELECT DISTINCT state # when we use DISTINCT we don't see repeated values
FROM customers

SELECT #if its getting too long, we can indent
	first_name,
    last_name,
	points,
    (points + 10) * 100 AS 'discount factor' # to give an alias, a descriptive name
FROM customers

# WHERE CLAUSE ------------------------------------------------------------------------------------

SELECT *
FROM orders
WHERE order_date >= '2019-01-01'

# EXERCISE
SELECT *
FROM costumers
WHERE NOT (birth_date > '1990-09-09' OR points > 1000)
# Remember that the not is equal to change everything to the opposite: < -- AND -- <

FROM order_items
WHERE order_id = 6 AND quantity * unit_price > 30

# IN OPERATOR -----------------------------------------------------------------------------------------------
SELECT *
FROM customers
WHERE state = 'VA' OR state = 'FL' OR state = 'GA'
# ==
WHERE state IN ('VA', 'FL', 'GA') # OR NOT IN -- TO COMPARE

# EXERCISE
SELECT * # to get all the columns
FROM products
WHERE quantity_in_stock IN (49, 38, 72)
# the null value marks that we don't have a 72

# BETWEEN OPERATOR -----------------------------------------------------------------------------------------------

SELECT *
FROM customers
WHERE points >= 1000 AND points <= 3000
# ==
WHERE points BETWEEN 1000 AND 3000

# EXERCISE
SELECT *
FROM customers
WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01'

# LIKE OPERATOR -----------------------------------------------------------------------------------------------

SELECT *
FROM customers
WHERE last_name LIKE '%b%' # use the % to indicate any number of carachters after, if not it will search only the b
# %b, or %b%, or b%
WHERE last_name LIKE '_____y' # to indicate the exactly number of characters
-- % any number of characters
-- _ single character

# EXERCISE
SELECT *
FROM customers
WHERE address LIKE '%trail%' OR address LIKE '%avenue%'

SELECT *
FROM customers
WHERE phone LIKE '%9'

# REGEXP OPERATOR -----------------------------------------------------------------------------------------------

SELECT *
FROM customers
WHERE last_name LIKE '%field%'
# ==
WHERE last_name REGEXP 'field'
# ^, the last_name must start with field -- BEGINNING
# $, the last_name must end with this field -- END
WHERE last_name REGEXP 'field|mac|rose'
# |, the last_names that has field or mac or rose -- OR
# We can implement ^ and $ with |
WHERE last_name REGEXP 'e'
WHERE last_name REGEXP '[gim]e'
# [], any of the char inside can come before/after e ---> ge | ie | me
# we can also set a range --> instead of [abcdefg] we use [a-g]

# EXERCISE

SELECT *
FROM customers
WHERE first_name REGEXP 'elka|ambur'

WHERE last_name REGEXP 'ey$|on$'

WHERE last_name REGEXP '^my|se'

WHERE last_name REGEXP 'b[ru]'

# NULL OPERATOR -----------------------------------------------------------------------------------------------

SELECT *
FROM customers
WHERE phone IS  NOT NULL

# EXERCISE

SELECT *
FROM orders
WHERE shipped_date IS NULL

# ORDER BY OPERATOR -----------------------------------------------------------------------------------------------

SELECT *
FROM customers
ORDER BY state DESC, first_name DESC
# we can use diferent columns and order them in asc o desc, note that the first column is the 'most important'
# it will order by state and the by first_name

SELECT first_name, last_name, 10 AS points
FROM customers
ORDER BY points, first_name
# as before, but only a few selectings, we are ordering by points and first_name, it doesn't matter if 
# the selected is not in order by, mysql will order it, see the next example:

SELECT first_name, last_name
FROM customers
ORDER BY birth_date

# EXERCISE 

SELECT *, quantity * unit_price AS total_price
FROM order_items
WHERE order_id = 2
ORDER BY total_price DESC

# LIMIT OPERATOR -----------------------------------------------------------------------------------------------

SELECT *
FROM customers
LIMIT 6, 3
-- page 1: 1 - 3
-- page 2: 4 - 6
-- page 3: 7 - 9
# the limit with two values mean, first = skip until that number, second = show the 3 after

# EXERCISE
SELECT *
FROM customers
-- WHERE
ORDER BY points DESC
LIMIT 3
# PAY ATTENTION THE ORDER

# INNER JOINS -----------------------------------------------------------------------------------------------

SELECT order_id, o.customer_id, first_name, last_name 
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
# in moment we have the same column in multiple tables we need to clarify them by prefixing the name of the table
# if que put only costumer_id, mysql will not know which table chose

# as we are repeating several times orders or costumers, we can make an alias when calling it, 
# not sure if its a good practice but we can: orders as o and costumers as c.

# EXERCISE 
# Join order_items with products, for each order return both the product id and its name followed by the quantiti and unit_price

SELECT order_id, oi.product_id, name, quantity, oi.unit_price
FROM order_items oi
INNER JOIN products p ON oi.product_id = p.product_id

# JOINING ACROSS DATABASES -----------------------------------------------------------------------------------------------

SELECT *
FROM order_items oi
JOIN sql_inventory.products p ON oi.product_id = p.product_id

# SELF JOINS -----------------------------------------------------------------------------------------------

USE sql_hr;

SELECT e.employee_id, e.first_name, m.first_name AS manager
FROM employees e
JOIN employees m ON e.reports_to = m.employee_id
# Añadimos la tabla employee as e, añadimos la misma tabla as m, y ahora el valor de reports_to de e la igualamos a employee_id
# Como que reports_to --> 37270, y buscamos que employee_id tiene ese número

