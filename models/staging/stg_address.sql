with stg_address as (
    select
        cast(addressid as int) as addressid
        , cast(stateprovinceid as int) as stateprovinceid
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


