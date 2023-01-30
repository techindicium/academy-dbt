with 
    stg_sales_territory as (
        select 
            id_territory
            , name_territory
            , country_region_code
            , group_territory
            , sale_sytd
            , sales_last_year
            , cost_ytd
            , cost_last_year
            , row_guid
            ,  modified_date
        from {{ ref('stg_sap__sales_territory') }}
    )
    
    , stg_sales_person as (
        select 
            id_territory
            , sales_quota
            , bonus
            , commission_pct
            , sales_ytd
            , sales_last_year
            , row_guid
            , modified_date
        from {{ ref('stg_sap__sales_person') }}
    )
       , joined_table  as (
        select
            stg_sales_person.id_business_entity
            , stg_sales_person.id_territory
            , stg_sales_person.sales_quota
            , stg_sales_person.bonus
            , stg_sales_person.commission_pct
            , stg_sales_person.sales_ytd
            , stg_sales_person.sales_last_year
            , stg_sales_territory.name_territory
            , stg_sales_territory.country_region_code
            , stg_sales_territory.group_territory
            , stg_sales_territory.sale_sytd
            , stg_sales_territory.cost_ytd
            , stg_sales_territory.cost_last_year
            , stg_sales_territory.row_guid
            , stg_sales_territory.modified_date
        from stg_sales_person
        left join stg_sales_territory on stg_sales_person.row_guid = stg_sales_territory.row_guid
    )
select *
from joined_table