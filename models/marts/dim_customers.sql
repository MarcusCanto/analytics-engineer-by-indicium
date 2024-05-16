with
    persons as (
        select *
        from {{ ref('stg_erp__persons') }}
    )

    , customers as (
        select *
        from {{ ref('stg_erp__customers') }}
    )

    , joined as (
        select 
            persons.PK_PERSON
            , customers.PK_CUSTOMER
            , persons.FIRS_NAME_PERSON
            , persons.MIDDLE_NAME_PERSON
            , persons.LAST_NAME_PERSON
            , persons.SUFFIX_PERSON
        from persons
        left join customers
        on persons.pk_person = customers.fk_person 
    ) 

select * 
from joined