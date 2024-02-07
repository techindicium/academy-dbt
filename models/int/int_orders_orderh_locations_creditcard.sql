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

, join_orderh_locations_creditcard as (
    select
        sales_order_header.salesorderid
        , customers.customer_sk as customer_fk
        , creditcards.creditcard_key as creditcard_fk
        , locations.shiptoaddress_sk as shiptoadress_fk
        , sales_order_header.orderdate
        , case 
            when order_status = 1 then 'in_process'
            when order_status = 2 then 'approved'
            when order_status = 3 then 'backordered' 
            when order_status = 4 then 'rejected' 
            when order_status = 5 then 'shipped'
            when order_status = 6 then 'cancelled' 
            else 'no_status'
        end as order_status_name
    from {{ ref('stg_sales_order_header') }} sales_order_header
    left join customers 
        on sales_order_header.customerid = customers.customerid
    left join creditcards 
        on sales_order_header.creditcardid = creditcards.creditcardid
    left join locations 
        on sales_order_header.shiptoaddressid = locations.shiptoaddressid
)

select 
    *
from join_orderh_locations_creditcard