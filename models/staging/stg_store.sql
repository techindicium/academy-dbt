with stg_store as (
    select
        CAST(businessentityid as INT) as businessentityid
        , name as storename
        , salespersonid
        , modifieddate
    from {{ source('raw-data', 'store') }}
)
select *
from stg_store
