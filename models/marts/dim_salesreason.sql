with 
    dim_salesorderheadereason as (
        select *
        from {{ ref('stg_salesorderheaderreason') }}
    ),

    dim_salesorderdetailreason as (
        select *
        from {{ ref('stg_salesreason') }}
    ),

    join_salesreason as (
        select 
            ID_SalesOrder 
            ,ID_SalesReason
            ,ReasonName
            ,ReasonType
            ,SOHR_ModifiedDate
            ,SR_ModifiedDate
        from dim_salesorderheadereason
        left join dim_salesorderdetailreason on dim_salesorderheadereason.ID_SalesOrderHeaderReason = dim_salesorderdetailreason.ID_SalesReason
    )

select * 
from join_salesreason