with 
    source_sales_order_header as (
        select
            cast(SALESORDERID as int) as pk_sales_order_header
            , cast(REVISIONNUMBER as int) as revision_number
            , cast(ORDERDATE as date) as order_date
            , cast(DUEDATE as date) as due_date
            , cast(SHIPDATE as date) as ship_date
            , cast(STATUS as int) as status
            , cast(ONLINEORDERFLAG as boolean) as online_order_flag
            , cast(PURCHASEORDERNUMBER as string) as purchase_order_number
            , cast(ACCOUNTNUMBER as string) as account_number
            , cast(CUSTOMERID as int) as fk_customer
            , cast(SALESPERSONID as int) as fk_sales_person
            , cast(TERRITORYID as int) as fk_territory
            , cast(BILLTOADDRESSID as int) as fk_bill_address
            , cast(SHIPTOADDRESSID as int) as fk_ship_address
            , cast(SHIPMETHODID as int) as fk_ship_method
            , cast(CREDITCARDID as int) as fk_credit_card
            , cast(CREDITCARDAPPROVALCODE as string) as credit_card_approval_code
            , cast(CURRENCYRATEID as int) as fk_currency_rate
            , cast(SUBTOTAL as numeric(18, 2)) as sub_total
            , cast(TAXAMT as numeric(18, 2)) as tax_amt
            , cast(FREIGHT as numeric(18, 2)) as freight
            , cast(TOTALDUE as numeric(18, 2)) as total_due
            , cast(COMMENT as string) as comment
        from {{ source('erp', 'salesorderheader') }} 
        )

select * 
from source_sales_order_header