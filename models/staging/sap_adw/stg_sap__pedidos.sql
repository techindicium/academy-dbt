with 
    source_pedidos as (
        select 
            cast(salesorderid as int) as pedido_id
            , cast(orderdate as datetime) as data_pedido
            , cast(customerid as int) as cliente_id
            , cast(territoryid as int) as regiao_id
            , cast(subtotal as numeric) as total_pedido
        from 
            {{ source('sap_adw', 'salesorderheader') }}
    )

select * from source_pedidos