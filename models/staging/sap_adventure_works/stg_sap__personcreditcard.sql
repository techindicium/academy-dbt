with
    fonte_personcreditcard as (
        select
            cast(businessentityid as int) as businessentityid
            , cast(creditcardid as int) as creditcardid
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'personcreditcard') }}
    )

select *
from fonte_personcreditcard