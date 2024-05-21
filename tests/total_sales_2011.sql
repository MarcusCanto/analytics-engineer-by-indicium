with
    sales_2011 as (
        select sum(total_gross_value) as total_gross_value
        from {{ ref('fct_sales') }}
        where order_date between '2011-01-01' and '2011-12-31'
    )

select total_gross_value
from sales_2011
where total_gross_value not between 12646112 and 12646113



