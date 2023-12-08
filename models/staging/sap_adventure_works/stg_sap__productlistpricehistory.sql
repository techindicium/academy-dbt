with
    fonte_productlistpricehistory as (
        select
            cast(productid as int) as productid
            , cast(startdate as timestamp) as startdate
            , cast(enddate as timestamp) as enddate
            , cast(listprice as decimal) as listprice
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'productlistpricehistory') }}
    )

select *
from fonte_productlistpricehistory