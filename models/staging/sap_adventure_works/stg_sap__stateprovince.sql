with
    fonte_stateprovince as (
        select
            cast(stateprovinceid as int) as stateprovinceid
            , cast(stateprovincecode as string) as stateprovincecode
            , cast(countryregioncode as string) as countryregioncode
            , cast(isonlystateprovinceflag as bool) as isonlystateprovinceflag
            , cast(name as string) as name
            , cast(territoryid as int) as territoryid
            , cast(rowguid as string) as rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'stateprovince') }}
    )

select *
from fonte_stateprovince