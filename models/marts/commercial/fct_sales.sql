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
        select *
        from {{ ref('dim_credit_card') }}
    )

    , int_location as (
        select *
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
            , dim_salesperson.id_sales_person
            , dim_salesperson.id_nacional_number
            , dim_salesperson.full_name as name_full_sales_person
            , case 
                when dim_salesperson.person_type is null then 'Online'
                else 'Presencial'
                end as Canal
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
            , dim_products.standard_cost
            , dim_products.price_list
            , dim_products.number_size
            , dim_products.unit_mesure
            , dim_products.weigh_unit_mensure
            , dim_products.weight
            , dim_products.product_line
            , dim_products.class
            , dim_products.style
            , dim_products.start_sell_date
            , dim_products.end_sell_date
            , dim_products.name_sub_category
            , dim_products.name_category
            , dim_customer.id_customer
            , dim_customer.id_person
            , dim_customer.full_name as name_full_customer
            , dim_credit_card.id_credit_card
            , dim_credit_card.card_type
            , dim_credit_card.expired_year
            , dim_credit_card.expired_month
            , int_location.country_name as country_name_billing
            , int_location.id_address as id_address_billing
            , int_location.city as city_billing
            , int_location.address_line_1 as address_line_1_billing
            , int_location.postal_code as postal_code_billing
            , int_location.id_state_province as id_state_province_billing
            , int_location.state_name as state_name_billing
            , int_location.state_province_code as state_province_code_billing
        from int_sales
        left join dim_sales_territory
            on int_sales.id_territory = dim_sales_territory.id_territory
        left join dim_salesperson
            on int_sales.id_sales_person = dim_salesperson.id_sales_person
        left join dim_reason
            on int_sales.id_sales_reason = dim_reason.id_sales_reason
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
        select
            *
            , (unit_price*order_qty/sub_total) * (tax_amount + freight) as cost_freight_proporcion-- proporção entre frete para cada venda
            , unit_price * order_qty as gross_total_amount
            , (unit_price * order_qty)- (standard_cost+(unit_price*order_qty/sub_total) * (tax_amount + freight)) as net_value
            , ((1-unit_price_discount)* unit_price * order_qty)  as discount 
            , cast((date_diff(order_date, hire_date, day)/365) as numeric) as tempo_de_casa
            , cast((date_diff(order_date, birth_date, day)/365) as numeric) as senioridade
        from joined_dimensions
    )

select *
from transformed