with
    fonte_businessentity as (
        select
            cast(businessentityid as int) as businessentityid
            , cast(rowguid as string) as rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'businessentity') }}
    )

select *
from fonte_businessentity