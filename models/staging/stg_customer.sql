with stg_customer as (
    select
        cast(customerid as int) as customerid
        , personid
        , storeid
        , territoryid
    from {{ source('raw-data', 'customer') }}
)

select *
from stg_customer


