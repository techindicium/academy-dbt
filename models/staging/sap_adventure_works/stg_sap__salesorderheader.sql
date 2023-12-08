with
    fonte_salesorderheader as (
        select
            cast(salesorderid as int) as salesorderid
            , cast(revisionnumber as int) as revisionnumber
            , cast(orderdate as timestamp) as orderdate
            , cast(duedate as timestamp) as duedate
            , cast(shipdate as timestamp) as shipdate
            , cast(status as int) as status
            , cast(onlineorderflag as bool) as onlineorderflag
            , cast(purchaseordernumber as string) as purchaseordernumber
            , cast(accountnumber as string) as accountnumber
            , cast(customerid as int) as customerid
            , cast(salespersonid as int) as salespersonid
            , cast(territoryid as int) as territoryid
            , cast(billtoaddressid as int) as billtoaddressid
            , cast(shiptoaddressid as int) as shiptoaddressid
            , cast(shipmethodid as int) as shipmethodid
            , cast(creditcardid as int) as creditcardid
            , cast(creditcardapprovalcode as string) as creditcardapprovalcode
            , cast(currencyrateid as int) as currencyrateid
            , cast(subtotal as decimal) as subtotal
            , cast(taxamt as decimal) as taxamt
            , cast(freight as decimal) as freight
            , cast(totaldue as decimal) as totaldue
            --, cast(comment as ) as 
            , cast(rowguid as string) as rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'salesorderheader') }}
    )

select *
from fonte_salesorderheader