with
    fonte_productmodelillustration as (
        select *
        from {{ source('sap_adventure_works', 'productmodelillustration') }}
    )

select *
from fonte_productmodelillustration