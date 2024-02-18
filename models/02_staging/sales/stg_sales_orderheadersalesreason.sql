with
    cabecalho_motivos_venda as(
        select
            -- ids
            salesorderid as id_pedido
            , salesreasonid as id_motivo_venda
        from{{ source('sales','salesorderheadersalesreason')}}
    )

select *
from cabecalho_motivos_venda
