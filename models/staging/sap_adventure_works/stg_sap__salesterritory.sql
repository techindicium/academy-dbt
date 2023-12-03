with
    fonte_salesterritory as (
        select
            cast(territoryid as int) as territoryid
            , cast(name as string) as name
            , cast(countryregioncode as string) as countryregioncode
            , cast(group as string) as group
            , cast(salesytd as float) as salesytd
            , cast(saleslastyear as float) as saleslastyear
            , cast(costytd as int) as costytd
            , cast(costlastyear as int) as costlastyear
            , cast(rowguid as string) as rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'salesterritory') }}
    )

select *
from fonte_salesterritory