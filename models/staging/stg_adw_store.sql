WITH 
    source_store AS (
        SELECT *
        FROM {{ source('sap_adw', 'store') }}
    )

    , formatted_store AS (
        SELECT 
            businessentityid AS store_id
            , salespersonid AS sales_person_id
            , name AS store_name
        FROM source_store
    )
    
SELECT *
FROM formatted_store
