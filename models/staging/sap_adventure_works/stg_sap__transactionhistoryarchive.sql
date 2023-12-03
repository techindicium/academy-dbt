with
    fonte_transactionhistoryarchive as (
        select *
        from {{ source('sap_adventure_works', 'transactionhistoryarchive') }}
    )

select *
from fonte_transactionhistoryarchive