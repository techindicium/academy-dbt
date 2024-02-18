WITH 
    formatted_address AS (
        SELECT 
            addressid as address_id
            , stateprovinceid as state_province_id
            , addressline1 as address_line
            , city as city_address
        FROM sap_adw.address
    )

SELECT *
FROM formatted_address
