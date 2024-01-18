WITH customers AS (
    SELECT
        customer_sk
        , customerid
    FROM {{ ref('dim_customer') }}
)

, products AS (
    SELECT
        product_sk
        , productid
    FROM {{ ref('dim_products') }}
)

, locations AS (
    SELECT
        shiptoaddress_sk
        , shiptoaddressid
    FROM {{ ref('dim_locations') }}
)

, creditcards AS (
    SELECT
        creditcard_key
        , creditcardid
    FROM {{ ref('dim_creditcard') }}
)

, reasons AS (
    SELECT
        salesorderid
        , reason_name_aggregated
    FROM {{ ref('dim_reasons') }}
)

, join_products_reason AS (
    SELECT
        sales_order_detail.salesorderid
        , products.product_sk AS product_fk
        , sales_order_detail.productid
        , sales_order_detail.orderqty
        , sales_order_detail.unitprice
        , sales_order_detail.unitpricediscount
        , ifnull(reasons.reason_name_aggregated,'Not indicated') as reason_name_final
    FROM {{ ref('stg_sales_order_detail') }} as sales_order_detail
    LEFT JOIN products ON sales_order_detail.productid = products.productid
    LEFT JOIN reasons ON sales_order_detail.salesorderid = reasons.salesorderid
)

select * 
from join_products_reason