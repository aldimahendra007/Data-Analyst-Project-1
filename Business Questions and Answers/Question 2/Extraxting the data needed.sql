with product_table as
(
select t1.orderNumber, productLine, t1.productCode
from orderdetails t1
join products t2
on t1.productCode = t2.productCode
)

select distinct t1.ordernumber, t1. productCode, t1.productLine as product_1, t2.productLine as product_2
from product_table t1
left join product_table t2
on t1.orderNumber = t2.orderNumber and t1.productLine <> t2.productLine