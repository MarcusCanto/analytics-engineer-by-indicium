with 
    source_sales_order_detail as (
        select
            cast(SALESORDERID as int) as fk_sales_order_header
            , cast(SALESORDERDETAILID as int) as pk_sales_order_detail
            , cast(CARRIERTRACKINGNUMBER as string) as carrier_tracking_number
            , cast(ORDERQTY as int) as order_qty
            , cast(PRODUCTID as int) as fk_product
            , cast(SPECIALOFFERID as int) as fk_special_offer
            , cast(UNITPRICE as numeric(18, 2)) as unit_price
            , cast(UNITPRICEDISCOUNT as numeric(18, 2)) as unit_price_discount
        from {{ source('erp', 'salesorderdetail') }} 
        )

select * 
from source_sales_order_detail