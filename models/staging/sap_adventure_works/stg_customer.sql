with 
    source_customer as (
        select
            cast(customerid as int) as ID_Customer				
            ,cast(personid as int) as ID_Person				
            ,cast(storeid as int) as ID_Store		
            ,cast(territoryid as int) as ID_Territory			
            ,cast(rowguid as STRING) as RowGuid			
            ,cast(modifieddate as STRING) CModifiedDate
        from {{ source('erp', 'customer') }}
    )
    
select * 
from source_customer