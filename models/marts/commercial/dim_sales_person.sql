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
        select 
            id_business_entity
            , id_nacional_number
            , birth_date
            , marital_status
            , hire_date
            , salaried_flag
            , sick_leave_hours
            , current_flag
            , vacation_hours
            , marital_status
            , gender
            , row_guid
            , modified_date
        from {{ref('stg_sap__employee')}}
    )
    
    , stg_sales_person as (
        select *
        from {{ref('stg_sap__sales_person')}}
    )

    , stg_sales_territory as (
        select *
        from {{ref('stg_sap__sales_territory')}}
    )

    , joined_person_employee as (
        select
            stg_employee.id_business_entity
            , stg_employee.id_nacional_number
            , stg_person.first_name
            , stg_person.last_name
            , stg_person.full_name
            , stg_person.person_type
            , stg_employee.birth_date
            , stg_employee.hire_date
            , stg_employee.salaried_flag
            , stg_employee.sick_leave_hours
            , stg_employee.current_flag
            , stg_employee.vacation_hours
            , stg_employee.gender
            , stg_employee.row_guid
            , stg_employee.modified_date
        from stg_person
        left join stg_employee on stg_person.id_business_entity = stg_employee.id_business_entity
    )

    , joined_employee_and_sales_person  as (
        select
            stg_sales_person.id_business_entity
            , stg_sales_person.id_territory
            , stg_sales_person.sales_quota
            , stg_sales_person.bonus
            , stg_sales_person.commission_pct
            , stg_sales_person.sales_ytd
            , stg_sales_person.sales_last_year
            , stg_sales_person.row_guid
            , stg_sales_person.modified_date
            , joined_person_employee.id_nacional_number
            , joined_person_employee.first_name
            , joined_person_employee.last_name
            , joined_person_employee.full_name
            , joined_person_employee.person_type
            , joined_person_employee.birth_date
            , joined_person_employee.hire_date
            , joined_person_employee.salaried_flag
            , joined_person_employee.sick_leave_hours
            , joined_person_employee.current_flag
            , joined_person_employee.vacation_hours
            , joined_person_employee.gender

        from stg_sales_person
        left join joined_person_employee on stg_sales_person.id_business_entity = joined_person_employee.id_business_entity
    )

    , joined_employee_and_sales_person_and_sales_territory  as (
        select
            stg_sales_person.id_business_entity
            , stg_sales_person.sales_quota
            , stg_sales_person.bonus
            , stg_sales_person.commission_pct
            , stg_sales_person.sales_ytd
            , stg_sales_person.row_guid
            , stg_sales_person.modified_date
            , joined_person_employee.id_nacional_number
            , joined_person_employee.first_name
            , joined_person_employee.last_name
            , joined_person_employee.full_name
            , joined_person_employee.person_type
            , joined_person_employee.birth_date
            , joined_person_employee.hire_date
            , joined_person_employee.salaried_flag
            , joined_person_employee.sick_leave_hours
            , joined_person_employee.current_flag
            , joined_person_employee.vacation_hours
            , joined_person_employee.gender
            , stg_sales_territory.id_territory
            , stg_sales_territory.name_territory
            , stg_sales_territory.country_region_code
            , stg_sales_territory.group_territory
            , stg_sales_territory.sale_sytd
            , stg_sales_territory.sales_last_year
            , stg_sales_territory.cost_ytd
            , stg_sales_territory.cost_last_year
        from stg_sales_territory
        left join joined_employee_and_sales_person on stg_sales_territory.id_territory = joined_employee_and_sales_person.id_territory
    )
select *
from joined_employee_and_sales_person_and_sales_territory