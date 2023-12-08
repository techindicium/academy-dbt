with
    fonte_specialofferproduct as (
        select
            cast(specialofferid as int) as specialofferid
            , cast(productid as int) as productid
            , cast(rowguid as string) as rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'specialofferproduct') }}
    )

select *
from fonte_specialofferproduct