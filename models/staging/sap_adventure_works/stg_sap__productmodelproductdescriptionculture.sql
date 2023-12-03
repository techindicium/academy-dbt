with
    fonte_productmodelproductdescriptionculture as (
        select *
        from {{ source('sap_adventure_works', 'productmodelproductdescriptionculture') }}
    )

select *
from fonte_productmodelproductdescriptionculture