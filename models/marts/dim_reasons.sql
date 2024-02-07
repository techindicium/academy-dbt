-- cte com dados da razão de vendas

with stg_sales_order_header_sales_reason as (
    select *
    from {{ref('stg_sales_order_header_sales_reason')}}
)

, stg_salesreason as (
    select *
    from {{ref('stg_sales_reason')}}
)

, reasons_transformed as (
    select 
        stg_sales_order_header_sales_reason.salesorderid,
        string_agg(stg_salesreason.reason_name, ', ') as reason_name_aggregated
    from stg_sales_order_header_sales_reason
    left join stg_salesreason 
        on stg_sales_order_header_sales_reason.salesreasonid = stg_salesreason.salesreasonid 
    group by stg_sales_order_header_sales_reason.salesorderid
)

select * 
from reasons_transformed

