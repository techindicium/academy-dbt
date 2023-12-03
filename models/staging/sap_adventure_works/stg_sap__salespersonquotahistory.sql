with
    fonte_salespersonquotahistory as (
        select
            cast(businessentityid as int) as businessentityid
            , cast(quotadate as timestamp) as quotadate
            , cast(salesquota as int) as salesquota
            , cast(rowguid as string) as rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'salespersonquotahistory') }}
    )

select *
from fonte_salespersonquotahistory