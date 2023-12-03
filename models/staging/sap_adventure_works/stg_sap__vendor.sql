with
    fonte_vendor as (
        select
            cast(businessentityid as int) as businessentityid
            , cast(accountnumber as string) as accountnumber
            , cast(name as string) as name
            , cast(creditrating as int) as creditrating
            , cast(preferredvendorstatus as bool) as preferredvendorstatus
            , cast(activeflag as bool) as activeflag
            , cast(purchasingwebserviceurl as string) as purchasingwebserviceurl
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'vendor') }}
    )

select *
from fonte_vendor