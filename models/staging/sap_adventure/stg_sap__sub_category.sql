with
    source_sub_category as (
        select
        cast(productsubcategoryid as int) as id_product_sub_category
            , cast(productcategoryid as int) as id_product_category
            , cast(name as string) as name_sub_category
            , cast(rowguid as string) as row_guid
            , cast(left(cast(modifieddate as string), 10) as date) as modified_date
        from {{ source('adw', 'productsubcategory' ) }}
            
    )
select *
from source_sub_category