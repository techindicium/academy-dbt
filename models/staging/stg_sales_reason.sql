with stg_sales_reason as (
    select
        CAST(salesreasonid AS INT) as salesreasonid
        , name as reason_name
        , reasontype
        , modifieddate
    from {{ source('raw-data', 'salesreason') }}
)
select *
from stg_sales_reason
