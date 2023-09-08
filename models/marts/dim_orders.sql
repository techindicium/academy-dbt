with 
    salesorderheader as (
        select 
            ID_order               
            ,ID_customer
            ,ID_territory
            ,ID_ship_to_address
            ,ID_credit_card
            ,freight                        
            ,total_due 
            ,order_status                        
            ,order_date  
        from {{ ref('stg_salesorderheader') }}
    ),

    salesorderdetail as (
        select 
            ID_sales_order                     
            ,ID_order_detail
            ,ID_product   
            ,quantity
            ,unit_price
            ,unit_price_discount   
        from {{ ref('stg_salesorderdetail') }}
    ),

    credit_card_stg as (
        select
            ID_credit_card as code_creditcard	
            ,card_type	
            ,card_number	
        from {{ ref('stg_creditcard') }}
    ),

    joinedtables as (
        select
            cast((ID_order || '-' || ID_order_detail) as string) as pk_orders
            ,ID_order
            ,ID_order_detail
            ,ID_product
            ,ID_ship_to_address
            ,ID_credit_card
            ,ID_customer
            ,card_type
            ,order_date
            ,quantity
            ,unit_price
            ,unit_price_discount
            ,total_due
            ,freight
            ,order_status
        from salesorderheader
        left join salesorderdetail on salesorderheader.ID_order = salesorderdetail.ID_sales_order
        left join credit_card_stg on salesorderheader.ID_credit_card = credit_card_stg.code_creditcard
    )

select *
from joinedtables