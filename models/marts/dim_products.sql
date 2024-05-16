with
    products as (
        select *
        from {{ ref('stg_erp__products') }}
    )

select * 
from products