with stg_store as (
    select
        cast(businessentityid as int) as businessentityid
        , name as storename
        , salespersonid
        , modifieddate
    from {{ source('raw-data', 'store') }}
)

select *
from stg_store


