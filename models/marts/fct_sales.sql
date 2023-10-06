with 
    fact_sales as (
        select
            ID_sales
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
            ,quantity * unit_price as totalsaled
            ,unit_price_discount
            ,total_due
            ,freight
            ,order_status
            ,aggregated_reasons
        from {{ ref('int_salescustomerorders') }}
    )

select *
from fact_sales
