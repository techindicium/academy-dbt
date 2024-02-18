with
    source_credit_card as (
        select
            cast(creditcardid as int) as id_credit_card
            , cast(cardtype as string) as card_type
            , cast(expyear as int) as expired_year
            , cast(expmonth as int) as expired_month
            , cast(cardnumber as int) as card_number
            , cast(left(cast(modifieddate as string), 10) as date) as modified_date
        from {{source('adw', 'creditcard' )}}
    )

select *
from source_credit_card