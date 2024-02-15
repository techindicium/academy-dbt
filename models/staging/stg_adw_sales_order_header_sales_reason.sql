WITH 
    source_sales_reason AS (
        SELECT *
        FROM {{ source('sap_adw', 'salesorderheadersalesreason') }}
    )

    , formatted_sales_reason AS (
        SELECT 
            salesorderid AS sales_order_id
            , salesreasonid AS sales_reason_id
        FROM source_sales_reason
    )
    
SELECT *
FROM formatted_sales_reason
