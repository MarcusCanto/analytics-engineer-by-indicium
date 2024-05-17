with 
    source_sales_order_header_sales_reason as (
        select
            cast(SALESORDERID as int) as fk_sales_order_header
            , cast(SALESREASONID as int) as fk_sales_reason
        from {{ source('erp', 'salesorderheadersalesreason') }} 
        )

select * 
from source_sales_order_header_sales_reason