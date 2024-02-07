with stg_sales_order_header as (
    select 
        distinct(shiptoaddressid)
    from {{ref('stg_sales_order_header')}}
)

, stg_address as (
    select *
    from {{ref('stg_address')}}
)

, stg_state as (
    select *
    from {{ref('stg_state')}}
)

, stg_country as (
    select *
    from {{ref('stg_country')}}
)

, locations_transformed as (
    select
        row_number() over (order by stg_sales_order_header.shiptoaddressid) as shiptoaddress_sk -- auto-incremental surrogate key
        , stg_sales_order_header.shiptoaddressid 
        , stg_address.city as city_name
        , stg_state.name_state
        , stg_country.country_name
    from stg_sales_order_header
    left join stg_address 
        on stg_sales_order_header.shiptoaddressid = stg_address.addressid
    left join   stg_state 
        on stg_address.stateprovinceid = stg_state.stateprovinceid
    left join stg_country 
        on stg_state.countryregioncode = stg_country.countryregioncode 
)

select *
from locations_transformed

