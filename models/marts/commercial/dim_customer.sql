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
            id_business_entity
            , store_name
        from {{ref('stg_sap__store')}}
    )

    , joined_store_name as (
        select
            customer.id_customer
            , customer.id_person
            , customer.id_store
            , customer.id_territory
            , store.store_name
        from customer
        left join store on customer.id_store = store.id_business_entity
    )

    , person as (
        select
            id_business_entity
            , title
            , namefull
        from {{ref('stg_sap__person')}}
    )

    , joined_customer_name as (
        select
            joined_store_name.id_customer
            , joined_store_name.id_person
            , joined_store_name.id_store
            , joined_store_name.id_territory
            , joined_store_name.store_name
            , person.title
            , person.namefull
        from joined_store_name
        left join person on joined_store_name.id_person = person.id_business_entity
    )

select *
from joined_customer_name
