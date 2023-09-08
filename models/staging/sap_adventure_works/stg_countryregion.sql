with 
    source_ContryRegion as (
        select
            cast(countryregioncode as STRING) as ID_country					
            ,cast(name as STRING) as country_name		
        from {{ source('erp', 'countryregion') }}
    )

select * 
from source_ContryRegion