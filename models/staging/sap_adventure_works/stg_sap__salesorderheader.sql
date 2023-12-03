with
    fonte_salesorderheader as (
        select *
        from {{ source('sap_adventure_works', 'salesorderheader') }}
    )

select *
from fonte_salesorderheader