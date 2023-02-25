with    
    pedido_motivo_venda as (
        select
            *
        from
            {{ ref('stg_sap__pedido_motivo_venda') }}
    ),

    motivo_venda as (
        select
            *
        from
            {{ ref('stg_sap__motivo_venda') }}
    ),

    joined as (
        select
            pedido_motivo_venda.pedido_id,
            motivo_venda.motivador,
            motivo_venda.categoria
        from
            pedido_motivo_venda
        left join motivo_venda on
            pedido_motivo_venda.motivo_venda_id = motivo_venda.motivo_venda_id
    )

select * from joined