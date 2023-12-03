with
    fonte_productdescription as (
        select
            cast(productdescriptionid as int) as productdescriptionid
            , cast(description as string) as description
            , cast(rowguid as string) as rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'productdescription') }}
    )

select *
from fonte_productdescription