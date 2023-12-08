with
    fonte_salesorderdetail as (
        select
            cast(salesorderid as int) as salesorderid
            , cast(salesorderdetailid as int) as salesorderdetailid
            , cast(carriertrackingnumber as string) as carriertrackingnumber
            , cast(orderqty as int) as orderqty
            , cast(productid as int) as productid
            , cast(specialofferid as int) as specialofferid
            , cast(unitprice as decimal) as unitprice
            , cast(unitpricediscount as decimal) as unitpricediscount
            , cast(rowguid as string) as rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'salesorderdetail') }}
    )

select *
from fonte_salesorderdetail