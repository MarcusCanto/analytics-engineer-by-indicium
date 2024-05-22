with 
    source_state_province as (
        select
            cast(STATEPROVINCEID as int) as pk_state_province
            , cast(COUNTRYREGIONCODE as varchar) as fk_country_region
            , cast(NAME as varchar) as nm_state_province
        from {{ source('erp', 'stateprovince') }} 
    )

select * 
from source_state_province