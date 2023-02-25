with
    source_countryregion as(
        select
            countryregioncode as codigo_pais
            , name as pais
            --, modifieddate
        from {{ source('aw', 'countryregion') }}
    )

select *
from source_countryregion