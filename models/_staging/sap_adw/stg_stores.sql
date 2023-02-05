-- Model Name: stg_stores
-- Name: Eryc Masselli
-- Created_at: 2023-01-05

WITH person AS (
    SELECT * FROM {{ ref("store") }}
),

final AS (
    SELECT
        businessentityid AS int_store_id,
        name AS str_store_name,
        salespersonid AS int_sales_people_id,
        demographics AS str_demographics,
        DATE(modifieddate) AS dte_modified_date
    FROM store
)

SELECT * FROM final
