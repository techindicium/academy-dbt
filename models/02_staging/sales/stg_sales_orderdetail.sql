with
    detalhes_venda as (
        select
            -- ids
            salesorderid as id_pedido
            , productid as id_produto
            , salesorderdetailid as id_detalhes_pedido
            -- quantidades
            , orderqty as qt_encomendada_produto
            -- valores
            , unitprice as vr_produto
            , unitpricediscount as vr_desconto
            -- origem
            , 'sales' as nm_origem
        from {{ source('sales','salesorderdetail')}}
    )

select *
from detalhes_venda
