WITH 
    source_sales_order_detail AS (
        SELECT *
        FROM {{ source('sap_adw', 'salesorderdetail') }}
    )

    , formatted_sales_order_detail AS (
        SELECT 
            salesorderdetailid AS sales_order_detail_id
            , salesorderid AS sales_order_id
            , productid AS product_id
            , orderqty AS order_qty
            , specialofferid AS special_offer_id
            , unitpricediscount AS unit_price_discount
            , unitprice AS unit_price
        FROM source_sales_order_detail
    )

SELECT *
FROM formatted_sales_order_detail
