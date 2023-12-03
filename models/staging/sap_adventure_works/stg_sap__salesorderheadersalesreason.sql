with
    fonte_salesorderheadersalesreason as (
        select *
        from {{ source('sap_adventure_works', 'salesorderheadersalesreason') }}
    )

select *
from fonte_salesorderheadersalesreason