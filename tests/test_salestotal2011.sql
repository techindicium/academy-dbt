{{
    config(
        severity = 'error'
    )
}}
with
    total_sales_2011 as (
        select 
            sum(treaedtotalsaled) as sales_total_2011_result
        from {{ ref('fct_sales') }}
        where order_date between '2011-01-01' and '2011-12-31'
    )
    
select *
from total_sales_2011
where sales_total_2011_result != 12646112.1607