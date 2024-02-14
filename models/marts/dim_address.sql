WITH 
    address AS (
        SELECT *
        FROM {{ ref('stg_adw_address') }}
    ),

    state_province AS (
        SELECT *
        FROM {{ ref('stg_adw_state_province') }}
    ),

    country_region AS (
        SELECT *
        FROM {{ ref('stg_adw_country_region') }}  
    ),

    dim_address AS (
        SELECT
            address.address_id,
            state_province.territory_id,
            address.address_line,
            address.city,
            state_province.province_name,
            country_region.country_name
        FROM address
        LEFT JOIN state_province 
            ON address.state_province_id = state_province.state_province_id
        LEFT JOIN country_region 
            ON state_province.country_region_code = country_region.country_region_code
    ),

    dim_address_sk AS (
        SELECT
            MD5(CONCAT(address_id, '_', territory_id, '_', address_line, '_', city, '_', province_name, '_', country_name)) AS address_sk,
            dim_address.*
        FROM dim_address
    )

SELECT *
FROM dim_address_sk
