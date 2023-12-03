with
    fonte_vendor as (
        select *
        from {{ source('sap_adventure_works', 'vendor') }}
    )

select *
from fonte_vendor