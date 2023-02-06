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
        select
            id_address
            , city
            , address_line_1
            , address_line_2
            , postal_code
            , id_state_province
            , id_territory
            , state_name
            , state_province_code
            , country_region_code
        from {{ ref('int__location_joined') }}
    )
    
    , joined_dimensions as (
        select
            int_sales.id_sales_order
            , int_sales.id_sales_order_detail
            , int_sales.id_territory
            , dim_reason.id_sales_reason
            , int_sales.id_currency_rate
            , int_sales.sub_total
            , int_sales.total_due
            , int_sales.tax_amount
            , int_sales.freight
            , int_sales.order_qty
            , int_sales.unit_price
            , int_sales.unit_price_discount
            , int_sales.order_date
            , int_sales.ship_date
            , int_sales.due_date
            , int_sales.status
            , int_sales.discount_category
            , int_sales.discount_type
            , dim_sales_territory.name_territory
            , dim_sales_territory.country_region_code
            , dim_sales_territory.group_territory
            , dim_sales_territory.sale_sytd
            , dim_sales_territory.cost_ytd
            , dim_sales_territory.cost_last_year
            , dim_salesperson.id_business_entity
            , dim_salesperson.id_nacional_number
            , dim_salesperson.full_name as name_full_sales_person
            , dim_salesperson.person_type
            , dim_salesperson.birth_date
            , dim_salesperson.hire_date
            , dim_salesperson.salaried_flag
            , dim_salesperson.sick_leave_hours
            , dim_salesperson.current_flag
            , dim_salesperson.gender
            , dim_salesperson.marital_status
            , dim_reason.reason_name
            , dim_reason.reason_type
            , dim_products.id_product
            , dim_products.id_product_model
            , dim_products.name_product
            , dim_products.number_product
            , dim_products.make_flag
            , dim_products.finished_goods_flag
            , dim_products.color
            , dim_products.safety_stock_level
            , dim_products.reorder_point
            , dim_products.standard_cost
            , dim_products.price_list
            , dim_products.number_size
            , dim_products.unit_mesure
            , dim_products.weigh_unit_mensure
            , dim_products.weight
            , dim_products.days_to_manufacture
            , dim_products.product_line
            , dim_products.class
            , dim_products.style
            , dim_products.start_sell_date
            , dim_products.end_sell_date
            , dim_products.id_product_sub_category
            , dim_products.id_product_category
            , dim_products.name_sub_category
            , dim_products.name_category
            , dim_customer.id_customer
            , dim_customer.id_person
            , dim_customer.id_store
            , dim_customer.store_name
            , dim_customer.title
            , dim_customer.full_name as name_full_customer
            , dim_credit_card.id_credit_card
            , dim_credit_card.card_type
            , dim_credit_card.expired_year
            , dim_credit_card.expired_month
            , int_location.id_address
            , int_location.city
            , int_location.address_line_1
            , int_location.postal_code
            , int_location.id_state_province
            , int_location.state_name
            , int_location.state_province_code
        from int_sales
        left join dim_sales_territory
            on int_sales.id_territory = dim_sales_territory.id_territory
        left join dim_salesperson
            on int_sales.id_territory = dim_salesperson.id_territory
        left join dim_reason
            on int_sales.id_sales_order = dim_reason.id_sales_order
        left join dim_products
            on int_sales.id_product = dim_products.id_product
        left join dim_customer
            on int_sales.id_customer = dim_customer.id_customer
        left join dim_credit_card 
            on int_sales.id_credit_card = dim_credit_card.id_credit_card
        left join int_location
            on int_sales.id_territory = int_location.id_territory
    )
    
    , transformed as (
        select *
            , unit_price * order_qty as gross_total_amount
            , (1-unit_price_discount)* unit_price * order_qty as net_value
            , (order_date - hire_date)/365 as tempo_de_casa
            , (order_date - birth_date)/365 as senioridade
        from joined_dimensions
    )

select *
from transformed