with
    fonte_shoppingcartitem as (
        select
            cast(shoppingcartitemid as int) as shoppingcartitemid
            , cast(shoppingcartid as int) as shoppingcartid
            , cast(quantity as int) as quantity
            , cast(productid as int) as productid
            , cast(datecreated as timestamp) as datecreated
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'shoppingcartitem') }}
    )

select *
from fonte_shoppingcartitem