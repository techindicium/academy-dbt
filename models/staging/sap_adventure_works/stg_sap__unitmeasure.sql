with
    fonte_unitmeasure as (
        select *
        from {{ source('sap_adventure_works', 'unitmeasure') }}
    )

select *
from fonte_unitmeasure