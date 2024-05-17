with 
    source_sales_reason as (
        select
            cast(SALESREASONID as int) as pk_sales_reason
            , cast(NAME as varchar) as nm_sales_reason
            , cast(REASONTYPE as varchar) as sales_reason_type_code
        from {{ source('erp', 'salesreason') }} 
        )

select * 
from source_sales_reason