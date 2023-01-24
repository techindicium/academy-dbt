with salesorderheader as (
    select 
        distinct(id_shiptoaddress)
    from {{ref('stg_sap__sales_order_head')}}
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
        row_number() over (order by sales_order_header.id_ship_to_address) as location_sk
        , sales_order_header.id_ship_to_address
        , address.city as city_name
        , state_province.state_name
        , country_region.country_name
    
    from sales_order_header
    left join address on sales_order_header.id_ship_to_address = address.id_address
    left join state_province on address.id_stateprovince = stateprovince.id_stateprovince
    left join country_region on state_province.country_region_code = country_region.country_region_code
)
select *
from transformed