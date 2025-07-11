create materialized view srikant_gold.customer_active as 
select * from srikant_silver.customers_cleaned where `__END_AT` is NULL;


create materialized view srikant_gold.top_customers as
select
  s.customer_id,
  c.customer_name,
  c.customer_email,
  c.customer_city,
  sum(s.total_amount) as total_sales
from srikant_silver.sales_cleaned_pl s
join srikant_gold.customer_active c
  on s.customer_id = c.customer_id
group by all
order by total_sales desc
limit 3;

create materialized view srikant_gold.top_product_by_active_customer as
select
  c.customer_id,
  c.customer_name,
  p.product_id,
  p.product_name,
  p.product_category,
  sum(s.total_amount) as total_sales,
  count(distinct s.order_id) as order_count
from srikant_gold.customer_active c
join srikant_silver.sales_cleaned_pl s
  on c.customer_id = s.customer_id
join srikant_silver.products_cleaned p
  on s.product_id = p.product_id
group by all
order by total_sales desc
limit 10;