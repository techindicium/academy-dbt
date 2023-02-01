with
    sales_header as (
        select *
        from {{ ref('stg_sap__sales_order_header') }}
    )

    , sales_detail as (
        select *
        from {{ ref('stg_sap__sales_order_detail') }}
    )

    , special_offer as (
        select *
        from {{ ref('stg_sap__special_offer') }}
    )

    , sales_data_joined as (
        select
            sales_header.id_sales_order
            , sales_detail.id_sales_order_detail
            , sales_detail.id_product
            , sales_header.id_customer
            , sales_header.id_territory
            , sales_header.id_bill_to_address
            , sales_header.id_ship_to_address
            , sales_header.id_ship_method
            , sales_header.id_credit_card
            , sales_header.id_currency_rate
            , sales_header.sub_total
            , sales_header.total_due
            , sales_header.tax_amount
            , sales_header.freight
            , sales_detail.order_qty
            , sales_detail.unit_price
            , sales_detail.unit_price_discount
            , sales_header.order_date
            , sales_header.ship_date
            , sales_header.due_date
            , sales_header.status
            , sales_header.online_order_flag
            , discount_category
            , discount_type
        from sales_header
        inner join sales_detail
            on sales_header.id_sales_order = sales_detail.id_sales_order
        inner join special_offer as discount
            on sales_detail.id_special_offer = discount.id_special_offer
            and sales_header.order_date between discount.discount_start_date and discount.discount_end_date
            and sales_detail.order_qty between discount.min_qty_for_discount and coalesce(discount.max_qty_for_discount, 9999999)
    )

select *
from sales_data_joined
