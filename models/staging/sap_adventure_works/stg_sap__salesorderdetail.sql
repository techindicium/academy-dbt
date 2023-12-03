with
    fonte_salesorderdetail as (
        select *
        from {{ source('sap_adventure_works', 'salesorderdetail') }}
    )

select *
from fonte_salesorderdetail