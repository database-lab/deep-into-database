select customer_id from orders where product_name = 'A' 
intersect
select customer_id from orders where product_name = 'B' 
except
select customer_id from orders where product_name = 'C'
	