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
            stg_products.blabla 
            , stg_products.blabla 
            , stg_products.blabla 
            , stg_sub_category.sdad
        from stg_products
        left join stg_sub_category on
            stg_products."subcategoryid" = stg_sub_category."subcategoryid"
        left join stg_category on
            stg_sub_category."categoryid" = stg_category."categoryid"
    )

select *
from joined_tables
