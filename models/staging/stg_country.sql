with stg_country as (
    select
        countryregioncode
        , modifieddate
        , name as country_name
    from {{ source('raw-data', 'countryregion') }}
)
select *
from stg_country