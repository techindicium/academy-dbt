with
    fonte_workorder as (
        select *
        from {{ source('sap_adventure_works', 'workorder') }}
    )

select *
from fonte_workorder