-- find the customers with the highest percentage increment from purchase amount.

create table sales_info (
    TransactionID int primary key,
    Date date,
    CustomerID int,
    CustomerName varchar(20),
    ProductID varchar(20),
    Quantity INT,
    SalesAmount float,
    StoreID  varchar(20),
    StoreName  varchar(20));


INSERT INTO Sales_Info values (1, '2023-01-01', 1000, 'Mahendra', 'P1', 2, 20, 'S1', 'Store A'),
(2, '2023-01-02', 1003, 'Mahi', 'P2', 1, 50, 'S2', 'Store B'),
(3, '2023-01-03', 1008, 'Ananya', 'P3', 3, 45, 'S3', 'Store C'),
(4, '2023-01-04', 2004, 'Rohit', 'P2', 1, 50, 'S1', 'Store A'),
(5, '2023-01-05', 3009, 'Priya', 'P1', 2, 20, 'S2', 'Store B'),
(6, '2023-01-06', 1000, 'Mahendra', 'P3', 4, 60, 'S3', 'Store C'),
(7, '2023-01-07', 1003, 'Mahi', 'P2', 2, 100, 'S1', 'Store A'),
(8, '2023-01-08', 1008, 'Ananya', 'P3', 1, 15, 'S2', 'Store B'),
(9, '2023-01-09', 2004, 'Rohit', 'P1', 1, 120, 'S3', 'Store C'),
(10, '2023-01-10', 3009, 'Priya', 'P2', 3, 150, 'S1', 'Store A'),
(11, '2023-01-11', 1000, 'Mahendra', 'P1', 1, 510, 'S2', 'Store B'),
(12, '2023-01-12', 1003, 'Mahi', 'P3', 2, 300, 'S3', 'Store C'),
(13, '2023-01-13', 1008, 'Ananya', 'P2', 1, 580, 'S1', 'Store A'),
(14, '2023-01-14', 2004, 'Rohit', 'P1', 2, 200, 'S2', 'Store B'),
(15, '2023-01-15', 3009, 'Priya', 'P3', 1, 180, 'S3', 'Store C'),
(16, '2023-01-16', 1000, 'Mahendra', 'P2', 3, 950, 'S1', 'Store A'),
(17, '2023-01-17', 1003, 'Mahi', 'P1', 1, 100, 'S2', 'Store B'),
(18, '2023-01-18', 1008, 'Ananya', 'P3', 2, 300, 'S3', 'Store C'),
(19, '2023-01-19', 2004, 'Rohit', 'P2', 1, 500, 'S1', 'Store A'),
(20, '2023-01-20', 3009, 'Priya', 'P1', 3, 350, 'S2', 'Store B');




select * from sales_info;


-- Solution


with cte as(
    select *,
    sum(SalesAmount) over(order by CustomerID,SalesAmount,date) as purchase_amount 
    from sales_info
    )
select CustomerID,CustomerName,purchase_amount,((purchase_amount - SalesAmount)*100/purchase_amount) as purchase_incr_percentage
    from cte 
order by purchase_amount desc 