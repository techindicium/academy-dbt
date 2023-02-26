with
    address as (
        select *
        from {{ ref('rec_aw__endereco') }}
    )

    , stateprovince as (
        select *
        from {{ ref('rec_aw__estado') }}
    )

    , countryregion as (
        select *
        from {{ ref('rec_aw__pais') }}
    )

    , uniao_tabelas as (
        select 
            address.id_endereco
            , address.cidade
            , stateprovince.id_estado
            , stateprovince.estado
            , countryregion.codigo_pais
            , countryregion.pais
        from stateprovince
        left join countryregion on stateprovince.codigo_pais = countryregion.codigo_pais
        left join address on stateprovince.id_estado = address.id_estado
    )

    , transformacoes as (
        select
            row_number() over (order by id_endereco) as pk_endereco
            , *
        from uniao_tabelas
    )

select *
from transformacoes