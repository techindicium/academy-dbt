with 
    dados_venda as (
        select
            -- ids
            salesorderid as id_pedido
            , customerid as id_cliente
            , salespersonid as id_vendedor
            , territoryid as id_territorio
            , billtoaddressid as id_endereco_cobranca
            , shiptoaddressid as id_endereco_entrega
            , creditcardid as id_cartao_credito
            -- datas
            , date(orderdate) as dt_pedido
            , date(duedate) as dt_devida_entrega
            , date(shipdate) as dt_envio
            -- flags e outros
            , status as st_pedido
            , onlineorderflag as fl_pedido_online
            -- valores
            , subtotal as vr_subtotal
            , taxamt as vr_imposto
            , freight as vr_frete
            , totaldue as vr_total_devido
            -- origem
            ,  'sales' as nm_origem
        from {{ source('sales', 'salesorderheader')}}
    )

select *
from dados_venda
