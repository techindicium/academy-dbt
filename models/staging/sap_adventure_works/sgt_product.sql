with    
    source_product as (
        select
            cast(productid as int) as ID_product				
            ,cast(name as string) as product_name					
            ,cast(productnumber as string) as product_number					
            ,cast(standardcost as numeric) as standard_cost				
            ,cast(listprice as numeric) as list_price			
        from {{ source('erp', 'product') }}
    )
    
select * 
from source_product