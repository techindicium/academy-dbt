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
            , card_number
            , modified_date
        from {{ ref('dim_credit_card') }}
    )
    
    , joined_dimensions as (
        select 
            joined_order_details.id_sales_order
            , joined_order_details.id_ship_to_address
            , joined_order_details.id_ship_method
            , joined_order_details.id_currency_rate
            , joined_order_details.id_sales_order_detail
            , joined_order_details.id_special_offer
            , reason.id_sales_reason
            , person.id_business_entity
            , person.id_nacional_number
            , products.id_product_sub_category
            , products.id_product_category
            , location.id_address
            , location.id_state_province
            , location.id_territory
            , customer.id_customer
            , customer.id_person
            , customer.id_store
            , products.id_product
            , products.id_product_model
            , credit_card.id_credit_card
            , joined_order_details.order_qty
            , joined_order_details.unit_price
            , joined_order_details.unit_price_discount
            , joined_order_details.sub_total
            , joined_order_details.purchase_order_number
            , joined_order_details.revision_number
            , joined_order_details.tax_amount
            , joined_order_details.freight
            , joined_order_details.total_due
            , joined_order_details.status
            , joined_order_details.online_order_flag
            , joined_order_details.order_date
            , joined_order_details.due_date
            , joined_order_details.ship_date
            , joined_order_details.account_number
            , joined_order_details.creditcar_dappoval_code
            , joined_order_details.comment
            , joined_order_details.modified_date
            , person.sales_quota
            , person.bonus
            , person.commission_pct
            , person.sales_ytd
            , person.sales_last_year
            , person.row_guid
            , person.first_name
            , person.last_name
            , person.full_name
            , person.person_type
            , person.birth_date
            , person.hire_date
            , person.salaried_flag
            , person.sick_leave_hours
            , person.current_flag
            , person.vacation_hours
            , person.gender
            , reason.reason_name
            , reason.reason_type
            , products.name_product
            , products.number_product
            , products.make_flag
            , products.finished_goods_flag
            , products.color
            , products.safety_stock_level
            , products.reorder_point
            , products.standard_cost
            , products.price_list
            , products.number_size
            , products.unit_mesure
            , products.weigh_unit_mensure
            , products.weight
            , products.days_to_manufacture
            , products.product_line
            , products.class
            , products.style
            , products.start_sell_date
            , products.end_sell_date
            , products.name_sub_category
            , products.name_category
            , location.city
            , location.address_line_1
            , location.postal_code
            , location.spatial_location
            , location.state_name
            , location.is_only_state_province_flag
            , location.state_province_code
            , location.country_region_code
            , location.country_name
            , customer.store_name
            , customer.title
            , credit_card.card_type
            , credit_card.expired_year
            , credit_card.expired_month
        from joined_order_details
        left join territory on joined_order_details.id_territory = territory.id_territory
        left join person on joined_order_details.id_territory = person.id_territory
        left join reason on joined_order_details.id_sales_order = reason.id_sales_order
        left join products on joined_order_details.id_product = products.id_product
        left join customer on joined_order_details.id_customer = customer.id_customer
        left join credit_card  on joined_order_details.id_credit_card = credit_card.id_credit_card
    )
    
    , transformed as (
        select *
            , unit_price * order_qty as gross_total_amount
            , (1-unit_price_discount)* unit_price * order_qty as net_value
        from joined
    )

select *
from transformed