with 
    source_sales_order_detail as (
        select 
            cast(salesorderid as int) as ID_sales_order                     
            ,cast(salesorderdetailid as int) as ID_order_detail
            ,cast(productid as int) as ID_product   
            ,cast(orderqty as int) as quantity
            ,cast(unitprice as decimal) as unit_price
            ,cast(unitpricediscount as decimal) as unit_price_discount  
        from {{ source('erp', 'salesorderdetail')}}
        order by ID_sales_order
    )

select * 
from source_sales_order_detail
