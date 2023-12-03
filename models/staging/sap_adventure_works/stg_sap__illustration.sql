with
    fonte_illustration as (
        select
            cast(illustrationid as int) as illustrationid
            --, cast(diagram as string) as diagram
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'illustration') }}
    )

select *
from fonte_illustration