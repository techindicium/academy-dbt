with 
    source_pedidos as (
        select 
            cast(salesorderid as int) as pedido_id
            , cast(cast(orderdate as datetime) as date) as data_pedido
            , cast(status as int) as status_pedido
            , cast(customerid as int) as cliente_id
            , cast(creditcardid as int) as cartao_id
            , cast(territoryid as int) as regiao_id
            , cast(subtotal as numeric) as total_pedido
        from 
            {{ source('sap_adw', 'salesorderheader') }}
    ),

    enriched as (
        select
            source_pedidos.pedido_id
            , source_pedidos.data_pedido
            , extract(year from data_pedido) as ano_pedido
            , extract(month from data_pedido) as mes_pedido
            , extract(day from data_pedido) as dia_pedido
            , source_pedidos.status_pedido
            , source_pedidos.cliente_id
            , source_pedidos.cartao_id
            , source_pedidos.regiao_id
            , source_pedidos.total_pedido
        from
            source_pedidos
    )

select * from enriched