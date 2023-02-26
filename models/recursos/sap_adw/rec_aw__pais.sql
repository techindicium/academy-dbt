with
    source_countryregion as(
        select
            cast(countryregioncode as string) as codigo_pais
            , cast(name as string) as pais
            --, modifieddate
        from {{ source('aw', 'countryregion') }}
    )

select *
from source_countryregion