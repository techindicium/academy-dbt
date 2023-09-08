with 
    address as (
        select
            ID_address		
            ,ID_state_province		
            ,city							
            ,postal_code				
        from {{ ref('stg_address') }}
    ),

    state as (
        select
            ID_state_province
            ,ID_territory						
            ,code_state_province			
            ,code_country_region	
            ,state_name							
        from {{ ref('stg_stateprovince') }}
    ),

    country as (
        select
            ID_country			
            ,country_name		
        from {{ ref('stg_countryregion') }}
    ),

    joined_region_data as (
        select
            ID_address
            ,address.ID_state_province
            ,ID_territory
            ,ID_country
            ,city
            ,postal_code
            ,code_state_province
            ,state_name
            ,country_name
        from address
        left join state on address.ID_state_province = state.ID_state_province
        left join country on state.code_country_region = country.ID_country
    )

select * 
from joined_region_data