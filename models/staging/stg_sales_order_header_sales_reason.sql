with stg_sales_order_header_sales_reason as (
    select
        CAST(salesorderid AS INT) as salesorderid
        , modifieddate
        , CAST(salesreasonid AS INT) as salesreasonid
    from {{ source('raw-data', 'salesorderheadersalesreason') }}
)
select *
from stg_sales_order_header_sales_reason
