with
    fonte_countryregioncurrency as (
        select
            cast(countryregioncode as string) as countryregioncode
            , cast(currencycode as string) as currencycode
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'countryregioncurrency') }}
    )

select *
from fonte_countryregioncurrency