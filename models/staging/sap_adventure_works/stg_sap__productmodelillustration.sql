with
    fonte_productmodelillustration as (
        select
            cast(productmodelid as int) as productmodelid
            , cast(illustrationid as int) as illustrationid
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'productmodelillustration') }}
    )

select *
from fonte_productmodelillustration