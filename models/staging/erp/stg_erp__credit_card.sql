with 
    source_credit_card as (
        select
            cast(CREDITCARDID as int) as pk_credit_card
            , cast(CARDTYPE as varchar) as type_credit_card
        from {{ source('erp', 'creditcard') }} 
        )

select * 
from source_credit_card