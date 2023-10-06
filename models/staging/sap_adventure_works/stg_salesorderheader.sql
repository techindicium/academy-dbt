with 
    source_salesorderheader as (
        select 
            cast(salesorderid as int) as ID_order               
            ,cast(customerid as int) as ID_customer
            ,cast(territoryid as int) as ID_territory
            ,cast(shiptoaddressid as int) as  ID_ship_to_address
            ,cast(creditcardid as int) as ID_credit_card
            ,cast(freight as decimal) as freight                        
            ,cast(totaldue as decimal) as total_due 
            ,cast(status as int) as order_status                        
            ,cast(orderdate as datetime) as order_date                        
        from {{ source('erp', 'salesorderheader') }}
        order by ID_order
    )

select *
from source_salesorderheader
