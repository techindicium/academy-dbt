with
    fonte_store as (
        select
            cast(businessentityid as int) as businessentityid
            , cast(name as string) as name
            , cast(salespersonid as int) as salespersonid
            --, cast(demographics as string) as demographics
            , cast(rowguid as string) as rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'store') }}
    )

select *
from fonte_store