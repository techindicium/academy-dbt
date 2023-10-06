with 
    source_customer as (
        select
            cast(customerid as int) as ID_customer				
            ,cast(personid as int) as ID_person				
            ,cast(storeid as int) as ID_store		
            ,cast(territoryid as int) as ID_territory			
        from {{ source('erp', 'customer') }}
    )
    
select * 
from source_customer