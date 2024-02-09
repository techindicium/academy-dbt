{{ 
    config (
      severity='error'
    )
}}

 with vendas_brutas as (
  select
    sum(unitprice * (orderqty - unitpricediscount)) as total_bruto_vendido
  from {{ ref('fct_orders') }}
  where orderdate between '2021-01-01' and '2021-12-31'
)

select total_bruto_vendido
from vendas_brutas
where total_bruto_vendido not between 12646111.16 and 12646113.16
