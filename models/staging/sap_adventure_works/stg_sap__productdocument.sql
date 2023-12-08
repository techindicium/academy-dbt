with
    fonte_productdocument as (
        select
            cast(productid as int) as productid
            , cast(modifieddate as timestamp) as modifieddate
            --, cast(documentnode as string) as documentnode
        from {{ source('sap_adventure_works', 'productdocument') }}
    )

select *
from fonte_productdocument