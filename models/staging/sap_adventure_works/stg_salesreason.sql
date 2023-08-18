with
    source_SalesReason as (
        select
            cast(salesreasonid as int) as ID_SalesReason						
            ,cast(name as STRING) as ReasonName				
            ,cast(reasontype as STRING) as ReasonType					
            ,cast(modifieddate as STRING) as SR_ModifiedDate	
        from {{ source('erp', 'salesreason') }}		
    )

select * 
from source_SalesReason