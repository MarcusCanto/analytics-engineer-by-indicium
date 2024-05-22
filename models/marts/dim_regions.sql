with
    address as (
        select *
        from {{ ref('stg_erp__addresses') }}
    )
    , state_province as (
        select *
        from {{ ref('stg_erp__state_province') }}
    )
    , country_region as (
        select *
        from {{ ref('stg_erp__country_region') }}
    )
    , joined as (
        select
            address.PK_ADDRESS
            , state_province.PK_STATE_PROVINCE
            , country_region.PK_COUNTRY_REGION
            , country_region.NM_COUNTRY_REGION
            , state_province.NM_STATE_PROVINCE
            , address.CITY_ADDRESS
        from address
        left join state_province
        on address.fk_state_province = state_province.pk_state_province
        left join country_region
        on state_province.fk_country_region = country_region.pk_country_region
    )

select *
from joined