with
    credit_card as (
        select *
        from {{ ref('stg_erp__credit_card') }}
    )

select * 
from credit_card