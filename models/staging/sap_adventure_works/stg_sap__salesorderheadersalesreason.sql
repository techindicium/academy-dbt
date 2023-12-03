with
    fonte_salesorderheadersalesreason as (
        select
            cast(salesorderid as int) as salesorderid
            , cast(salesreasonid as int) as salesreasonid
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'salesorderheadersalesreason') }}
    )

select *
from fonte_salesorderheadersalesreason