with
    fonte_salesterritory as (
        select
            cast(territoryid as int) as territoryid
            , cast(name as string) as name
            , cast(countryregioncode as string) as countryregioncode
            , cast(salesterritory.group as string) as groupcolumn
            , cast(salesytd as decimal) as salesytd
            , cast(saleslastyear as decimal) as saleslastyear
            , cast(costytd as int) as costytd
            , cast(costlastyear as int) as costlastyear
            , cast(rowguid as string) as rowguid
            , cast(modifieddate as timestamp) as modifieddate
        from {{ source('sap_adventure_works', 'salesterritory') }}
    )

select *
from fonte_salesterritory