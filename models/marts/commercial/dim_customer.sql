with 
    stg_sap__customer as (
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
            stg_sap__customer.id_customer
            , stg_sap__customer.id_person
            , stg_sap__customer.id_store
            , stg_sap__customer.id_territory
            , store.store_name
        from stg_sap__customer
        left join store on stg_sap__customer.id_store = store.id_business_entity
    )

    , person as (
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
            , person.title
            , person.full_name
        from joined_store_name
        left join person on joined_store_name.id_person = person.id_business_entity
    )

select *
from joined_customer_name
