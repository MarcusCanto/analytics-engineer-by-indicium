with 
    source_country_region as (
        select
            cast(COUNTRYREGIONCODE as varchar) as pk_country_region
            , cast(NAME as varchar) as nm_country_region
        from {{ source('erp', 'countryregion') }} 
    )

select * 
from source_country_region