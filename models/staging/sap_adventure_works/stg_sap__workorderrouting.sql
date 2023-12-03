with
    fonte_workorderrouting as (
        select *
        from {{ source('sap_adventure_works', 'workorderrouting') }}
    )

select *
from fonte_workorderrouting