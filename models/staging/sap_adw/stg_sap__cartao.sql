with
    cartao as (
        select 
            cast(creditcardid as int) as cartao_id
            , cast(cardtype as string) as tipo_cartao
            , cast(cardnumber as string) as numero_cartao
        from 
            {{ source('sap_adw', 'creditcard') }}
    )

select * from cartao