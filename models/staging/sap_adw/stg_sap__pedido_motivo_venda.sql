with 
    pedido_motivo_venda as (
        select 
            cast(salesorderid as int) as pedido_id
            , cast(salesreasonid as int) as motivo_venda_id
            , cast(modifieddate as datetime) as data_modificacao
        from
            {{ source('sap_adw', 'salesorderheadersalesreason') }}
    )
select * from pedido_motivo_venda