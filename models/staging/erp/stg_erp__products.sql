with
    source_products as (
        select
            cast(PRODUCTID as int) as pk_product
            , cast(NAME as varchar) as nm_product
        from {{ source('erp', 'product') }} 
    )

select *
from source_products
