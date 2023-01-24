with 
    , stg_sales_reason as (
        select 
            id_salesreason
            , reason_name
            , reasontype
            , modifieddate
        from {{ ref('stg_sap__salesorderheadersalesreason') }}
    )

    , transformed as (
        select
            id_salesreason as pk_sales_reason
            , reason_name
            , reasontype
            , modifieddate
        from stg_sales_reason
    )

select *
from transformed