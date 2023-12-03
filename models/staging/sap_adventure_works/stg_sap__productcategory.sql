with
    fonte_productcategory as (
        select
            cast(productcategoryid as int) as productcategoryid
            , cast(name as string) as name
            , cast(rowguid as string) as rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'productcategory') }}
    )

select *
from fonte_productcategory