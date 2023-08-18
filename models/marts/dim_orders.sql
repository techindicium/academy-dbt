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
            cast((ID_order || '-' || ID_sales_order_detail) as string) as pk_orders
            ,ID_order
            ,ID_sales_order_detail
            ,ID_orderproduct
            ,ID_ship_to_address
            ,ID_credit_card
            ,ID_customer_order
            ,order_date
            ,order_quantity as quantity
            ,unit_price as price
            ,unit_price_discount
            ,totaldue
            ,subtotal
            ,taxamt
            ,freight
            ,order_status
        from salesorderheaders
        left join salesorderdetails on salesorderheaders.ID_order = salesorderdetails.ID_sales_order
        
    )

select *
from joinedtables