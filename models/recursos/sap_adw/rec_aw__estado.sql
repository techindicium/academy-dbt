with
    source_stateprovince as(
        select
            cast(stateprovinceid as int) as id_estado
            --, territoryid
            --, stateprovincecode
            , cast(countryregioncode as string) as codigo_pais
            --, isonlystateprovinceflag
            , cast(name as string) as estado
            --, rowguid
            --, modifieddate
        from {{ source('aw', 'stateprovince') }}
    )

select *
from source_stateprovince