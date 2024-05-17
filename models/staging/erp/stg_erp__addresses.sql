with 
    source_address as (
        select
            cast (ADDRESSID as int) as pk_address
            , cast (CITY as varchar) as city_address
            , cast (STATEPROVINCEID as int) as fk_state_province
            , cast (POSTALCODE as varchar) as postal_code_address
        from {{ source('erp', 'address') }} 
        )

select * 
from source_address