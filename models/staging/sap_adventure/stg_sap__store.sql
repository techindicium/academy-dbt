with
    source_store as (
        select
            cast(businessentityid as int) as id_business_entity
            , cast(salespersonid as int) as id_sales_person
            , cast(name as string) as store_name
            , cast(left(cast(modifieddate as string), 10) as date) as modified_date
        from {{ source('adw', 'store' ) }}
    )

select *
from source_store