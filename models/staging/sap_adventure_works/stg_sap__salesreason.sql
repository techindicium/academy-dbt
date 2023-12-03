with
    fonte_salesreason as (
        select
            cast(salesreasonid as int) as salesreasonid
            , cast(name as string) as name
            , cast(reasontype as string) as reasontype
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'salesreason') }}
    )

select *
from fonte_salesreason