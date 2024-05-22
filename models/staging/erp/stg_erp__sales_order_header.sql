with 
    source_sales_order_header as (
        select
            cast(SALESORDERID as int) as pk_sales_order_header
            , cast(ORDERDATE as date) as order_date
            , cast(STATUS as int) as status
            , cast(CUSTOMERID as int) as fk_customer
            , cast(TERRITORYID as int) as fk_territory
            , cast(BILLTOADDRESSID as int) as fk_bill_address
            , cast(SHIPTOADDRESSID as int) as fk_ship_address
            , cast(CREDITCARDID as int) as fk_credit_card
            , cast(SUBTOTAL as numeric(18, 2)) as sub_total
            , cast(TAXAMT as numeric(18, 2)) as tax_amt
            , cast(FREIGHT as numeric(18, 2)) as freight
            , cast(TOTALDUE as numeric(18, 2)) as total_due
        from {{ source('erp', 'salesorderheader') }} 
        )

select * 
from source_sales_order_header