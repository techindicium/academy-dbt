with stg_sales_order_detail as (
    select
        cast(salesorderid as int) as salesorderid
        , cast(specialofferid as int) as specialofferid
        , cast(salesorderdetailid as int) as salesorderdetailid
        , cast(productid as int) as productid
        , rowguid
        , orderqty
        , unitprice
        , unitpricediscount
        , modifieddate
    from {{ source('raw-data', 'salesorderdetail') }}
)

select *
from stg_sales_order_detail


