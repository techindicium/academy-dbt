with
    fonte_productmodel as (
        select
            cast(productmodelid as int) as productmodelid
            , cast(name as string) as name
            --, cast(catalogdescription as string) as catalogdescription
            --, cast(instructions as string) as instructions
            , cast(rowguid as string) as rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'productmodel') }}
    )

select *
from fonte_productmodel