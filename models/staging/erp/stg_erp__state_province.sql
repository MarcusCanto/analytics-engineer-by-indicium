with 
    source_state_province as (
        select
            cast(STATEPROVINCEID as int) as pk_state_province
            , cast(COUNTRYREGIONCODE as varchar) as fk_country_region
            , cast(NAME as varchar) as nm_state_province
            , cast(STATEPROVINCECODE as varchar) as code_state_province
            , cast(ISONLYSTATEPROVINCEFLAG as int) as is_only_state_province_flag
        from {{ source('erp', 'stateprovince') }} 
    )

select * 
from source_state_province