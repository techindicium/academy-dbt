with 
    salesorderheaders as (
        select * 
        from {{ ref('stg_salesorderheader') }}
    ),

    salesorderdetails as (
        select * 
        from {{ ref('stg_salesorderdetail') }}
    ),

    joinedtables as (
        select
            ID_order
            ,ID_sales_order_detail
            ,ID_product
            ,order_date
            --,modification_date
            ,order_quantity as quantity
            ,unit_price as price
            ,totaldue
            ,subtotal
            ,taxamt
            ,freight
        from salesorderheaders
        left join salesorderdetails on salesorderheaders.ID_order = salesorderdetails.ID_sales_order
        
    )

/*  CTE de teste do valor bruto vendido no ano de 2011  
    totalinayear as ( 
        select 
            sum(quantity * price) as total_bruto 
         from joinedtables
         where joinedtables.order_date BETWEEN '2011-01-01' AND '2011-12-31'
    )*/

select * 
from joinedtables