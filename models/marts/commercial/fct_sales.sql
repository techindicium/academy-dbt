with
    territory as (
        select *
        from {{ ref('dim_sales_territory') }}
    )
    , person as (
        select *
        from {{ ref('dim_sales_person') }}
    )
    , reason as (
        select *
        from {{ ref('dim_reason') }}
    )
    
    , products as (
        select *
        from {{ ref('dim_products') }}
    )

    , location as (
        select *
        from {{ ref('dim_location') }}
    )

    , customer as (
        select *
        from {{ ref('dim_customer') }}
    )

    , credit_card as (
        select *
        from {{ ref('dim_credit_card') }}
    )

    , order_detail as (
        select 
            id_sales_order
            , id_product
            , id_sales_order_detail
            , id_special_offer
            , order_qty
            , unit_price
            , unit_price_discount
            , row_guid
            , modified_date
        from {{ ref('stg_sap__sales_order_detail') }}
    )

    , order_head as (
        select 
          id_sales_order
          , id_customer
          , id_sales_person
          , id_territory
          , id_bill_to_address
          , id_ship_to_address
          , id_ship_method
          , id_credit_card
          , id_currency_rate
          , revision_number
          , order_date
          , due_date
          , ship_date
          , status
          , online_order_flag
          , purchase_order_number
          , account_number
          , creditcar_dappoval_code
          , sub_total
          , taxamt
          , freight
          , total_due
          , comment
          , row_guid
          , modified_date
        from {{ ref('stg_sap__sales_order_head') }}
    )
    
    , joined_order_details as (
        select
            order_head.id_sales_order
            , order_head.id_customer
            , order_head.id_sales_person
            , order_head.id_territory
            , order_head.id_bill_to_address
            , order_head.id_ship_to_address
            , order_head.id_ship_method
            , order_head.id_credit_card
            , order_head.id_currency_rate
            , order_detail.id_product
            , order_detail.id_sales_order_detail
            , order_detail.id_special_offer
            , order_detail.order_qty
            , order_detail.unit_price
            , order_detail.unit_price_discount
            , order_head.sub_total
            , order_head.purchase_order_number
            , order_head.revision_number
            , order_head.taxamt
            , order_head.freight
            , order_head.total_due
            , order_head.status
            , order_head.online_order_flag
            , order_head.order_date
            , order_head.due_date
            , order_head.ship_date
            , order_head.account_number
            , order_head.creditcar_dappoval_code
            , order_head.comment
            , order_head.row_guid
            , order_head.modified_date

        from order_head
        left join order_detail on order_head.id_sales_order = order_detail.id_sales_order
    ) 

    , joined as (
        select 
            order_head.id_sales_order
            , order_head.id_sales_person
            , order_head.id_ship_to_address
            , order_head.id_ship_method
            , order_head.id_currency_rate
            , order_detail.id_sales_order_detail
            , order_detail.id_special_offer
            , reason.id_sales_reason
            , person.id_business_entity
            , person.id_nacional_number
            , products.id_product_sub_category
            , products.id_product_category
            , location_id_address
            , location_id_state_province
            , location_id_territory
            , customer.id_customer
            , customer.id_person
            , customer.id_store
            , products.id_product
            , products.id_product_model
            , credit_card.id_credit_card
            , order_detail.order_qty
            , order_detail.unit_price
            , order_detail.unit_price_discount
            , order_head.sub_total
            , order_head.purchase_order_number
            , order_head.revision_number
            , order_head.taxamt
            , order_head.freight
            , order_head.total_due
            , order_head.status
            , order_head.online_order_flag
            , order_head.order_date
            , order_head.due_date
            , order_head.ship_date
            , order_head.account_number
            , order_head.creditcar_dappoval_code
            , order_head.comment
            , order_head.row_guid
            , order_head.modified_date
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
            , reason.modified_date
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
            , location_city
            , location_address_line_1
            , location_postal_code
            , location_spatial_location
            , location_state_name
            , location_is_only_state_province_flag
            , location_state_province_code
            , location_country_region_code
            , location_row_guid
            , location_country_name
            , customer.store_name
            , customer.title
            , credit_card.card_type
            , credit_card.expired_year
            , credit_card.expired_month
            
        from joined_order_details
        left join territory on joined_order_details.id_territory = territory.id_territory
        left join person on joined_order_details.row_guid = person.row_guid
        left join reason on joined_order_details.id_sales_order = reason.id_sales_order
        left join products on joined_order_details.id_product = products.id_product
        left join location on joined_order_details.id_territory = location.id_territory
        left join customer on joined_order_details.id_customer = customer.id_customer
        left join credit_card  on joined_order_details.id_credit_card = credit_card.id_credit_card
    )

select*
from joined