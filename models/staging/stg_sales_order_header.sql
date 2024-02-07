with stg_sales_order_header as (
    select
        CAST(salesorderid AS INT) as salesorderid
        , CAST(shipmethodid AS INT) as shipmethodid
        , CAST(billtoaddressid AS INT) as billtoaddressid
        , modifieddate
        , rowguid
        , taxamt
        , CAST(shiptoaddressid AS INT) as shiptoaddressid
        , onlineorderflag
        , CAST(territoryid AS INT) as territoryid
        , status as order_status
        , orderdate
        , creditcardapprovalcode
        , subtotal
        , CAST(creditcardid AS INT) as creditcardid
        , CAST(currencyrateid AS INT) as currencyrateid
        , revisionnumber
        , freight
        , duedate
        , totaldue
        , CAST(customerid AS INT) as customerid
        , CAST(salespersonid AS INT) as salespersonid
        , shipdate
        , accountnumber
    from {{ source('raw-data', 'salesorderheader') }}
)
select *
from stg_sales_order_header
