with
    fonte_creditcard as (
        select
            cast(creditcardid as int) as creditcardid
            , cast(cardtype as string) as cardtype
            , cast(cardnumber as bigint) as cardnumber
            , cast(expmonth as int) as expmonth
            , cast(expyear as int) as expyear
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'creditcard') }}
    )

select *
from fonte_creditcard