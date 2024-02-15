WITH 
    source_sales_order_header AS (
        SELECT *
        FROM {{ source('sap_adw', 'salesorderheader') }}   
    )

    , formatted_sales_order_header AS (
        SELECT 
            salesorderid AS sales_order_id
            , customerid AS customer_id
            , salespersonid AS sales_person_id
            , territoryid AS territory_id
            , billtoaddressid AS bill_to_address_id
            , creditcardid AS credit_card_id
            , DATE(orderdate) AS order_date
            , DATE(shipdate) AS ship_date
            , DATE(duedate) AS due_date
            , CASE status
                WHEN 1 THEN 'in progress'
                WHEN 2 THEN 'approved'
                WHEN 3 THEN 'backordered'
                WHEN 4 THEN 'rejected'
                WHEN 5 THEN 'shipped'
                WHEN 6 THEN 'canceled'
                ELSE 'unknown'
            END AS order_status
            , onlineorderflag AS online_order_flag
            , subtotal AS sub_total
            , taxamt AS tax_amt
            , freight
            , totaldue AS total_due
        FROM source_sales_order_header
    )

SELECT *
FROM formatted_sales_order_header
