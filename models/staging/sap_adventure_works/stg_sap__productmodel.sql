with
    fonte_productmodel as (
        select *
        from {{ source('sap_adventure_works', 'productmodel') }}
    )

select *
from fonte_productmodel