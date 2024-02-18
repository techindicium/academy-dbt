with
    subcategoria_produto as(
        select
            -- ids
            productsubcategoryid as id_subcategoria_produto
            , productcategoryid as id_categoria_produto
            -- nomes
            , name as nm_subcategoria_produto
        from{{ source('production','productsubcategory')}}
    )

select *
from subcategoria_produto
