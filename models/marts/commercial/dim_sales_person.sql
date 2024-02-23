with 
    stg_person as (
      select
          id_person
          , first_name
          , middle_name
          , last_name
          , full_name
          , person_type
      from {{ref('stg_sap__person')}}
    )

    , stg_employee as (
        select 
            id_sales_person
            , id_nacional_number
            , birth_date
            , hire_date
            , salaried_flag
            , sick_leave_hours
            , current_flag
            , vacation_hours
            , marital_status
            , gender
        from {{ref('stg_sap__employee')}}
    )

    , stg_sales_person as (
        select *
        from {{ref('stg_sap__sales_person')}}
    )

    , joined_person_employee as (
        select
            stg_employee.id_sales_person
            , stg_employee.id_nacional_number
            , stg_person.id_person
            , stg_person.full_name
            , stg_person.person_type
            , stg_employee.birth_date
            , stg_employee.hire_date
            , stg_employee.salaried_flag
            , stg_employee.sick_leave_hours
            , stg_employee.current_flag
            , stg_employee.vacation_hours
            , stg_employee.gender
            , stg_employee.marital_status
        from stg_person
        inner join stg_employee on stg_person.id_person = stg_employee.id_sales_person
    )

    , joined_employee_and_sales_person  as (
        select
            stg_sales_person.id_sales_person
            , stg_sales_person.id_territory
            , stg_sales_person.sales_quota
            , stg_sales_person.bonus
            , stg_sales_person.commission_pct
            , stg_sales_person.sales_ytd
            , stg_sales_person.sales_last_year
            , joined_person_employee.id_nacional_number
            , joined_person_employee.full_name
            , joined_person_employee.person_type
            , joined_person_employee.birth_date
            , joined_person_employee.hire_date
            , joined_person_employee.salaried_flag
            , joined_person_employee.sick_leave_hours
            , joined_person_employee.current_flag
            , joined_person_employee.vacation_hours
            , joined_person_employee.gender
            , joined_person_employee.marital_status
        from joined_person_employee
        left join stg_sales_person on joined_person_employee.id_sales_person = stg_sales_person.id_sales_person
        where joined_person_employee.person_type = 'SP'
    )
    
select *
from joined_employee_and_sales_person