with
    fonte_purchaseorderheader as (
        select *
        from {{ source('sap_adventure_works', 'purchaseorderheader') }}
    )

select *
from fonte_purchaseorderheader