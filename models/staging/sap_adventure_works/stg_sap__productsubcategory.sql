with
    fonte_productsubcategory as (
        select *
        from {{ source('sap_adventure_works', 'productsubcategory') }}
    )

select *
from fonte_productsubcategory