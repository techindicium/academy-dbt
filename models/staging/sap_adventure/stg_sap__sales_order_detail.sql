with
    source_sales_order_detail as (
        select
            cast(salesorderid as int) as id_sales_order
            , cast(productid as int) as id_product
            , cast(salesorderdetailid as int) as id_sales_order_detail
            , cast(specialofferid as int) as id_special_offer
            , cast(orderqty as int) as order_qty 
            , cast(unitprice as int) as unit_price
            , cast(unitpricediscount as int) as unit_price_discount
            , cast(rowguid as string) as row_guid
            , cast(left(cast(modifieddate as string), 10) as date) as modified_date
        from {{source('adw', 'salesorderdetail' )}}
    )
select *
from source_sales_order_detail