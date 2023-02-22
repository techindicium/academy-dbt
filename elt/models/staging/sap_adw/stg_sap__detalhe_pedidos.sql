with 
    source_detalhe_pedidos as (
        select 
            cast(salesorderid as int) as pedido_id
            , cast(salesorderdetailid as int) as detalhe_pedido_id
            , cast(productid as int) as produto_id
            , cast(unitprice as numeric) as preco_unitario
            , cast(orderqty as int) as quantidade
        from 
            {{ source('sap_adw', 'salesorderdetail') }}
    )

select * from source_detalhe_pedidos