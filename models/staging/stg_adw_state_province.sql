WITH 
    source_state_province AS (
        SELECT *
        FROM {{ source('sap_adw', 'stateprovince') }}
    )

    , formatted_state_province AS (
        SELECT 
            stateprovinceid AS state_province_id
            , territoryid AS territory_id
            , name AS province_name
            , stateprovincecode AS state_province_code
            , countryregioncode AS country_region_code
        FROM source_state_province
    )
    
SELECT *
FROM formatted_state_province
