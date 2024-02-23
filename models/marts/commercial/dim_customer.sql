with 
    stg_person as (
        select
            id_person
            , title
            , full_name
        from {{ref('stg_sap__person')}}
    )
    
    , stg_customer as (
        select 
            id_customer
            , id_person
            , id_store
            , id_territory
        from {{ref('stg_sap__customer')}}
    )
    
    , transformed as (
        select
            stg_customer.id_customer
            , stg_person.id_person
            , stg_customer.id_territory
            , stg_person.full_name
        from stg_customer
        inner join stg_person on stg_customer.id_person = stg_person.id_person
    )

    , int_location as (
        select *
        from {{ ref('int__location_joined') }}
    )

    , business_entity_adress as (
        select
            id_address
            , id_business_entity
        from {{ ref('stg_sap__business_entity_address') }}
        where id_address_type = 2 /* Home address code */
    )

    , joined_transformed as (
        select
            transformed.id_customer
            , transformed.id_person
            , transformed.id_territory
            , transformed.full_name
            , int_location.id_address as id_home_address
            , int_location.city
            , int_location.state_name
            , int_location.country_name
            , int_location.state_province_code
            , int_location.country_region_code
        from  transformed 
        left join business_entity_adress as bda on transformed.id_person = bda.id_business_entity
        left join int_location on bda.id_address = int_location.id_address
    )

select *
from joined_transformed