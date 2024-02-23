with 
    stg_sales_reason as (
        select 
            id_sales_reason
            , reason_name
            , reason_type
            , modified_date
        from {{ ref('stg_sap__sales_reason') }}
    )

select *
from stg_sales_reason