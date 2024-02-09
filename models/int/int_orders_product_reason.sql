with customers as (
    select
        customer_sk
        , customerid
    from {{ ref('dim_customer') }}
)

, products as (
    select
        product_sk
        , productid
    from {{ ref('dim_products') }}
)

, locations as (
    select
        shiptoaddress_sk
        , shiptoaddressid
    from {{ ref('dim_locations') }}
)

, creditcards as (
    select
        creditcard_key
        , creditcardid
    from {{ ref('dim_creditcard') }}
)

, reasons as (
    select
        salesorderid
        , reason_name_aggregated
    from {{ ref('dim_reasons') }}
)

, join_products_reason as (
    select
        sales_order_detail.salesorderid
        , products.product_sk as product_fk
        , sales_order_detail.productid
        , sales_order_detail.orderqty
        , sales_order_detail.unitprice
        , sales_order_detail.unitpricediscount
        , ifnull(reasons.reason_name_aggregated,'not indicated') as reason_name_final
    from {{ ref('stg_sales_order_detail') }} as sales_order_detail
    left join products 
        on sales_order_detail.productid = products.productid
    left join reasons 
        on sales_order_detail.salesorderid = reasons.salesorderid
)

select 
    * 
from join_products_reason