with 
    source_address as (
        select
            cast(addressid as int) as ID_address		
            ,cast(stateprovinceid as int) as ID_state_province		
            ,cast(city as STRING) as city							
            ,cast(postalcode as STRING)	as postal_code				
        from {{ source('erp', 'address') }}	
    )
    
select * 
from source_address