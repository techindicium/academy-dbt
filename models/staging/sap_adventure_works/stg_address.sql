with 
    source_address as (
        select
            cast(addressid as int) as ID_Address		
            ,cast(stateprovinceid as int) as ID_StateProvince		
            ,cast(addressline1 as STRING) as Address_Line1						
            ,cast(addressline2 as STRING) as Address_Line2				
            ,cast(city as STRING) as City							
            ,cast(postalcode as STRING)	as Postal_Code				
            ,cast(spatiallocation as STRING) as Spatial_Location	
        from {{ source('erp', 'address') }}	
    )
    
select * 
from source_address