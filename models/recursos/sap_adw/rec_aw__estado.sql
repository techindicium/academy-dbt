with
    source_stateprovince as(
        select
            stateprovinceid as id_estado
            --, territoryid
            --, stateprovincecode
            , countryregioncode as codigo_pais
            --, isonlystateprovinceflag
            , name as estado
            --, rowguid
            --, modifieddate
        from {{ source('aw', 'stateprovince') }}
    )

select *
from source_stateprovince