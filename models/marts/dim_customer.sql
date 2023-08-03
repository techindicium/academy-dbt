with
    customers as (
        select *
        from {{ ref('stg_customer') }}
    ),

    persons as (
        select * 
        from {{ ref('stg_person') }}
    ),
    join_customers_to_persons as (
        select *
        from customers
        left join persons on customers.ID_Person = persons.ID_BusinessEntity
    )
select * 
from join_customers_to_persons
 