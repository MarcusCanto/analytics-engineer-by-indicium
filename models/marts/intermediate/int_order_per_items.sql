with
    orders as (
        select *
        from {{ ref('stg_erp__sales_order_header') }}
    )

    , order_details as (
        select * 
        from {{ ref('stg_erp__sales_order_detail') }}
    )

    , joined as (
        select
        order_details.PK_SALES_ORDER_DETAIL
        , order_details.FK_SALES_ORDER_HEADER
        , order_details.FK_PRODUCT
        , order_details.FK_SPECIAL_OFFER
        , orders.FK_CUSTOMER
        , orders.FK_SALES_PERSON
        , orders.FK_TERRITORY
        , orders.FK_BILL_ADDRESS
        , orders.FK_SHIP_ADDRESS
        , orders.FK_SHIP_METHOD
        , orders.FK_CREDIT_CARD
        , orders.FK_CURRENCY_RATE
        , order_details.CARRIER_TRACKING_NUMBER
        , order_details.ORDER_QTY
        , order_details.UNIT_PRICE
        , order_details.UNIT_PRICE_DISCOUNT
        , orders.REVISION_NUMBER
        , orders.ORDER_DATE
        , orders.DUE_DATE
        , orders.SHIP_DATE
        , orders.STATUS
        , orders.ONLINE_ORDER_FLAG
        , orders.PURCHASE_ORDER_NUMBER
        , orders.ACCOUNT_NUMBER
        , orders.CREDIT_CARD_APPROVAL_CODE
        , orders.SUB_TOTAL
        , orders.TAX_AMT
        , orders.FREIGHT
        , orders.TOTAL_DUE
        , orders.COMMENT
        from order_details
        left join orders
        on order_details.fk_sales_order_header = orders.pk_sales_order_header
    )

    , created_primary_key as (
        select
            cast(fk_sales_order_header as string) || '-' || cast(fk_product as string) as sk_sales
            , *
            from joined
    )

select * 
from created_primary_key
