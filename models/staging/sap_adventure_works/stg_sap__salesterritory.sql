with
    fonte_salesterritory as (
        select *
        from {{ source('sap_adventure_works', 'salesterritory') }}
    )

select *
from fonte_salesterritory