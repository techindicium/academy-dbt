with
    fonte_productproductphoto as (
        select *
        from {{ source('sap_adventure_works', 'productproductphoto') }}
    )

select *
from fonte_productproductphoto