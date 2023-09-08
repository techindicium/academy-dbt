with 
    salesorderheadereason as (
        select 
            ID_order					
            ,ID_sales_order_header_reason	
        from {{ ref('stg_salesorderheaderreason') }}
    ),

    salesorderdetailreason as (
        select 
            ID_sales_reason						
            ,reason_name								
        from {{ ref('stg_salesreason') }}
    ),

    joined_salesreason as (
        select
            ID_order
            ,string_agg(CAST(ID_sales_reason AS STRING), ', ') as aggregated_sales_reasonsID
            ,string_agg(reason_name, ', ') as aggregated_reasons
        from salesorderheadereason
        left join salesorderdetailreason on salesorderheadereason.ID_sales_order_header_reason = salesorderdetailreason.ID_sales_reason
        group by ID_order
    )

select *
from joined_salesreason