with stg_state as (
    select
        cast(stateprovinceid as int) as stateprovinceid
        , countryregioncode
        , modifieddate
        , rowguid
        , name as name_state
        , territoryid
        , isonlystateprovinceflag
        , stateprovincecode
    from {{ source('raw-data', 'stateprovince') }}
)

select *
from stg_state


