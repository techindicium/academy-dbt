with 
    stg_products as (
        select *
        from {{ ref('stg_sap__products') }}
    )

    , stg_sub_category as (
        select *
        from {{ ref('stg_sap__sub_category') }}
    )

    , stg_category as (
        select *
        from {{ ref('stg_sap__category') }}
    )
    
    , joined_tables as (
        select
            stg_products.id_product 
            , stg_products.id_product_model 
            , stg_products.name_product
            , stg_products.number_product
            , stg_products.make_flag
            , stg_products.finished_goods_flag
            , stg_products.color
            , stg_products.safety_stock_level
            , stg_products.reorder_point
            , stg_products.standard_cost
            , stg_products.price_list
            , stg_products.number_size
            , stg_products.unit_mesure
            , stg_products.weigh_unit_mensure
            , stg_products.weight
            , stg_products.days_to_manufacture
            , stg_products.product_line
            , stg_products.class
            , stg_products.style
            , stg_products.start_sell_date
            , stg_products.end_sell_date
            , stg_products.row_guid
            , stg_products.modified_date
            , stg_sub_category.id_product_sub_category
            , stg_sub_category.id_product_category
            , stg_sub_category.name_sub_category
            , stg_category.name_category
        from stg_products
        left join stg_sub_category on
            stg_products.id_product_sub_category = stg_sub_category.id_product_sub_category
        left join stg_category on
            stg_sub_category.id_product_category = stg_category.id_product_category
    )

select *
from joined_tables