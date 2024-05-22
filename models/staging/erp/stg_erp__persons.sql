with 
    source_person as (
        select
            cast(BUSINESSENTITYID as int) as pk_person
        from {{ source('erp', 'person') }} 
        )

select * 
from source_person