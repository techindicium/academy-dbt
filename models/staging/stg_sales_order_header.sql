with stg_sales_order_header as (
    select
        cast(salesorderid as int) as salesorderid
        , cast(shipmethodid as int) as shipmethodid
        , cast(billtoaddressid as int) as billtoaddressid
        , modifieddate
        , rowguid
        , taxamt
        , cast(shiptoaddressid as int) as shiptoaddressid
        , onlineorderflag
        , cast(territoryid as int) as territoryid
        , status as order_status
        , orderdate
        , creditcardapprovalcode
        , subtotal
        , cast(creditcardid as int) as creditcardid
        , cast(currencyrateid as int) as currencyrateid
        , revisionnumber
        , freight
        , duedate
        , totaldue
        , cast(customerid as int) as customerid
        , cast(salespersonid as int) as salespersonid
        , shipdate
        , accountnumber
    from {{ source('raw-data', 'salesorderheader') }}
)

select *
from stg_sales_order_header


