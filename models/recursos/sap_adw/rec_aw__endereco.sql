with
    source_address as(
        select
            cast(addressid as int) as id_endereco
            , cast(stateprovinceid as int) as id_estado
            --, addressline1
            --, addressline2
            , cast(city as string) cidade
            --, postalcode
            --, spatiallocation
            --, rowguid
            --, modifieddate
        from {{ source('aw', 'address') }}
    )

select *
from source_address