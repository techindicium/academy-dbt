with
    cartao_credito as(
        select
            -- ids
            creditcardid as id_cartao_credito
            -- nomes
            , cardtype as nm_cartao_credito
        from{{ source('sales','creditcard')}}
    )

select *
from cartao_credito
