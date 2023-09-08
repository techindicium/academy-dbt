with 
    intermediate_sales_reason as (
        select
            ID_order as ID_reason_order
            ,aggregated_sales_reasonsID 
            ,aggregated_reasons
        from {{ ref('dim_salesreason') }}
    ),

    intermediate_orders as (
        select
            pk_orders
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
        from {{ ref('dim_orders') }}
    ),

    joined_intermediate as (
        select
            ID_order
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
            ,aggregated_reasons
        from intermediate_orders
        left join intermediate_sales_reason on intermediate_orders.ID_order = intermediate_sales_reason.ID_reason_order

    ),

    primary_key_atribution_transformation as (
        select
            row_number() over (order by ID_order, ID_order_detail) as ID_sales
            , *
        from joined_intermediate
    )
    
select *
from primary_key_atribution_transformation
order by ID_sales asc