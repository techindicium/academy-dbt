with
    vendas_territorio as(
        select
            -- ids
            territoryid as id_territorio
            -- nomes
            , name as nm_pais
            , t.group as nm_continente
            -- códigos
            , countryregioncode as cd_pais
            -- valores
            , salesytd as vr_venda_ytd
            , saleslastyear as vr_venda_ano_passado
        from{{ source('sales','salesterritory')}} t
    )

select *
from vendas_territorio
