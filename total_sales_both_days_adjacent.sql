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

-- An SQL Query to get all products, total sales on 01-JUL-11 and 02-jul-11 adjacent to each other.

select Order_day, Product_id, sum(Quantity * Price) as SOLD_Amount
into temp
from orders 
group by Order_day, Product_id;

select product_id, SOLD_Amount as sold_amount_1 
into temp_1
from 
temp where order_day = '01-JUL-11';

select product_id, SOLD_Amount as sold_amount_2 
into temp_2
from 
temp where order_day = '02-JUL-11';

select isnull(temp_1.product_id,temp_2.product_id) as product_id, 
isnull(sold_amount_1,0) as Total_sales_01, isnull(sold_amount_2,0) as total_sales_02 from
temp_1 full outer join temp_2
on temp_1.product_id = temp_2.product_id
