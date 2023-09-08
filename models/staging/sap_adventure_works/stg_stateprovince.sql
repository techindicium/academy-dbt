with 
    source_stateprovince  as (
        select
            cast(stateprovinceid as int) as ID_state_province
            ,cast(territoryid as int) ID_territory						
            ,cast(stateprovincecode as  STRING) code_state_province			
            ,cast(countryregioncode as STRING) code_country_region	
            ,cast(name as STRING) as state_name						
        from {{ source('erp', 'stateprovince' ) }}
     )

select * 
from  source_stateprovince