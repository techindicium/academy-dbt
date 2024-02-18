with
    pais_regioes as (
        select
            -- códigos
            countryregioncode as cd_pais
            -- nomes
            , name as nm_pais
        from{{ source('person','countryregion')}}
    )

select *
from pais_regioes
