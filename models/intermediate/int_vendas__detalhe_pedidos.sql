with 
    pedidos as (
        select *
        from {{ ref('stg_sap__pedidos') }}
    ),

    detalhe_pedidos as (
        select *
        from {{ ref('stg_sap__detalhe_pedidos') }}
    ),

    joined as (
        select 
            pedidos.pedido_id
            , pedidos.status_pedido
            , pedidos.data_pedido
            , pedidos.ano_pedido
            , pedidos.mes_pedido
            , pedidos.dia_pedido
            , pedidos.cliente_id
            , pedidos.regiao_id
            , pedidos.total_pedido
            , pedidos.cartao_id
            , detalhe_pedidos.detalhe_pedido_id
            , detalhe_pedidos.produto_id
            , detalhe_pedidos.preco_unitario
            , detalhe_pedidos.quantidade
        from pedidos
        left join detalhe_pedidos on 
            pedidos.pedido_id = detalhe_pedidos.pedido_id
    )
select * from joined