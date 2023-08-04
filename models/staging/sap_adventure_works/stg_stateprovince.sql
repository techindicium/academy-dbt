with 
    source_StateProvince as (
        select
            cast(stateprovinceid as int) as ID_StateProvince
            ,cast(territoryid as int) ID_Territory						
            ,cast(stateprovincecode as STRING) CODE_StateProvince			
            ,cast(countryregioncode as STRING) CODE_ContryRegion	
            ,cast(name as STRING) as State_Name		
            ,cast(isonlystateprovinceflag as BOOLEAN) as Is_Only_State_Province_Flag					
        from {{ source('erp', 'stateprovince') }}
    )
select * 
from source_StateProvince