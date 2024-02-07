with stg_customer as (
    select
        CAST(customerid AS INT) as customerid
        , personid
        , storeid
        , territoryid
    from {{ source('raw-data', 'customer') }}
)
select *
from stg_customer
