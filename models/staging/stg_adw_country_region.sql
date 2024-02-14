WITH 
    source_country_region AS (
        SELECT *
        FROM {{ source('sap_adw', 'countryregion') }}
    ),

    formatted_country_region AS (
        SELECT 
            countryregioncode AS country_region_code
            , name AS country_name
        FROM source_country_region
    )

SELECT *
FROM formatted_country_region
