with
    fonte_transactionhistory as (
        select *
        from {{ source('sap_adventure_works', 'transactionhistory') }}
    )

select *
from fonte_transactionhistory