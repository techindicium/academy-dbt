with 
    source_SalesOrderHeaderSalesReason as (
        select
            cast(salesorderid as int) as ID_order					
            ,cast(salesreasonid as int)	as ID_sales_order_header_reason				
        from {{ source('erp', 'salesorderheadersalesreason') }}
    )
    
select * 
from source_SalesOrderHeaderSalesReason
