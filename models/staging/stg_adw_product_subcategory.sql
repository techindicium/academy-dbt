WITH 
    source_product_sub_category AS (
        SELECT *
        FROM {{ source('sap_adw', 'productsubcategory') }}    
    )

    , formatted_product_sub_category AS (
        SELECT 
          productsubcategoryid AS product_subcategory_id
          , productcategoryid AS product_category_id
          , name AS product_subcategory_name
        FROM source_product_sub_category
    )

SELECT *
FROM formatted_product_sub_category
