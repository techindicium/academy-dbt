with
    fonte_currency as (
        select
            cast(currencycode as string) as currencycode
            , cast(name as string) as name
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'currency') }}
    )

select *
from fonte_currency