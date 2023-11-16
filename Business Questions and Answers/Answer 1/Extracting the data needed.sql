select t1.orderDate, t1.orderNumber, t3.productName, 
t3.productLine, t4.city, t4.country, t2.quantityOrdered, t2.priceEach
from orders t1
join orderdetails t2
on t1.orderNumber = t2.orderNumber
join products t3
on t2.productCode = t3.productCode
join customers t4
on t1.customerNumber = t4.customerNumber