with
    endereco_pessoa as (
        select
            -- ids
            addressid as id_endereco
            , stateprovinceid as id_estado
            -- outros
            , addressline1 as endereco
            , city as cidade
        from{{ source('person','address')}}
    )

select *
from endereco_pessoa
