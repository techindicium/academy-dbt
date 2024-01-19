with fct_orders_final AS (
    SELECT
        product_reason.salesorderid
        , product_reason.product_fk
        , order_locations_creditcard.customer_fk
        , order_locations_creditcard.shiptoadress_fk
        , order_locations_creditcard.creditcard_fk
        , product_reason.unitprice
        , product_reason.orderqty
        , product_reason.unitpricediscount
        , order_locations_creditcard.orderdate
        , product_reason.reason_name_final
        , order_locations_creditcard.order_status_name
    FROM {{ ref('int_orders_product_reason')}} as product_reason
    LEFT JOIN {{ ref('int_orders_orderh_locations_creditcard')}} as order_locations_creditcard 
        ON product_reason.salesorderid = order_locations_creditcard.salesorderid
)
SELECT *
FROM fct_orders_final