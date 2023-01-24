with
    source_category as (
        select
        cast(productcategoryid as int) as id_product_category
            , cast(name as string) as name_category
            , cast(rowguid as string) as row_guid
            , cast(left(cast(modifieddate as string), 10) as date) as modified_date
        from {{ source('adw', 'stg_sap__category' ) }}
            
    )
select *
from source_category