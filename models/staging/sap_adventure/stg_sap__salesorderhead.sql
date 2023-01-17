with
    source_salesorderheader as (
        select
            cast(salesorderid as int) as id_salesorder
            , cast(revisionnumber as int) as revisionnumber 
            , cast(orderdate as date) as orderdate
            , cast(duedate as date) as duedate
            , cast(shipdate as date) as shipdate
            , cast(status as int) status
            , cast(onlineorderflag as boolean) as onlineorderflag
            , cast(purchaseordernumber as string) as purchaseordernumber
            , cast(accountnumber as int) as accountnumber
            , cast(customerid as int) as id_customer
            , cast(salespersonid as int) as id_salesperson
            , cast(territoryid as int) as id_territory
            , cast(billtoaddressid as string) as id_billtoadress
            , cast(shiptoaddressid as string) as id_shiptoadress
            , cast(shipmethodid as int) as id_shipmethod
            , cast(creditcardid as int) as id_creditcard
            , cast(creditcardapprovalcode as int) as creditcardappovalcode
            , cast(currencyrateid as int) as id_currencyrate
            , cast(subtotal as int) as subtotal
            , cast(taxamt as int) as taxamt
            , cast(freight as int) as freight
            , cast(totaldue as int) as totaldue
            --, cast(comment as 
            , cast(rowguid as string) as rowguid
            , cast(modifieddate as date) as modifieddate
        from {{source('adw', 'salesorderheader' )}}
    )
    select *
    from source_salesorderheader