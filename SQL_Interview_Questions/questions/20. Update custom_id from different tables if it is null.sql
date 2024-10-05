
--- we have table1,table2,table3 each table has customid with no common values. 
-- Club all customid into one table if they are null



CREATE TABLE table1 (
  order_id INT,
  order_date DATE,
  sales DECIMAL(10,2),
  product_id INT,
  custom_id INT
);


CREATE TABLE table3 (
  custom_id INT,
  product_id INT,
  order_id INT,
  shipping_date DATE,
  status VARCHAR(50)
);


CREATE TABLE table2 (
  custom_id INT,
  address VARCHAR(255),
  pincode INT,
  city VARCHAR(100)
);


INSERT INTO table1 (order_id, order_date, sales, product_id, custom_id)
VALUES
(1, '2022-01-01', 100.00, 1, 1),
(2, '2022-01-05', 200.00, 2, 2),
(3, '2022-01-10', 300.00, 3, 3);


INSERT INTO table2 (custom_id, address, pincode, city)
VALUES
(4, 'Address 1', 12345, 'City 1'),
(5, 'Address 2', 67890, 'City 2'),
(6, 'Address 3', 34567, 'City 3');


INSERT INTO table3 (custom_id, product_id, order_id, shipping_date, status)
VALUES
(7, 1, 1, '2022-01-02', 'Shipped'),
(8, 2, 2, '2022-01-06', 'Delivered'),
(9, 3, 3, '2022-01-11', 'In Transit');



-- solution:

select 
    coalesce(t1.custom_id, t2.custom_id, t3.custom_id) as custom_id,
    coalesce(to_char(t1.order_date), 'NA') as order_date,
    coalesce(to_char(t1.sales), 'NA') as sales
    -- ... (similar for other numeric columns)
from table1 t1
full join table2 t2 on t1.custom_id = t2.custom_id
full join table3 t3 on t1.custom_id = t3.custom_id
order by custom_id



-- CUSTOM_ID	ORDER_DATE	SALES
-- 1	        01-JAN-22	100
-- 2	        05-JAN-22	200
-- 3	        10-JAN-22	300
-- 4	        NA	        NA
-- 5	        NA	        NA
-- 6	        NA	        NA
-- 7	        NA	        NA
-- 8	        NA	        NA
-- 9	        NA	        NA

