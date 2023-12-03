with
    fonte_salesreason as (
        select *
        from {{ source('sap_adventure_works', 'salesreason') }}
    )

select *
from fonte_salesreason