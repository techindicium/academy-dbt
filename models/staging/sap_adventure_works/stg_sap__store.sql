with
    fonte_store as (
        select *
        from {{ source('sap_adventure_works', 'store') }}
    )

select *
from fonte_store