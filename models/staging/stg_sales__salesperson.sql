with source as (

    select * from {{ source('sales', 'sales_salesperson') }}
)

select * from source