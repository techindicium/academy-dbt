with salesorderheader as (
    select 
       distinct( id_ship_to_address )
    from {{ref('salesorderheader')}}
)

, address as (
    select *
    from {{ref('stg_sap__address')}}
) 

, person as (
    select *
    from {{ref('stg_sap__person')}}
)

, stateprovince as (
    select *
    from {{ref('stg_sap__state_province')}}
)

, countryregion as (
    select
    *,
    from {{ref('stg_sap__country_region')}}
)

, transformed as (
    select 
        row_number() over (order by salesorderheader.ship_to_address_id) as location_sk
        , salesorderheader.ship_to_address_id
        , address.city as city_name
        , stateprovince.state_name
        , countryregion.country_name
    
    from salesorderheader
    left join address on salesorderheader.shiptoaddressid = address.addressid
    left join stateprovince on address.stateprovinceid = stateprovince.stateprovinceid
    left join countryregion on stateprovince.countryregioncode = countryregion.countryregioncode
)
select *
from transformed