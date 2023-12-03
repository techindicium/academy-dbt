with
    fonte_scrapreason as (
        select *
        from {{ source('sap_adventure_works', 'scrapreason') }}
    )

select *
from fonte_scrapreason