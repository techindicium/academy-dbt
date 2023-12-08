with
    fonte_culture as (
        select
            cast(cultureid as string) as cultureid
            , cast(name as string) as name
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'culture') }}
    )

select *
from fonte_culture