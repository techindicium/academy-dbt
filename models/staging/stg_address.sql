with stg_address as (
    select
        addressid
        , stateprovinceid
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