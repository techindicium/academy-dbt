with
    source_product_vendor as (
        select
            cast(productid as int) as id_product
            , cast(businessentityid as int) as id_business_entity
            , cast(averageleadtime as int) as average_lead_time
            , cast(standardprice as int) as standard_price
            , cast(lastreceiptcost as int) as last_receipt_cost
            , cast(left(cast(lastreceiptdate as string), 10) as date) as last_receipt_date
            , cast(minorderqty as int) as min_order_qty
            , cast(maxorderqty as int) as max_order_qty
            , cast(onorderqty as int) as on_order_qty
            , cast(unitmeasurecode as string) as unit_measure_code
            , cast(left(cast(modifieddate as string), 10) as date) as modified_date
        from {{source('adw', 'productvendor' )}}
    )
select *
from source_product_vendor