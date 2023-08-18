with 
    source_SalesOrderHeaderSalesReason as (
        select
            cast(salesorderid as int) as ID_SalesOrder					
            ,cast(salesreasonid as int)	as ID_SalesOrderHeaderReason				
            ,cast(modifieddate as STRING) as SOHR_ModifiedDate
        from {{ source('erp', 'salesorderheadersalesreason') }}
    )
    
select * 
from source_SalesOrderHeaderSalesReason
