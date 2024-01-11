with source as (

    select * from {{ source('sales', 'sales_customer') }}
)

select * from source