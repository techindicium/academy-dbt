with
    fonte_productvendor as (
        select *
        from {{ source('sap_adventure_works', 'productvendor') }}
    )

select *
from fonte_productvendor