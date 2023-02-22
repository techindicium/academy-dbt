with 
    source_produtos as (
        select
            cast(productid as int) as produto_id
            , cast(name as string) as nome_produto
        from 
            {{ source('sap_adw', 'product') }}
    )

select * from source_produtos