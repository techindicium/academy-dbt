with 
    dim_product as (
        select 
            ID_product				
            ,product_name					
            ,product_number					
            ,standard_cost				
            ,list_price 
        from {{ ref('sgt_product') }}
    )
    
select * 
from dim_product