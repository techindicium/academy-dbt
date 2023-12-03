with
    fonte_shift as (
        select *
        from {{ source('sap_adventure_works', 'shift') }}
    )

select *
from fonte_shift