with
    source_special_offer_product as (
        select
            cast(specialofferid as int) as id_special_offer
            , cast(productid as string) as id_product
        from {{ source('adw', 'specialofferproduct') }}     
    )

select *
from source_special_offer_product
