with
    fonte_productsubcategory as (
        select
            cast(productsubcategoryid as int) as productsubcategoryid
            , cast(productcategoryid as int) as productcategoryid
            , cast(name as string) as name
            , cast(rowguid as string) as rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'productsubcategory') }}
    )

select *
from fonte_productsubcategory