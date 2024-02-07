with sales_order_header as (
    select *
    from {{ref('stg_sales_order_header')}}
)

, sales_order_detail as (
    select 
        distinct(productid)
    from {{ref('stg_sales_order_detail')}}
)

, product as (
    select *
    from {{ref('stg_products')}}
)

, products_transformed as (
    select 
        row_number() over (order by sales_order_detail.productid) as product_sk, -- auto-incremental surrogate key
        sales_order_detail.productid,
        product.name_product 
    from sales_order_detail
    left join product 
        on sales_order_detail.productid = product.productid
)

select *
from products_transformed

