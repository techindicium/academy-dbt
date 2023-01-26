with
    stg_address as (
        select *
        from {{ ref('stg_sap__address') }}
    )
    
    , stg_person as (
        select *
        from {{ ref('stg_sap__person') }}
    )
    
    , stg_state_province as (
        select *
        from {{ ref('stg_sap__state_province') }}
    )

    , stg_country_region as (
        select *
        from {{ ref('stg_sap__country_region') }}
    )

    , joined_tables as (
    select 
         stg_address.id_address
         , stg_address.id_state_province
         , stg_address.city
         , stg_address.address_line_1
         , stg_address.address_line_2
         , stg_address.postal_code
         , stg_address.spatial_location
         , stg_address.modified_date
         , stg_state_province.id_state_province
         , stg_state_province.id_territory
         , stg_state_province.state_name
         , stg_state_province.is_only_state_province_flag
         , stg_state_province.state_province_code
         , stg_state_province.country_region_code
         , stg_state_province.modified_date
         , stg_state_province.row_guid
         , stg_country_region.country_region_code
         , stg_country_region.country_name
         , stg_country_region.modified_date
                
        from stg_state_province
        left join stg_country_region 
            on stg_state_province.country_region_code = stg_country_region.country_region_code
        left join stg_address
            on stg_state_province.id_state_province = stg_address.id_state_province
    )
select *
from joined_tables