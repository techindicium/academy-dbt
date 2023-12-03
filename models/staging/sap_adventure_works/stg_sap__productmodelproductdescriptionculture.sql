with
    fonte_productmodelproductdescriptionculture as (
        select
            cast(productmodelid as int) as productmodelid  
            , cast(productdescriptionid as int) as productdescriptionid    
            , cast(cultureid as string) as cultureid   
            , cast(modifieddate as timestamp) as modifieddate    
        from {{ source('sap_adventure_works', 'productmodelproductdescriptionculture') }}
    )

select *
from fonte_productmodelproductdescriptionculture