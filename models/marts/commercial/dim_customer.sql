with 
    customer as (
    select 
    id_customer
    , id_person
    , id_store
    , id_territory
    from {{ref('stg_sap__customer')}}
    )

, store as (
    select 
        id_businessentity as id_storebusinessentity
        , store_name
    from {{ref('stg_sap__store')}}
)

, person as (
    select
        id_businessentity
    from {{ref('stg_sap__person')}}
)

, transformed as (
    select 
        row_number() over (order by customer.id_customer) as customer_sk
     , customer.id_customer
     , person.id_businessentity
     , store.id_storebusinessentity
     , store.store_name
    from customer
    left join person on customer.id_person = person.id_businessentity
    left join store on customer.id_store = store.id_storebusinessentity
)
select *
from transformed