with 
    source_customer as (
        select
            cast(BUSINESSENTITYID as int) as pk_store
            , cast(NAME as string) as nm_store
        from {{ source('erp', 'store') }} 
        )

select * 
from source_customer