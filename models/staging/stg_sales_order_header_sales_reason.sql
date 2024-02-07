with stg_sales_order_header_sales_reason as (
    select
        cast(salesorderid as int) as salesorderid
        , modifieddate
        , cast(salesreasonid as int) as salesreasonid
    from {{ source('raw-data', 'salesorderheadersalesreason') }}
)

select *
from stg_sales_order_header_sales_reason


