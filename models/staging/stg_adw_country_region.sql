WITH 
    formatted_country_region AS (
        SELECT 
            countryregioncode AS country_region_code
            , name AS country_name
        FROM sap_adw.countryregion
    )

SELECT *
FROM formatted_country_region