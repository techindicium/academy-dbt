with
    categoria_produto as(
        select
            -- ids
            productcategoryid as id_categoria_produto
            -- nomes
            , name as nm_categoria_produto
        from{{ source('production','productcategory')}}
    )

select *
from categoria_produto
