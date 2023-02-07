-- Model Name: stg_sales_orders_reasons
-- Name: Eryc Masselli
-- Created_at: 2023-01-05

WITH salesorderheadersalesreason AS (
    SELECT * FROM {{ ref("salesorderheadersalesreason") }}
),

salesreason AS (
    SELECT * FROM {{ ref("salesreason") }}
),

final AS (
    SELECT
        sre.salesreasonid AS int_sales_reason_id,
        soh.salesorderid AS int_sales_order_id,
        sre.name AS str_sales_reason_name,
        sre.reasontype AS str_sales_reason_type,
        DATE(sre.modifieddate) AS dte_sales_reason_modied_Date,
        DATE(soh.modifieddate) AS dte_sales_order_header_reason_modified_date
    FROM salesorderheadersalesreason AS soh
    LEFT JOIN salesreason AS sre ON sre.salesreasonid = soh.salesreasonid  
)

SELECT * FROM final
