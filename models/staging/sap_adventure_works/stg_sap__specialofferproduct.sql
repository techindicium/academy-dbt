with
    fonte_specialofferproduct as (
        select *
        from {{ source('sap_adventure_works', 'specialofferproduct') }}
    )

select *
from fonte_specialofferproduct