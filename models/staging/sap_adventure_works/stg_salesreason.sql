with
    source_salesreason as (
        select
            cast(salesreasonid as int) as ID_sales_reason						
            ,cast(name as STRING) as reason_name				
        from {{ source('erp', 'salesreason') }}		
    )

select * 
from source_salesreason