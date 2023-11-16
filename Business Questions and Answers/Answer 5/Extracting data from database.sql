with table1 as
(
select t4.orderNumber, productLine, customerName, t1.country as customer_country,t1.city as customer_city, t5.quantityOrdered * t5.priceEach as sales_value, t3.officeCode, t3.country as office_country, t3.city as office_city
from customers t1
join employees t2
on t1.salesRepEmployeeNumber = t2.employeenumber
join offices t3
on t3.officeCode = t2.officeCode
join orders t4
on t1.customerNumber = t4.customerNumber
join orderdetails t5
on t4.orderNumber = t5.orderNumber
join products t6
on t5.productCode = t6.productCode
)

select orderNumber, productline, customerName, customer_country, customer_city, officeCode, office_country, office_city, sum(sales_value) as sales_value
from table1
group by orderNumber, productline, customerName, customer_country, customer_city,
officeCode, office_country, office_city
