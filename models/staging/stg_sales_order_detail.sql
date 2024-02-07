with stg_sales_order_detail as (
    select
        CAST(salesorderid AS INT) as salesorderid
        , CAST(specialofferid AS INT) as specialofferid
        , CAST(salesorderdetailid AS INT) as salesorderdetailid
        , CAST(productid AS INT) as productid
        , rowguid
        , orderqty
        , unitprice
        , unitpricediscount
        , modifieddate
    from {{ source('raw-data', 'salesorderdetail') }}
)
select *
from stg_sales_order_detail
