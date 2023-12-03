with
    fonte_purchaseorderdetail as (
        select *
        from {{ source('sap_adventure_works', 'purchaseorderdetail') }}
    )

select *
from fonte_purchaseorderdetail