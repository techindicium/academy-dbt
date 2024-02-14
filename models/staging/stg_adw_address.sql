WITH 
    source_address AS (
        SELECT *
        FROM {{ source('sap_adw', 'address') }}    
    ),
    
    formatted_address AS (
        SELECT 
           addressid AS address_id,
           stateprovinceid AS state_province_id,
           addressline1 AS address_line,
           city 
        FROM source_address  
    )

SELECT *
FROM formatted_address
