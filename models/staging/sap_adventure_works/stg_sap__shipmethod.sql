with
    fonte_shipmethod as (
        select
            cast(shipmethodid as int) as shipmethodid
            , cast(name as string) as name
            , cast(shipbase as decimal) as shipbase
            , cast(shiprate as decimal) as shiprate
            , cast(rowguid as string) as rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'shipmethod') }}
    )

select *
from fonte_shipmethod