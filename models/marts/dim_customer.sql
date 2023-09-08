with
    customers as (
        select 
            ID_customer				
            ,ID_person				
            ,ID_store		
            ,ID_territory
        from {{ ref('stg_customer') }}
    ),

    persons as (
        select 
            ID_business_entity				
            ,firt_name				
            ,middle_name				
            ,last_name	 
        from {{ ref('stg_person') }}
    ),
    
    join_customers_to_persons as (
        select 
            ID_customer
            ,ID_person
            ,ID_business_entity
            ,ID_store
            ,ID_territory
            ,firt_name || ' ' || last_name as customer_name

        from customers
        left join persons on customers.ID_person = persons.ID_business_entity
    )
    
select * 
from join_customers_to_persons