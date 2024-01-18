-- CTE com dados do cartão de crédito
with dim_creditcard as (
    select 
        row_number() over (order by sales_order_header.creditcardid) as creditcard_key  -- Gera um número sequencial para cada linha (Para criar uma chave-primária)
        , sales_order_header.creditcardid 
        , credit_card.cardtype 
    from (
        select 
            distinct creditcardid -- Seleciona valores distintos da coluna creditcardid
        from {{ ref('stg_sales_order_header') }} -- Referência à tabela stg_sales_order_header
        where creditcardid is not null -- Filtra apenas os valores não nulos da coluna creditcardid da stg_sales_order_header
    ) as sales_order_header
    left join {{ ref('stg_creditcard') }} as credit_card on sales_order_header.creditcardid = credit_card.creditcardid -- Realiza um join entre as tabelas sales_order_header e credit_card
    where sales_order_header.creditcardid is not null -- Filtra apenas os valores não nulos da coluna creditcardid
)
select *
from dim_creditcard