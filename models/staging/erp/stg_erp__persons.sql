with 
    source_person as (
        select
            cast(BUSINESSENTITYID as int) as pk_person
            , cast(FIRSTNAME as varchar) as firs_name_person
            , cast(MIDDLENAME as varchar) as middle_name_person
            , cast(LASTNAME as varchar) as last_name_person
            , cast(SUFFIX as varchar) as suffix_person
        from {{ source('erp', 'person') }} 
        )

select * 
from source_person