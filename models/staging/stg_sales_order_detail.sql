with stg_sales_order_detail as (
    select
        salesorderid
        , specialofferid
        , salesorderdetailid
        , productid
        , rowguid
        , orderqty
        , unitprice
        , unitpricediscount
        , modifieddate
    from {{ source('raw-data', 'salesorderdetail') }}
)
select *
from stg_sales_order_detail