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

-- An SQL Query to highest sold product (Qty * Price) on both days

select Order_day, Product_id, max(Quantity * Price) as SOLD_Amount
into temp
from orders 
group by Order_day, Product_id;

select order_day,product_id, sold_amount from (
select ROW_NUMBER() OVER(partition by Order_day order by SOLD_Amount desc) as row, Order_day, product_id, SOLD_Amount
from temp ) as b
where row = 1;