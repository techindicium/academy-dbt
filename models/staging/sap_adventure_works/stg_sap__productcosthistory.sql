with
    fonte_productcosthistory as (
        select
            cast(productid as int) as productid
            , cast(startdate as timestamp) as startdate
            , cast(enddate as timestamp) as enddate
            , cast(standardcost as float) as standardcost
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'productcosthistory') }}
    )

select *
from fonte_productcosthistory