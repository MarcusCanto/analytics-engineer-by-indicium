with
    persons as (
        select *
        from {{ ref('stg_erp__persons') }}
    )

    , customers as (
        select *
        from {{ ref('stg_erp__customers') }}
    )
    , stores as (
        select *
        from {{ ref('stg_erp__stores') }}
    )

    , joined as (
        select 
            persons.PK_PERSON
            , customers.PK_CUSTOMER
            , stores.pk_STORE
            , stores.nm_STORE
            , persons.FIRS_NAME_PERSON
            , persons.MIDDLE_NAME_PERSON
            , persons.LAST_NAME_PERSON
            , persons.SUFFIX_PERSON
        from persons
        left join customers
        on persons.pk_person = customers.fk_person 
        left join stores
        on customers.fk_store = stores.pk_store
    ) 

select * 
from joined