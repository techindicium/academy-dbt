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
       , transformed as (
        select
            stg_sales_territory. id_territory
            , stg_sales_territory.name_territory
            , stg_sales_territory.country_region_code
            , stg_sales_territory.group_territory
            , stg_sales_territory.sale_sytd
            , stg_sales_territory.cost_ytd
            , stg_sales_territory.cost_last_year
            , stg_sales_territory.row_guid
            , stg_sales_territory.modified_date
        from stg_sales_territory
            
    )
select *
from transformed