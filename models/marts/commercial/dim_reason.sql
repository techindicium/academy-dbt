with 
    stg_sales_reason as (
        select 
            id_sales_reason
            , reason_name
            , reason_type
            , modified_date
        from {{ ref('salesorderheadersalesreason') }}
    )

    , transformed as (
        select
            id_sales_reason as pk_sales_reason
            , reason_name
            , reason_type
            , modified_date
        from stg_sales_reason
    )

select *
from transformed