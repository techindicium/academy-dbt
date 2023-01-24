with
    source_sales_order_header as (
        select
            cast(salesorderid as int) as id_sales_order
            , cast(customerid as int) as id_customer
            , cast(salespersonid as int) as id_sales_person
            , cast(territoryid as int) as id_territory
            , cast(billtoaddressid as string) as id_bill_to_address
            , cast(shiptoaddressid as int) as id_ship_to_address
            , cast(shipmethodid as int) as id_ship_method
            , cast(creditcardid as int) as id_credit_card
            , cast(currencyrateid as int) as id_currency_rate
            , cast(revisionnumber as int) as revision_number
            , cast(left(cast(orderdate as string), 10) as date) as order_date
            , cast(left(cast(duedate as string), 10) as date) as due_date
            , cast(left(cast(shipdate as string), 10) as date) as ship_date
            , cast(status as int) status
            , cast(onlineorderflag as boolean) as online_order_flag
            , cast(purchaseordernumber as string) as purchase_order_number
            , cast(accountnumber as string) as account_number        
            , cast(creditcardapprovalcode as string) as creditcar_dappoval_code
            , cast(subtotal as int) as sub_total
            , cast(taxamt as int) as taxamt
            , cast(freight as int) as freight
            , cast(totaldue as int) as total_due
            , cast(comment as string) as comment
            , cast(rowguid as string) as row_guid
            , cast(left(cast(modifieddate as string), 10) as date) as modified_date
        from {{source('adw', 'stg_sap__sales_order_head' )}}
    )
select *
from source_sales_order_header