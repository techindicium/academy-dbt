-- cte com dados do cartão de crédito
with distinct_creditcardid as (
    select 
        distinct creditcardid -- seleciona valores distintos da coluna creditcardid
    from {{ ref('stg_sales_order_header') }} -- referência à tabela stg_sales_order_header
    where creditcardid is not null -- filtra apenas os valores não nulos da coluna creditcardid da stg_sales_order_header
)

, credit_card as (
        select
            * 
        from {{ ref('stg_creditcard') }}
)

, dim_creditcard as (
    select 
        row_number() over (order by sales_order_header.creditcardid) as creditcard_key  -- gera um número sequencial para cada linha (para criar uma chave-primária)
        , sales_order_header.creditcardid 
        , credit_card.cardtype 
    from distinct_creditcardid as sales_order_header
    left join credit_card 
        on sales_order_header.creditcardid = credit_card.creditcardid -- realiza um join entre as tabelas sales_order_header e credit_card
    where sales_order_header.creditcardid is not null -- filtra apenas os valores não nulos da coluna creditcardid
)

select *
from dim_creditcard

