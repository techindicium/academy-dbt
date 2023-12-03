with
    fonte_productvendor as (
        select
            cast(productid as int) as productid
            , cast(businessentityid as int) as businessentityid
            , cast(averageleadtime as int) as averageleadtime
            , cast(standardprice as float) as standardprice
            , cast(lastreceiptcost as float) as lastreceiptcost
            , cast(lastreceiptdate as timestamp) as lastreceiptdate
            , cast(minorderqty as int) as minorderqty
            , cast(maxorderqty as int) as maxorderqty
            , cast(onorderqty as int) as onorderqty
            , cast(unitmeasurecode as string) as unitmeasurecode
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'productvendor') }}
    )

select *
from fonte_productvendor