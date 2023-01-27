with 
    stg_person as (
        select 
            id_business_entity
            , first_name
            , middle_name
            , last_name
            , full_name
            , person_type
        from {{ref('stg_sap__person')}}
    )

    , stg_employee as (
        select *
        from {{ref('stg_sap__person')}}
    )
    
    , stg_sales_person as (
        select 
            *
        from {{ref('stg_sap__person')}}
    )

    , joined_person_employee as (
        select
            stg_person.first_name
            , stg_person.last_name
            , stg_person.full_name
            , stg_person.person_type
            , stg_employee.id_business_entity
            , stg_employee.id_nacional_number
            , stg_employee.birthdate
            , stg_employee.marital_status
            , stg_employee.hire_date
            , stg_employee.salaried_flag
            , stg_employee.sick_leave_hours
            , stg_employee.current_flag
            , stg_employee.vacation_hours
            , stg_employee.marital_status
            , stg_employee.gender
            , stg_employee.row_guid
            , stg_employee.modified_date
        from stg_person
        left join stg_employee on stg_person.id_business_entity = stg_employee.id_business_entity
    )
select *
from joined_person_employee

    , stg_person as (
        select
            id_business_entity
            , title
            , full_name
        from {{ref('stg_sap__sales_person')}}
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
