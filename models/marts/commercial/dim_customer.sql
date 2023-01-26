with 
    stg_customer as (
        select 
            id_customer
            , id_person
            , id_store
            , id_territory
        from {{ref('stg_sap__customer')}}
    )

    , stg_store as (
        select 
            id_business_entity
            , store_name
        from {{ref('stg_sap__store')}}
    )

    , joined_store_name as (
        select
            stg_customer.id_customer
            , stg_customer.id_person
            , stg_customer.id_store
            , stg_customer.id_territory
            , stg_store.store_name
        from stg_customer
        left join stg_store on stg_customer.id_store = stg_store.id_business_entity
    )

    , stg_person as (
        select
            id_business_entity
            , title
            , full_name
        from {{ref('stg_sap__person')}}
    )

    , joined_customer_name as (
        select
            joined_store_name.id_customer
            , joined_store_name.id_person
            , joined_store_name.id_store
            , joined_store_name.id_territory
            , joined_store_name.store_name
            , stg_person.title
            , stg_person.full_name
        from joined_store_name
        left join stg_person on joined_store_name.id_person = stg_person.id_business_entity
    )

select *
from joined_customer_name
