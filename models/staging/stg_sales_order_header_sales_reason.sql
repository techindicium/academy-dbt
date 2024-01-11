with stg_sales_order_header_sales_reason as (
    select
        salesorderid
        , modifieddate
        , salesreasonid
    from {{ source('raw-data', 'salesorderheadersalesreason') }}
)
select *
from stg_sales_order_header_sales_reason