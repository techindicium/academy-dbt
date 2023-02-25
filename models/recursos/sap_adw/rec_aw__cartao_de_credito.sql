with
    source_creditcard as(
        select
            creditcardid as id_cartao
            , cardtype as tipo_cartao
            --, cardnumber
            --, expmonth
            --, expyear
            --, modifieddate
        from {{ source('aw', 'creditcard') }}
    )

select *
from source_creditcard