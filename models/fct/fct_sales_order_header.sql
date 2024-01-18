select 
        salesorderid
        , subtotal
        , taxamt
        , freight
        , totaldue
        , orderdate
from {{ref('stg_sales_order_header')}}