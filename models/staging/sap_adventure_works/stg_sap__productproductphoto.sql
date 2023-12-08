with
    fonte_productproductphoto as (
        select
            cast(productid as int) as productid
            , cast(productphotoid as int) as productphotoid
            , cast(primary as bool) as primary
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'productproductphoto') }}
    )

select *
from fonte_productproductphoto