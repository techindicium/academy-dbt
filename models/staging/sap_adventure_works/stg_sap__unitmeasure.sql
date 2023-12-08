with
    fonte_unitmeasure as (
        select
            cast(unitmeasurecode as string) as unitmeasurecode
            , cast(name as string) as name
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'unitmeasure') }}
    )

select *
from fonte_unitmeasure