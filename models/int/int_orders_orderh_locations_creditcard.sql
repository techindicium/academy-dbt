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

, join_orderh_locations_creditcard AS (
    SELECT
        sales_order_header.salesorderid
        , customers.customer_sk AS customer_fk
        , creditcards.creditcard_key AS creditcard_fk
        , locations.shiptoaddress_sk AS shiptoadress_fk
        , sales_order_header.orderdate
        , CASE 
            WHEN order_status = 1 THEN 'In_process'
            WHEN order_status = 2 THEN 'Approved'
            WHEN order_status = 3 THEN 'Backordered' 
            WHEN order_status = 4 THEN 'Rejected' 
            WHEN order_status = 5 THEN 'Shipped'
            WHEN order_status = 6 THEN 'Cancelled' 
            ELSE 'no_status'
        end as order_status_name
    FROM {{ ref('stg_sales_order_header') }} sales_order_header
    LEFT JOIN customers ON sales_order_header.customerid = customers.customerid
    LEFT JOIN creditcards ON sales_order_header.creditcardid = creditcards.creditcardid
    LEFT JOIN locations ON sales_order_header.shiptoaddressid = locations.shiptoaddressid
)

select *
from join_orderh_locations_creditcard