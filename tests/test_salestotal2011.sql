{{
    config(
        severity = 'error'
    )
}}
with
    total_sales_2011 as (
        select 
            sum(quantity * price) as sales_total
        from {{ ref('fct_sales') }}
        where order_date between '2011-01-01' and '2011-12-31'
    )
select *
from total_sales_2011
where sales_total != 12646112.1607