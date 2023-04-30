with
    -- traz as tabelas stg para formar a dimensão
    stg_person_adress as (
        select
            address_id
            ,address_city
            ,address_state_province_id
        from {{ref('stg_sap__person_address')}}
    )
    ,stg_person_state_province as (
        select
            state_province_id
            ,state_province_country_region_code
            ,state_province_name
            ,state_province_territory_id
        from {{ref('stg_sap__state_province')}}
    )
    ,stg_person_country_region as (
        select
            country_region_code
            ,country_region_name
        from {{ref('stg_sap__country_region')}}
    )
    -- realiza o join entre as tabelas stg para formar a dimensão
    ,join_tabelas as (
        select
            stg_person_adress.address_id
            ,stg_person_adress.address_city
            ,stg_person_state_province.state_province_id
            ,stg_person_state_province.state_province_country_region_code
            ,stg_person_state_province.state_province_name
            ,stg_person_state_province.state_province_territory_id
            ,stg_person_country_region.country_region_name
        from stg_person_adress
        left join stg_person_state_province on stg_person_adress.address_state_province_id = stg_person_state_province.state_province_id
        left join stg_person_country_region on stg_person_state_province.state_province_country_region_code = stg_person_country_region.country_region_code
    )
    , address_sk as (
        select
            row_number() over(order by address_id) as address_sk
            ,address_id
            ,address_city
            ,state_province_id
            ,state_province_country_region_code
            ,state_province_name
            ,state_province_territory_id
            ,country_region_name
        from join_tabelas
    )
select *
from address_sk