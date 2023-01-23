with
    source_salesorderheader as (
        select
            cast(salesorderid as int) as id_salesorder
            , cast(customerid as int) as id_customer
            , cast(salespersonid as int) as id_salesperson
            , cast(territoryid as int) as id_territory
            , cast(billtoaddressid as string) as id_billtoaddress
            , cast(shiptoaddressid as string) as id_shiptoaddress
            , cast(shipmethodid as int) as id_shipmethod
            , cast(creditcardid as int) as id_creditcard
            , cast(currencyrateid as int) as id_currencyrate
            , cast(revisionnumber as int) as revisionnumber 
            , cast(orderdate as TIMESTAMP) as orderdate
            , cast(duedate as TIMESTAMP) as duedate
            , cast(shipdate as TIMESTAMP) as shipdate
            , cast(status as int) status
            , cast(onlineorderflag as boolean) as onlineorderflag
            , cast(purchaseordernumber as string) as purchaseordernumber
            , cast(accountnumber as string) as accountnumber        
            , cast(creditcardapprovalcode as string) as creditcardappovalcode
            , cast(subtotal as int) as subtotal
            , cast(taxamt as int) as taxamt
            , cast(freight as int) as freight
            , cast(totaldue as int) as totaldue
            , cast(comment as string) as comment
            , cast(rowguid as string) as rowguid
            , cast(modifieddate as TIMESTAMP) as modifieddate
        from {{source('adw', 'salesorderheader' )}}
    )
    select *
    from source_salesorderheader