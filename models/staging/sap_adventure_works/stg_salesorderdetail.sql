with 
    source_sales_order_detail as (
        select 
            cast(salesorderid as int) as ID_sales_order                     
            ,cast(salesorderdetailid as int) as ID_sales_order_detail
            ,cast(productid as int) as ID_orderproduct   
            ,cast(specialofferid as int) as ID_special_offer
            ,cast(orderqty as int) as order_quantity
            ,cast(unitprice as decimal) as unit_price
            ,cast(unitpricediscount as decimal) as unit_price_discount  
            ,cast(carriertrackingnumber as STRING) as carrier_tracking_number       
            ,cast(rowguid as STRING) as row_guid        
        from {{ source('erp', 'salesorderdetail')}}
        order by ID_sales_order
    )

select * 
from source_sales_order_detail
