with
    fonte_specialoffer as (
        select
            cast(specialofferid as int) as specialofferid
            , cast(description as string) as description
            , cast(discountpct as float) as discountpct
            , cast(type as string) as type
            , cast(category as string) as category
            , cast(startdate as timestamp) as startdate
            , cast(enddate as timestamp) as enddate 
            , cast(minqty as int) as minqty
            , cast(maxqty as int) as maxqty
            , cast(rowguid as string) as rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'specialoffer') }}
    )

select *
from fonte_specialoffer