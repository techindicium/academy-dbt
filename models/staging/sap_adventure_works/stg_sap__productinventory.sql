with
    fonte_productinventory as (
        select
            cast(productid as int) as productid
            , cast(locationid as int) as locationid
            , cast(shelf as string) as shelf
            , cast(bin as int) as bin
            , cast(quantity as int) as quantity
            , cast(rowguid as string) as rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'productinventory') }}
    )

select *
from fonte_productinventory