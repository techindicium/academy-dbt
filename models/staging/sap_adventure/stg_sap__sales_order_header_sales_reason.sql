with
    source_sales_order_header_sales_reason as (
        select
            cast(salesorderid as int) as id_sales_order
            , cast(salesreasonid as int) as id_sales_reason
            , cast(left(cast(modifieddate as string), 10) as date) as modified_date
        from {{source('adw', 'stg_sap__sales_order_header_sales_reason' )}}
    )
select *
from source_sales_order_header_sales_reason