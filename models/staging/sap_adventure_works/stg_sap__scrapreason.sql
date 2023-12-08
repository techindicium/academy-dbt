with
    fonte_scrapreason as (
        select
            cast(scrapreasonid as int) as scrapreasonid
            , cast(name as string) as name
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'scrapreason') }}
    )

select *
from fonte_scrapreason