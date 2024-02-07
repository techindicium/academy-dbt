WITH stg_country AS (
    SELECT
        CAST(countryregioncode AS STRING) AS countryregioncode
        , modifieddate
        , name AS country_name
    FROM {{ source('raw-data', 'countryregion') }}
)
SELECT *
FROM stg_country
 