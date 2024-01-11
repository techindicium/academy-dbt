with stg_store as (
    select
        businessentityid
        , name as storename
        , salespersonid
        , modifieddate
    from {{ source('raw-data', 'store') }}
)
select *
from stg_store