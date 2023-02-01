with
    int_sales as (
        select *
        from {{ ref('int__fact_sales_preparation') }}
    )
    , dim_sales_territory as (
        select *
        from {{ ref('dim_sales_territory') }}
    )
    , dim_salesperson as (
        select *
        from {{ ref('dim_sales_person') }}
    )
    , dim_reason as (
        select *
        from {{ ref('dim_reason') }}
    )
    , dim_products as (
        select *
        from {{ ref('dim_products') }}
    )
    , dim_customer as (
        select *
        from {{ ref('dim_customer') }}
    )
    , dim_credit_card as (
        select
            id_credit_card
            , card_type
            , expired_year
            , expired_month
        from {{ ref('dim_credit_card') }}
    )

    , int_location as (

    )
    
    , joined_dimensions as (
        select
            int_sales.id_sales_order
            , int_sales.id_sales_order_detail
            , int_sales.id_territory
            , int_sales.id_sales_person
            , dim_reason.id_sales_reason
            , int_sales.id_product
            , int_sales.id_customer
            , int_sales.id_credit_card

            , int_sales.

            , dim_sales_territory.

            , dim_salesperson.

            , dim_reason.

            , dim_products.

            , dim_customer.

            , dim_credit_card.

            , int_location.
            
        from int_sales
        left join dim_sales_territory
            on int_sales.id_territory = dim_sales_territory.id_territory
        left join dim_salesperson
            on int_sales.id_sales_person = dim_salesperson.id_sales_person
        left join dim_reason
            on int_sales.id_sales_order = dim_reason.id_sales_order
        left join dim_products
            on int_sales.id_product = dim_products.id_product
        left join dim_customer
            on int_sales.id_customer = dim_customer.id_customer
        left join dim_credit_card 
            on int_sales.id_credit_card = dim_credit_card.id_credit_card
        left join int_location
            on int_sales.id_bill_to_address = int_location.id_address

    )
    
    , transformed as (
        select *
            , unit_price * order_qty as gross_total_amount
            , (1-unit_price_discount)* unit_price * order_qty as net_value
            --, (order_date - hire_date)/365 as tempo_de_casa
            --, (order_date - birth_date)/365 as quanto_macaco_velho
        from joined
    )

select *
from transformed