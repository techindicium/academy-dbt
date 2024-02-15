WITH 
    source_product_category AS (
        SELECT *
        FROM {{ source('sap_adw', 'productcategory') }}
    )

    , formatted_product_category AS (
        SELECT 
           productcategoryid AS product_category_id
           , name AS product_category_name
        FROM source_product_category
    )

SELECT *
FROM formatted_product_category
