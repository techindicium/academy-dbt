with
    fonte_purchaseorderheader as (
        select
            cast(purchaseorderid as int) as purchaseorderid
            , cast(revisionnumber as int) as revisionnumber
            , cast(status as int) as status
            , cast(employeeid as int) as employeeid
            , cast(vendorid as int) as vendorid
            , cast(shipmethodid as int) as shipmethodid
            , cast(orderdate as timestamp) as orderdate
            , cast(shipdate as timestamp) as shipdate
            , cast(subtotal as float) as subtotal
            , cast(taxamt as float) as taxamt
            , cast(freight as float) as freight
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'purchaseorderheader') }}
    )

select *
from fonte_purchaseorderheader