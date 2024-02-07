with stg_sales_reason as (
    select
        cast(salesreasonid as int) as salesreasonid
        , name as reason_name
        , reasontype
        , modifieddate
    from {{ source('raw-data', 'salesreason') }}
)

select *
from stg_sales_reason


