with 
-- common table expressions (ctes) para chamar as fontes de dados no início
cte_product_reason as (
    select
        salesorderid
        , product_fk
        , unitprice
        , orderqty
        , unitpricediscount
        , reason_name_final
    from {{ ref('int_orders_product_reason')}}
),
cte_order_locations_creditcard as (
    select
        salesorderid
        , customer_fk
        , shiptoadress_fk
        , creditcard_fk
        , orderdate
        , order_status_name
    from {{ ref('int_orders_orderh_locations_creditcard')}}
),
-- unindo os dados usando as ctes
fct_orders_final as (
    select
        cte_product_reason.salesorderid
        , cte_product_reason.product_fk
        , cte_order_locations_creditcard.customer_fk
        , cte_order_locations_creditcard.shiptoadress_fk
        , cte_order_locations_creditcard.creditcard_fk
        , cte_product_reason.unitprice
        , cte_product_reason.orderqty
        , cte_product_reason.unitpricediscount
        , cte_order_locations_creditcard.orderdate
        , cte_product_reason.reason_name_final
        , cte_order_locations_creditcard.order_status_name
    from cte_product_reason
    left join cte_order_locations_creditcard
        on cte_product_reason.salesorderid = cte_order_locations_creditcard.salesorderid
)
-- selecionando os resultados finais
select *
from fct_orders_final
