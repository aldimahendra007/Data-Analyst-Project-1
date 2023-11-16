with sales as (
select t1.ordernumber, t1.customerNumber, creditLimit, quantityOrdered*priceEach as sales_value
from orders t1
join orderdetails t2
on t1.orderNumber = t2.orderNumber
join customers t3
on t1.customerNumber = t3.customerNumber
)

select ordernumber, customerNumber, sum(sales_value), 
case when creditLimit < 75000 then "less than 75k"
when creditLimit between 75000 and 100000 then "between 75k - 100k"
when creditLimit between 100000 and 150000 then "between 100k - 150k"
when creditLimit > 150000 then "over than 150k"
else "error"
end as creditlimitgroup
from sales
group by ordernumber, customerNumber, creditLimit