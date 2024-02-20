with
    source_special_offer as (
        select
            cast(specialofferid as int) as id_special_offer
            , cast(discountpct as numeric) as discount_pct
            , cast(type as string) as discount_type
            , cast(category as string) as discount_category
            , cast(minqty as int) as min_qty_for_discount
            , cast(maxqty as int) as max_qty_for_discount
            , cast(left(cast(startdate as string), 10) as date) as discount_start_date
            , cast(left(cast(enddate as string), 10) as date) as discount_end_date
        from {{ source('adw', 'specialoffer') }}
    )

select *
from source_special_offer