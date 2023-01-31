with 
    stg_sales_reason as (
        select 
            id_sales_reason
            , reason_name
            , reason_type
            , modified_date
        from {{ ref('stg_sap__sales_reason') }}
    )

    , stg_sales_order_sales_reason as(
        select
        id_sales_order
        , id_sales_reason
        , modified_date
        from {{ ref('stg_sap__sales_order_header_sales_reason') }}
    )

    , joined_reason_head_reason as (
        select
        stg_sales_order_sales_reason.id_sales_order
        , stg_sales_order_sales_reason.id_sales_reason
        , stg_sales_order_sales_reason.modified_date
        , stg_sales_reason.reason_name
        , stg_sales_reason.reason_type
        from stg_sales_reason
        left join  stg_sales_order_sales_reason on stg_sales_reason.id_sales_reason = stg_sales_order_sales_reason.id_sales_reason
    )

select *
from joined_reason_head_reason