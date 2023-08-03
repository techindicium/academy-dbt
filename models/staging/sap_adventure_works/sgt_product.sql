with    
    source_product as (
        select
            cast(productid as int) as ID_Product				
            ,cast(name as STRING) as Product_Name					
            ,cast(productnumber as STRING) as Product_Number					
            ,cast(makeflag as BOOLEAN) as Make_Flag			
            ,cast(finishedgoodsflag as BOOLEAN) as Finished_Goods_Flag				
            ,cast(color as STRING) as Product_Color				
            ,cast(safetystocklevel as int) as Safe_Stock_Level			
            ,cast(reorderpoint as int) as Reorder_Point	
            ,cast(standardcost as numeric) as Standard_Cost				
            ,cast(listprice as numeric) as List_price			
            ,cast(weight as numeric)	as Product_Weight	
            ,cast(daystomanufacture as int) as Days_to_Manufacture	
            ,cast(productline as STRING)	as Product_Line	
            ,cast(class as STRING) as Product_Class
        from {{ source('erp', 'product') }}
    )
select * 
from source_product