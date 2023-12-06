with
    fonte_employeepayhistory as (
        select
            cast(businessentityid as int) as businessentityid
            , cast(ratechangedate as timestamp) as ratechangedate
            , cast(rate as decimal) as rate
            , cast(payfrequency as int) as payfrequency
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'employeepayhistory') }}
    )

select *
from fonte_employeepayhistory