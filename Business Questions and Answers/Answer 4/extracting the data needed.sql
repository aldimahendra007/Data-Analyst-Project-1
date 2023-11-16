with table1 as
(
select t1.orderNumber, t1.orderDate, t3.customerNumber, t3.customerName, quantityOrdered*priceEach as sales_value
from orders t1
join orderdetails t2
on t1.orderNumber = t2.orderNumber
join customers t3
on t1.customerNumber = t3.customerNumber
),

table2 as
(
select ordernumber, orderdate, customernumber, customername, sum(sales_value) as sales_value
from table1
group by 1, 2, 3
),

table3 as
(
select ordernumber, orderdate, customernumber, customername, row_number() over (partition by customernumber order by orderdate) as purchasenumber,
lag(sales_value) over (partition by customerName order by orderdate) as prev_sales, sales_value
from table2
)

select *, sales_value - prev_sales as sales_value_change
from table3
where prev_sales is not null