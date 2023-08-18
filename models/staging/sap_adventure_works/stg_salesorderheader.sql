with 
    source_salesorderheader as (
        select 
            cast(salesorderid as int) as ID_order               
            ,cast(customerid as int) as ID_customer_order
            ,cast(salespersonid as int) as ID_sales_person
            ,cast(territoryid as int) as ID_territory
            ,cast(billtoaddressid as int) as ID_bill_to_address
            ,cast(shiptoaddressid as int) as  ID_ship_to_address
            ,cast(shipmethodid as int) as ID_ship_method
            ,cast(creditcardid as int) as ID_credit_card
            ,cast(currencyrateid as int) as ID_currency_rate
            ,cast(subtotal as decimal) as subtotal                      
            ,cast(taxamt as decimal) as taxamt                  
            ,cast(freight as decimal) as freight                        
            ,cast(totaldue as decimal) as totaldue 
            ,cast(revisionnumber as int) as rev_number                                                      
            ,cast(status as int) as order_status                        
            ,cast(onlineorderflag as BOOLEAN) as online_order_flag                      
            ,cast(purchaseordernumber as STRING) as purchase_order_numer                        
            ,cast(accountnumber as STRING) as account_number                                    
            ,cast(creditcardapprovalcode as STRING) as credit_card_approval_code                                     
            ,cast(comment as int) as comment                        
            ,cast(rowguid as STRING) as row_guid  
            ,cast(orderdate as DATETIME) as order_date                        
            ,cast(duedate as DATETIME) as due_date                
            ,cast(shipdate as DATETIME) as ship_date
            ,cast(modifieddate as DATETIME) as oh_modified_date
        from {{ source('erp', 'salesorderheader') }}
        order by ID_order
    )

select *
from source_salesorderheader
