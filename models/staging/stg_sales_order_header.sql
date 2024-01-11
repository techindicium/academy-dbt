with stg_sales_order_header as (
    select
        salesorderid
        , shipmethodid
        , billtoaddressid
        , modifieddate
        , rowguid
        , taxamt
        , shiptoaddressid
        , onlineorderflag
        , territoryid
        , status as order_status
        , orderdate
        , creditcardapprovalcode
        , subtotal
        , creditcardid
        , currencyrateid
        , revisionnumber
        , freight
        , duedate
        , totaldue
        , customerid
        , salespersonid
        , shipdate
        , accountnumber
    from {{ source('raw-data', 'salesorderheader') }}
)
select *
from stg_sales_order_header