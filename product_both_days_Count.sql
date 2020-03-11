CREATE TABLE orders (
    Order_Day varchar(10) NOT NULL,
    Order_id VARCHAR(10) NOT NULL,
    Product_id VARCHAR (10) NOT NULL,
    Quantity INT NOT NULL,
    Price INT NOT NULL
);
INSERT INTO orders
VALUES 
('01-JUL-11', 'O1', 'P1', 5, 5),
('01-JUL-11', 'O2', 'P2', 2 ,10),
('01-JUL-11', 'O3', 'P3', 10, 25),
('01-JUL-11', 'O4', 'P1', 20, 5),
('02-JUL-11', 'O5', 'P3', 5, 25),
('02-JUL-11', 'O6', 'P4', 6, 20),
('02-JUL-11', 'O7', 'P1', 2, 5),
('02-JUL-11', 'O8', 'P5', 1, 50),
('02-JUL-11', 'O9', 'P6', 2, 50),
('02-JUL-11', 'O10', 'P2', 4, 10);

-- An SQL Query to get all products that got sold in both the days and the number of times the 
-- product is sold.

select order_day, product_id, count(*) as ct
into temp
from orders
group by order_day, product_id;

select product_id, sum(ct)
from temp
group by product_id
having count(*) >1;