with
    source_address as(
        select
            addressid as id_endereco
            , stateprovinceid as id_estado
            --, addressline1
            --, addressline2
            , city as cidade
            --, postalcode
            --, spatiallocation
            --, rowguid
            --, modifieddate
        from {{ source('aw', 'address') }}
    )

select *
from source_address