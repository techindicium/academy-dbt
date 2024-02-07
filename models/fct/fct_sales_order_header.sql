with fct_sales_order_header as (
    select 
        salesorderid
        , subtotal
        , taxamt
        , freight
        , totaldue
        , orderdate
    from {{ref('stg_sales_order_header')}}
)

select 
    *
from fct_sales_order_header