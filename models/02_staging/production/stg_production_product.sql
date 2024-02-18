with
    produto as(
        select
            -- ids
            productid as id_produto
            , productsubcategoryid as id_subcategoria_produto
            -- nomes
            , name as nm_produto
            -- códigos
            , productnumber as cd_produto
            -- flags
            , makeflag as fl_tipo_producao
            -- outros
            , color as cor_produto
            , safetystocklevel as nivel_seguro_estoque
            , reorderpoint as nivel_recompra_estoque
            , size as tamanho_produto
            , productline as linha_produto
            , style as estilo_produto
            -- valores
            , standardcost as vr_preco_padrao
            , listprice as vr_venda_produto
        from{{ source('production','product')}}
    )

select *
from produto
