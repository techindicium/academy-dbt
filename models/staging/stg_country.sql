with stg_country as (
    select
        cast(countryregioncode as string) as countryregioncode
        , modifieddate
        , name as country_name
    from {{ source('raw-data', 'countryregion') }}
)

select *
from stg_country
 

