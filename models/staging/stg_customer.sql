with stg_customer as (
    select
        customerid
        , personid
        , storeid
        , territoryid
    from {{ source('raw-data', 'customer') }}
)
select *
from stg_customer