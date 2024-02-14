WITH 
    source_customer AS (
        SELECT * 
        FROM {{ source('sap_adw', 'customer') }}
    ),

    formatted_customer AS (
        SELECT 
            customerid AS customer_id,
            territoryid AS territory_id,
            personid AS person_id,
            storeid AS store_id
        FROM source_customer  
    )
    
SELECT *
FROM formatted_customer
