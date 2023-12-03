with
    fonte_productinventory as (
        select *
        from {{ source('sap_adventure_works', 'productinventory') }}
    )

select *
from fonte_productinventory