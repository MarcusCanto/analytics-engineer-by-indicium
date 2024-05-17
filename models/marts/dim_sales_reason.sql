with
    sales_order_header_sales_reason as (
        select *
        from {{ ref('stg_erp__sales_order_header_sales_reason') }}
    )
    , sales_reason as (
        select *
        from {{ ref('stg_erp__sales_reason') }}
    )
    , joined as (
        select
            sales_order_header_sales_reason.FK_SALES_ORDER_HEADER
            , sales_order_header_sales_reason.FK_SALES_REASON
            , sales_reason.PK_SALES_REASON
            , sales_reason.NM_SALES_REASON
            , sales_reason.SALES_REASON_TYPE_CODE
        from sales_order_header_sales_reason
        left join sales_reason
        on sales_order_header_sales_reason.fk_sales_reason = sales_reason.pk_sales_reason
    )

select *
from joined