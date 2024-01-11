with source as (

    select * from {{ source('sales', 'sales_salesreason') }}
)

select * from source