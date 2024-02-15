with 
    product as (
        select *
        from {{ ref ('stg_adw_product') }}
    )
    
    , product_subcategory as (
        select *
        from {{ ref ('stg_adw_product_subcategory') }}
    )

    , product_category as (
        select *
        from {{ ref ('stg_adw_product_category') }}
    )

    , dim_product as (
        select 
            product.product_id
            , product.product_name
            , product_category.product_category_name
            , product_subcategory.product_subcategory_name
            , product.safety_stock_level
        from product
        left join product_subcategory 
            on product.product_subcategory_id = product_subcategory.product_subcategory_id
        left join product_category 
            on product_subcategory.product_category_id = product_category.product_category_id
    )
    
    , dim_product_sk as (
        select
            {{ dbt_utils.generate_surrogate_key(['product_id']) }} as product_sk
            , *
        from dim_product
    )

select *
from dim_product_sk