with
    fonte_shipmethod as (
        select *
        from {{ source('sap_adventure_works', 'shipmethod') }}
    )

select *
from fonte_shipmethod