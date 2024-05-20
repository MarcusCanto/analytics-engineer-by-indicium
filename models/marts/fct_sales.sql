with
    order_per_items as (
        select * 
        from {{ ref('int_order_per_items') }}
    )

    , metrics as (
        select 
        SK_SALES
        , PK_SALES_ORDER_DETAIL
        , FK_SALES_ORDER_HEADER
        , FK_PRODUCT
        , FK_SPECIAL_OFFER
        , FK_CUSTOMER
        , FK_SALES_PERSON
        , FK_TERRITORY
        , FK_BILL_ADDRESS
        , FK_SHIP_ADDRESS
        , FK_SHIP_METHOD
        , FK_CREDIT_CARD
        , FK_CURRENCY_RATE
        , CARRIER_TRACKING_NUMBER
        , ORDER_QTY
        , UNIT_PRICE
        , UNIT_PRICE_DISCOUNT           
        , REVISION_NUMBER
        , ORDER_DATE
        , DUE_DATE
        , SHIP_DATE
        , STATUS
        , ONLINE_ORDER_FLAG
        , PURCHASE_ORDER_NUMBER
        , ACCOUNT_NUMBER
        , CREDIT_CARD_APPROVAL_CODE
        , COMMENT
            , unit_price * order_qty as total_gross_value
            , unit_price * (1 - unit_price_discount) * order_qty as total_net_value
            , cast (
                sub_total / count(fk_sales_order_header) over (partition by fk_sales_order_header)
                as numeric(18,2) 
            ) as prorated_sub_total            
            , cast (
                freight / count(fk_sales_order_header) over (partition by fk_sales_order_header)
                as numeric(18,2) 
            ) as prorated_shipping
            , cast (
                tax_amt / count(fk_sales_order_header) over (partition by fk_sales_order_header)
                as numeric(18,2) 
            ) as prorated_tax_amt
            , cast (
                total_due / count(fk_sales_order_header) over (partition by fk_sales_order_header)
                as numeric(18,2) 
            ) as prorated_total_due
        from order_per_items
    )

select * 
from metrics