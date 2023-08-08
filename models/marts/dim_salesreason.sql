with 
    dim_salesorderheadereason as (
        select 
            ID_SalesOrder					
            ,ID_SalesOrderHeaderReason	
        from {{ ref('stg_salesorderheaderreason') }}
    ),

    dim_salesorderdetailreason as (
        select 
            ID_SalesReason						
            ,ReasonName				
            ,ReasonType					
        from {{ ref('stg_salesreason') }}
    ),

    join_salesreason as (
        select
            cast(ID_SalesOrder || ' ' || ID_SalesOrderHeaderReason as string) as ID_dim_Reason
            ,ID_SalesOrder
            ,ID_SalesOrderHeaderReason
            ,ID_SalesReason
            ,ReasonName
        from dim_salesorderheadereason
        left join dim_salesorderdetailreason on dim_salesorderheadereason.ID_SalesOrderHeaderReason = dim_salesorderdetailreason.ID_SalesReason
    )

select *
from join_salesreason