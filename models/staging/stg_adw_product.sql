WITH 
    source_product AS (
        SELECT *
        FROM {{ source('sap_adw', 'product') }}
    )

    , formatted_product AS (
        SELECT
           productid AS product_id
           , name AS product_name
           , productsubcategoryid AS product_subcategory_id
           , safetystocklevel AS safety_stock_level
        FROM source_product
    )

SELECT *
FROM formatted_product
