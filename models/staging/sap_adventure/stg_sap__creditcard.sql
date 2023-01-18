with
    source_creditcard as (
        select
            cast(creditcardid as int) as id_creditcard
            , cast(cardtype as string) as cardtype
            , cast(expyear as int) as expyear
            , cast(expmonth as int) as expmonth
            , cast(cardnumber as int) as cardnumber
            , cast(modifieddate as TIMESTAMP) as modifieddate
        from {{source('adw', 'creditcard' )}}
    )
    select *
    from source_creditcard