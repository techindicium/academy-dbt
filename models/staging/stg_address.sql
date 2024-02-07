with stg_address as (
    select
        CAST(addressid as INT) as addressid
        , CAST(stateprovinceid as INT) as stateprovinceid
        , addressline1 
        , addressline2
        , city
        , modifieddate
        , rowguid
        , postalcode
        , spatiallocation
    from {{ source('raw-data', 'address') }}
)
select *
from stg_address
