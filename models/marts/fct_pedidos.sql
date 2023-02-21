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
            , pedidos.data_pedido
            , pedidos.cliente_id
            , pedidos.vendedor_id
            , pedidos.regiao_id
            , pedidos.total_pedido
            , detalhe_pedidos.detalhe_pedido_id
            , detalhe_pedidos.produto_id
            , detalhe_pedidos.preco_unitario
            , detalhe_pedidos.quantidade
        from pedidos
        left join detalhe_pedidos on 
            pedidos.pedido_id = detalhe_pedidos.pedido_id
    )

select * from joined