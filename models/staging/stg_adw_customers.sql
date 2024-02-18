WITH 
    formatted_customer AS (
        SELECT 
            customerid AS customer_id
            , territoryid AS territory_id
            , personid AS person_id
            , storeid AS store_id
        FROM sap_adw.customer
    )
    
SELECT *
FROM formatted_customer
