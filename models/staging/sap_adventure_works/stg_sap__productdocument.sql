with
    fonte_productdocument as (
        select *
        from {{ source('sap_adventure_works', 'productdocument') }}
    )

select *
from fonte_productdocument