-- Model Name: stg_locations
-- Name: Eryc Masselli
-- Created_at: 2023-01-05

WITH stateprovince AS (
    SELECT * FROM {{ ref("stateprovince") }}
),

countryregion AS (
    SELECT * FROM {{ ref("countryregion") }}
),

address AS (
    SELECT * FROM {{ ref("address") }}
),

final AS (
    SELECT
        adr.addressid AS int_address_id,
        adr.addressline1 AS str_address_line1,
        adr.addressline2 AS str_address_line2,
        adr.city AS str_city,
        adr.stateprovinceid AS int_state_provice_id,
        stp.stateprovincecode AS str_state_province_code,
        stp.isonlystateprovinceflag AS bol_is_only_state_province_flag,
        stp.name AS str_state_province_name,
        stp.territoryid AS int_territory_id,
        adr.postalcode AS str_postal_code,
        adr.spatiallocation AS str_spatial_location,
        stp.countryregioncode AS str_contry_region_code,
        ctr.name AS str_country_region_code,
        DATE(ctr.modifieddate) AS dte_country_region_modified_date,
        DATE(stp.modifieddate) AS dte_state_province_modified_date,
        DATE(adr.modifieddate) AS dte_modified_date
    FROM address AS adr
    LEFT JOIN stateprovince AS stp ON stp.stateprovinceid = adr.stateprovinceid
    LEFT JOIN countryregion AS ctr ON ctr.countryregioncode = stp.countryregioncode
)

SELECT * FROM final
