with salesorderheader as (
    select 
        distinct(id_shiptoadress)
    from {{ref('stg_sap__salesorderhead')}}
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
    from {{ref('stg_sap__stateprovince')}}
)

, countryregion as (
    select
    *,

    from {{ref('stg_sap__countryregion')}}
)

, transformed as (
    select 
        row_number() over (order by salesorderheader.id_shiptoaddress) as location_sk
        , salesorderheader.id_shiptoaddress
        , address.city as city_name
        , stateprovince.state_name
        , countryregion.country_name
    
    from salesorderheader
    left join address on salesorderheader.id_shiptoaddress = address.id_shiptoaddress
    left join stateprovince on address.id_stateprovince = stateprovince.id_stateprovince
    left join countryregion on stateprovince.countryregioncode = countryregion.countryregioncode
)


select *
from transformed