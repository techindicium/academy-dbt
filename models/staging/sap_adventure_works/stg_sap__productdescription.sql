with
    fonte_productdescription as (
        select *
        from {{ source('sap_adventure_works', 'productdescription') }}
    )

select *
from fonte_productdescription