create or replace view sales_data_for_power_bi as

select ord.ordernumber, ord.orderDate, pr.productLine, productName, cu.customerName, cu.country as customer_country, o.country as office_country, 
buyPrice, priceEach, quantityOrdered,
priceEach * quantityordered as sales_value,
buyPrice * quantityOrdered as cost_of_sales
from orders ord
join orderdetails orddet
on ord.orderNumber = orddet.orderNumber
join customers cu
on ord.customerNumber = cu.customerNumber
join employees em
on em.employeeNumber = cu.salesRepEmployeeNumber
join offices o
on o.officeCode = em.officeCode
join products pr
on pr.productCode = orddet.productCode