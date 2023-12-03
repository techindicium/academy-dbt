with
    fonte_stateprovince as (
        select *
        from {{ source('sap_adventure_works', 'stateprovince') }}
    )

select *
from fonte_stateprovince