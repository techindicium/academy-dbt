with
    fonte_shoppingcartitem as (
        select *
        from {{ source('sap_adventure_works', 'shoppingcartitem') }}
    )

select *
from fonte_shoppingcartitem