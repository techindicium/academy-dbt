with
    fonte_shift as (
        select
            cast(shiftid as int) as shiftid
            , cast(name as string) as name
            , cast(starttime as time) as starttime
            , cast(endtime as time) as endtime
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'shift') }}
    )

select *
from fonte_shift