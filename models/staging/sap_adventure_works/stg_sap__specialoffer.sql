with
    fonte_specialoffer as (
        select *
        from {{ source('sap_adventure_works', 'specialoffer') }}
    )

select *
from fonte_specialoffer