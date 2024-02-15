with
    sales_order_detail as (
        select *
        from {{ ref('stg_adw_sales_order_details') }}
    )

    , sales_order_header as (
        select *
        from {{ ref('stg_adw_sales_order_header') }}
    )
 
    , fact_table as (
        select 
            sales_order_detail.sales_order_id
            , sales_order_detail.sales_order_detail_id
            , sales_order_detail.product_id
            , sales_order_header.customer_id
            , sales_order_header.territory_id
            , sales_order_header.bill_to_address_id
            , sales_order_header.sales_person_id
            , sales_order_header.credit_card_id
            
            , sales_order_detail.order_qty
            , sales_order_detail.unit_price
            , sales_order_detail.unit_price_discount

            , sales_order_header.ship_date
            , sales_order_header.due_date
            , sales_order_header.order_date
            , sales_order_header.order_status
            , sales_order_header.sub_total
            , sales_order_header.online_order_flag
            , sales_order_header.tax_amt
            , sales_order_header.total_due
            , sales_order_header.freight

        from sales_order_detail
        left join sales_order_header
            on sales_order_detail.sales_order_id = sales_order_header.sales_order_id
    )

select *
from fact_table