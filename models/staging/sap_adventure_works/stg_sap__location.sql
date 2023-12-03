with
    fonte_location as (
        select
            cast(locationid as int) as locationid
            , cast(name as string) as name
            , cast(costrate as float) as costrate
            , cast(availability as float) as availability
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'location') }}
    )

select *
from fonte_location