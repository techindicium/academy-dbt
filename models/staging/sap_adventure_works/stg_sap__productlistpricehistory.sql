with
    fonte_productlistpricehistory as (
        select *
        from {{ source('sap_adventure_works', 'productlistpricehistory') }}
    )

select *
from fonte_productlistpricehistory