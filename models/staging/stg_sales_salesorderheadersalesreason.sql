with source as (

    select * from {{ source('sales', 'sales_salesorderheadersalesreason') }}
)

select * from source