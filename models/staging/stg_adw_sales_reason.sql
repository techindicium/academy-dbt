WITH 
    source_sales_reason AS (
        SELECT *
        FROM {{ source('sap_adw', 'salesreason') }}
    )

    , formatted_sales_reason AS (
        SELECT 
            salesreasonid AS sales_reason_id
            , name AS sales_reason_name
            , reasontype AS reason_type
        FROM source_sales_reason
    )
    
SELECT *
FROM formatted_sales_reason
