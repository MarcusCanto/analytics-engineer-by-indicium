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
        , orders.FK_TERRITORY
        , orders.FK_BILL_ADDRESS
        , orders.FK_SHIP_ADDRESS
        , orders.FK_CREDIT_CARD
        , order_details.ORDER_QTY
        , order_details.UNIT_PRICE
        , order_details.UNIT_PRICE_DISCOUNT
        , orders.ORDER_DATE
        , orders.STATUS
        , orders.SUB_TOTAL
        , orders.TAX_AMT
        , orders.FREIGHT
        , orders.TOTAL_DUE
        from order_details
        left join orders
        on order_details.fk_sales_order_header = orders.pk_sales_order_header
    )

    , create_primary_key as (
        select
            cast(fk_sales_order_header as string) || '-' || cast(fk_product as string) as sk_sales
            , *
            from joined
    )

select * 
from create_primary_key
